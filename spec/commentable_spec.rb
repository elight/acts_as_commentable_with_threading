require File.expand_path('./spec_helper', File.dirname(__FILE__))

describe "A class that is commentable" do
  it "can have many root comments" do
    expect(Commentable.new.comment_threads.respond_to?(:each)).to eq(true)
  end


  describe "when is destroyed" do
    def create_comment(props={})
      Comment.create! props.reverse_merge(:user => @user, :commentable => @commentable, :body => 'blargh')
    end

    def create_reply_to(parent, props={})
      child = Comment.new props.reverse_merge(:body => "This is a child", :commentable => @commentable, :user => @user)
      child.save!
      child.move_to_child_of(parent)
    end

    before :each do
      @user = User.create!
      @commentable = Commentable.create!
      @comment = create_comment
    end


    it "also destroys its root comments" do
      @commentable.destroy
      expect(Comment.all).not_to include(@comment)
    end

    it "also destroys its child comments" do
      child = create_reply_to @comment

      @commentable.destroy
      expect(Comment.all).not_to include(@comment)
      expect(Comment.all).not_to include(child)
    end

    it "also destroys its nested comments" do
      c2   = create_comment :body => "Two"
      c21  = create_reply_to c2,  :body => "Two-one"
      c211 = create_reply_to c21, :body => "Two-one-one"
      c3   = create_comment :body => "Three"

      expect { @commentable.destroy }.to change { Comment.count }.by(-5)
      Comment.all.should_not include(@comment)
      Comment.all.should_not include(c2)
      Comment.all.should_not include(c21)
      Comment.all.should_not include(c211)
      Comment.all.should_not include(c3)
    end
  end

  describe "special class finders" do
    before :each do
      @user = User.create!
      @commentable = Commentable.create!
      @other_commentable = Commentable.create!
    end

    describe "#find_comments_for" do
      before :each do
        @comment = Comment.create!(:user => @user, :commentable => @commentable, :body => 'blargh')

        @other_comment = Comment.create!(:user => @user, :commentable => @other_commentable, :body => 'hello')

        @comments = Commentable.find_comments_for(@commentable)
      end

      it "should return the comments for the passed commentable" do
        expect(@comments).to include(@comment)
      end

      it "should not return the comments for other commentables" do
        expect(@comments).not_to include(@other_comment)
      end
    end

    describe "#find_comments_by_user" do
      before :each do
        @user2 = User.create!

        @comment = Comment.create!(:user => @user, :commentable => @commentable, :body => 'blargh')

        @other_comment = Comment.create!(:user => @user2, :commentable => @other_commentable, :body => 'hello')

        @comments = Commentable.find_comments_by_user(@user)
      end

      it "should return comments by the passed user" do
        expect(@comments.all? { |c| c.user == @user }).to eq(true)
      end


      it "should not return comments by other users" do
        expect(@comments.any? { |c| c.user != @user }).to eq(false)
      end
    end
  end

  describe "instance methods" do
    describe "#comments_ordered_by_submitted" do
      before :each do
        @user = User.create!
        @commentable = Commentable.create!
        @other_commentable = Commentable.create!
        @comment = Comment.create!(:user => @user, :commentable => @commentable, :body => 'sup')
        @older_comment = Comment.create!(:user => @user, :commentable => @commentable, :body => 'sup', :created_at => 1.week.ago)
        @oldest_comment = Comment.create!(:user => @user, :commentable => @commentable, :body => 'sup', :created_at => 2.years.ago)
        @other_comment = Comment.create!(:user => @user, :commentable => @other_commentable, :body => 'sup')
        @comments = @commentable.comments_ordered_by_submitted
      end

      it "should return its own comments, ordered with the newest first" do
        expect(@comments.all? { |c| c.commentable_type == @commentable.class.to_s and c.commentable_id == @commentable.id }).to eq(true)
        @comments.each_cons(2) { |c, c2| expect(c.created_at).to be > c2.created_at }
      end

      it "should not include comments for other commentables" do
        expect(@comments.any? { |c| c.commentable_type != @commentable.class.to_s or c.commentable_id != @commentable.id }).to eq(false)
      end
    end
  end
end
