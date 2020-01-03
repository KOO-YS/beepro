//매칭-사람 관련정보

package com.semi.vo;

public class MatchingPerVo {
   
   private int personal_seq;   //매칭 글의 글 번호
   private String user_id;      //글을 쓰는 사람 아이디
   private String skill;      //해당 지원자가 다룰 수 있는 언어 및 툴
   private String emp_category;   //프론트, 백 유무
   private String title;      //글 제목
   private String content;      //글 내용
   
   public MatchingPerVo() {}
   
   //요소 받을 때 personal_seq, user_id 꼭 필요한지 애들이랑 이야기해 보기
   
   public MatchingPerVo(int personal_seq, String user_id, String skill, String emp_category, String title,
         String content) {
      super();
      
      this.personal_seq = personal_seq;
      this.user_id = user_id;
      this.skill = skill;
      this.emp_category = emp_category;
      this.title = title;
      this.content = content;
   }
   
   
   public MatchingPerVo(String user_id, String skill, String emp_category, String title, String content) {
      super();
      this.user_id = user_id;
      this.skill = skill;
      this.emp_category = emp_category;
      this.title = title;
      this.content = content;
   }
   

   public int getPersonal_seq() {
      return personal_seq;
   }

   public void setPersonal_seq(int personal_seq) {
      this.personal_seq = personal_seq;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getSkill() {
      return skill;
   }

   public void setSkill(String skill) {
      this.skill = skill;
   }

   public String getEmp_category() {
      return emp_category;
   }

   public void setEmp_category(String emp_category) {
      this.emp_category = emp_category;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   @Override
   public String toString() {
      return "MatchingPerVo [personal_seq=" + personal_seq + ", user_id=" + user_id + ", skill=" + skill
            + ", emp_category=" + emp_category + ", title=" + title + ", content=" + content + "]";
   }
   
}