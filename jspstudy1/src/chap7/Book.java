package chap7;

// 빈 (Bean) 클래스
// 멤버변수는 private 접근제어자를 사용.
// 멤버메서드는 public 이고, setter, getter 로 이루어짐.
public class Book {
   private String writer; // 멤버변수. 프로퍼티 아님.
   private String title;
   private String content;
   
   // getter, setter
   // set property : setXxx : xxx 프로퍼티임.
   // get property : getXxx : xxx 프로퍼티임.
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
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
   
}