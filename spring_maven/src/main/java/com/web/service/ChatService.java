package main.java.com.web.service;

import java.util.List;

import main.java.com.web.dto.ChatRoom;
import main.java.com.web.dto.Message;

public interface ChatService {

	public void createRoom(ChatRoom chatroom)throws Exception;
	public ChatRoom isRoom(ChatRoom chatroom)throws Exception;
	public void insertMessage(Message message)throws Exception;
	public String getPartner(ChatRoom chatroom)throws Exception;
	public String getProfile(String str)throws Exception;
	public String getName(String str)throws Exception;
	public List<Message> getMessageList(String str)throws Exception;
	public List<ChatRoom> getRoomList(String str)throws Exception;
	public List<ChatRoom> getRoomList2(String str)throws Exception;
	public Message getRecentMessage(String str)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	
	public String getTutorId(String str)throws Exception;
	public List<ChatRoom> getRoomListTutor(String str)throws Exception;
	public void updateReadTime(int class_id , String user_id , String TUTOR_USER_user_id)throws Exception;
	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id)throws Exception;
	
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id)throws Exception;
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id)throws Exception;
	
	public int getAllCount(String str);
}
