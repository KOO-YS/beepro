//회원정보 관련 정보

package com.semi.vo;

public class UserVo {
		private String u_id;
		private String u_name;
		private String u_pwd;
		private String u_email;
		private String u_local;
		private String u_emailhash;
		private String u_emailck;
		private String u_photo;
		
		public UserVo() {}
		
		public UserVo(String u_id, String u_name, String u_pwd, String u_email, String u_local, String u_emailhash,
				String u_emailck, String u_photo) {
			super();
			this.u_id = u_id;
			this.u_name = u_name;
			this.u_pwd = u_pwd;
			this.u_email = u_email;
			this.u_local = u_local;
			this.u_emailhash = u_emailhash;
			this.u_emailck = u_emailck;
			this.u_photo= u_photo;
		}
		
		public UserVo(String u_id,String u_name,  String u_pwd, String u_email,  String u_emailhash, String u_emailck, String u_photo) {
			super();
			this.u_id = u_id;
			this.u_name = u_name;
			this.u_pwd = u_pwd;
			this.u_email = u_email;
			this.u_emailhash = u_emailhash;
			this.u_emailck = u_emailck;
			this.u_photo= u_photo;

		}

		public UserVo(String u_id, String u_name, String u_email, String u_local) {
			super();
			this.u_id = u_id;
			this.u_name = u_name;
			this.u_email = u_email;
			this.u_local = u_local;
		}

		public UserVo( String u_name, String u_pwd, String u_email) {
			super();

			this.u_name = u_name;
			this.u_pwd = u_pwd;
			this.u_email = u_email;
		}
		
		public String getU_id() {
			return u_id;
		}

		public void setU_seq(String u_id) {
			this.u_id = u_id;
		}

		public String getU_name() {
			return u_name;
		}

		public void setU_name(String u_name) {
			this.u_name = u_name;
		}

		public String getU_pwd() {
			return u_pwd;
		}

		public void setU_pwd(String u_pwd) {
			this.u_pwd = u_pwd;
		}

		public String getU_email() {
			return u_email;
		}

		public void setU_email(String u_email) {
			this.u_email = u_email;
		}

		public String getU_local() {
			return u_local;
		}

		public void setU_local(String u_local) {
			this.u_local = u_local;
		}

		public String getU_emailhash() {
			return u_emailhash;
		}


		public void setU_emailhash(String u_emailhash) {
			this.u_emailhash = u_emailhash;
		}


		public String getU_emailck() {
			return u_emailck;
		}

		public void setU_emailck(String u_emailck) {
			this.u_emailck = u_emailck;
		}

		public String getU_photo() {
			return u_photo;
		}

		public void setU_photo(String u_photo) {
			this.u_photo = u_photo;
		}

		@Override
		public String toString() {
			return "UserVo [u_id=" + u_id + ", u_name=" + u_name + ", u_email=" + u_email + ", u_local=" + u_local
					+ "]";
		}
		
		
	}