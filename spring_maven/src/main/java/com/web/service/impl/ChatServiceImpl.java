package main.java.com.web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.java.com.web.dao.ChatDao;
import main.java.com.web.dto.ChatRoom;
import main.java.com.web.dto.Message;
import main.java.com.web.service.ChatService;



@Service("ChatService")
public class ChatServiceImpl implements ChatService{

	@Resource(name="ChatDao")
	private ChatDao chatDao;

    @Override
	public void createRoom(ChatRoom chatroom) throws Exception {
    	chatDao.createRoom(chatroom);
	}

	@Override
	public ChatRoom isRoom(ChatRoom chatroom) throws Exception {
		
//		ChatRoom roomvo = null;
//		roomvo = session.selectOne(namespace+".isRoom", chatroom);
//		System.out.println("ss");
//		System.out.println(roomvo);
//		
//		return roomvo;
		
		return chatDao.isRoom(chatroom);
	}



	@Override
	public void insertMessage(Message message) throws Exception {	
		chatDao.insertMessage(message);
	}



	@Override
	public String getPartner(ChatRoom chatroom) throws Exception {			
		return chatDao.getPartner(chatroom);
	}



	@Override
	public String getProfile(String str) throws Exception {
		return chatDao.getProfile(str);
	}



	@Override
	public String getName(String str) throws Exception {
		return chatDao.getName(str);
	}



	@Override
	public List<Message> getMessageList(String str) throws Exception {
		return chatDao.getMessageList(str);
	}



	@Override
	public List<ChatRoom> getRoomList(String str) throws Exception {
		return chatDao.getRoomList(str);
	}



	@Override
	public List<ChatRoom> getRoomList2(String str) throws Exception {
		return chatDao.getRoomList2(str);
	}



	@Override
	public Message getRecentMessage(String str) throws Exception {
		return chatDao.getRecentMessage(str);
	}



	@Override
	public String getTutorId(String str) throws Exception {
		return chatDao.getTutorId(str);
	}



	@Override
	public List<ChatRoom> getRoomListTutor(String str) throws Exception {
		return chatDao.getRoomListTutor(str);
	}



	@Override
	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		chatDao.updateReadTime(map);
	}



	@Override
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		
		
		return chatDao.getUnReadCount(map);
	}



	@Override
	public int getAllCount(String str) {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("USER_user_id", str);
		map.put("TUTOR_USER_user_id", str);
//		if(chatDao.getAllCount(map) == null) {
//			return 0;
//		}else {
			
			return chatDao.getAllCount(map);
		}
		
//	}



	@Override
	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		chatDao.updateReadTimeTutor(map);
	}



	@Override
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		
		
		return chatDao.getUnReadCountTutor(map);
	}


	
}
