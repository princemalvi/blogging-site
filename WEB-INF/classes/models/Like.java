package models;

public class Like{
    private int postid;
    private int likedBy;
    private int total;

    public int getPostid() {
        return postid;
    }
    public void setPostid(int postid) {
        this.postid = postid;
    }


    public int getLikedBy() {
        return likedBy;
    }

    public void setLikedBy(int likedBy) {
        this.likedBy = likedBy;
    }

}


