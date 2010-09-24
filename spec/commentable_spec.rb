require File.expand_path('./spec_helper', File.dirname(__FILE__))

describe "A class that is commentable" do
  it "can have many root comments" do
    Commentable.new.comment_threads.should be_a_kind_of(Enumerable)
  end

  describe "special class finders" do
    before :each do
      @user = User.create!
      @commentable = Commentable.create!
      @other_commentable = Commentable.create!
    end

    describe "#find_comments_for" do
      before :each do
        @comment = Comment.create!(:user => @user, :commentable_type => @commentable.class, :commentable_id => @commentable.id, :body => 'blargh')

        @other_comment = Comment.create!(:user => @user, :commentable_type => @other_commentable.class, :commentable_id => @other_commentable.id, :body => 'hello')

        @comments = Commentable.find_comments_for(@commentable)
      end

      it "should return the comments for the passed commentable" do
        @comments.should include(@comment)
      end

      it "should not return the comments for other commentables" do
        @comments.should_not include(@other_comment)
      end
    end

    describe "#find_comments_by_user" do
      before :each do
        @user2 = User.create!

        @comment = Comment.create!(:user => @user, :commentable_type => @commentable.class, :commentable_id => @commentable.id, :body => 'blargh')

        @other_comment = Comment.create!(:user => @user2, :commentable_type => @other_commentable.class, :commentable_id => @other_commentable.id, :body => 'hello')

        @comments = Commentable.find_comments_by_user(@user)
      end

      it "should return comments by the passed user" do
        @comments.all? { |c| c.user == @user }.should be_true
      end


      it "should not return comments by other users" do
        @comments.any? { |c| c.user != @user }.should be_false
      end
    end
  end
  
  describe "instance methods" do
    describe "#comments_ordered_by_submitted" do
      before :each do
        @user = User.create!
        @commentable = Commentable.create!
        @other_commentable = Commentable.create!
        @comment = Comment.create!(:user => @user, :commentable_type => @commentable.class, :commentable_id => @commentable.id, :body => 'sup')
        @older_comment = Comment.create!(:user => @user, :commentable_type => @commentable.class, :commentable_id => @commentable.id, :body => 'sup', :created_at => 1.week.ago)
        @oldest_comment = Comment.create!(:user => @user, :commentable_type => @commentable.class, :commentable_id => @commentable.id, :body => 'sup', :created_at => 2.years.ago)
        @other_comment = Comment.create!(:user => @user, :commentable_type => @other_commentable.class, :commentable_id => @other_commentable.id, :body => 'sup')
        @comments = @commentable.comments_ordered_by_submitted
      end
      
      it "should return its own comments, ordered with the newest first" do
        @comments.all? { |c| c.commentable_type == @commentable.class.to_s and c.commentable_id == @commentable.id }.should be_true
        @comments.each_cons(2) { |c, c2| c.created_at.should > c2.created_at }
      end
      
      it "should not include comments for other commentables" do
        @comments.any? { |c| c.commentable_type != @commentable.class.to_s or c.commentable_id != @commentable.id }.should be_false
      end
    end
  end
end
