package models;

public class Post{

    private int blogid;
    private String profile;
    private String title;
    private String category;
    private String blog;
    private int postedById;
    private String postedByName;
    private String posteddate;
    private String status;

    public int getBlogid() {
        return blogid;
    }
    public void setBlogid(int blogid) {
        this.blogid = blogid;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public String getBlog() {
        return blog;
    }

    public void setBlog(String blog) {
        this.blog = blog;
    }

    public int getPostedById() {
        return postedById;
    }

    public void setPostedById(int postedById) {
        this.postedById = postedById;
    }
    public String getPostedByName() {
        return postedByName;
    }

    public void setPostedByName(String postedByName) {
        this.postedByName = postedByName;
    }
    public String getPosteddate() {
        return posteddate;
    }

    public void setPosteddate(String posteddate) {
        this.posteddate = posteddate;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "{" +
            " blogid='" + getBlogid() + "'" +
            ", profile='" + getProfile() + "'" +
            ", title='" + getTitle() + "'" +
            ", category='" + getCategory() + "'" +
            ", blog='" + getBlog() + "'" +
            ", postedById='" + getPostedById() + "'" +
            ", postedByName='" + getPostedByName() + "'" +
            ", posteddate='" + getPosteddate() + "'" +
            ", status='" + getStatus() + "'" +
            "}";
    }




}