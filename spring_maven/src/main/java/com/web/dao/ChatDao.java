package main.java.com.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.java.com.web.dto.ChatRoom;
import main.java.com.web.dto.Message;

@Repository("ChatDao")
public class ChatDao {

	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	public void createRoom(ChatRoom chatroom) {
		sqlSession.insert("Chat.createRoom", chatroom);	
		
	}

	public ChatRoom isRoom(ChatRoom chatroom) {
		return sqlSession.selectOne("Chat.isRoom", chatroom);
	}

	public void insertMessage(Message message) {
		sqlSession.insert("Chat.insertMessage", message);
	}

	public String getPartner(ChatRoom chatroom) {
		return sqlSession.selectOne("Chat.getPartner", chatroom);
	}

	public String getProfile(String str) {
		return sqlSession.selectOne("Chat.isRoom", str);
	}

	public String getName(String str) {
		return sqlSession.selectOne("Chat.isRoom", str);
	}

	public List<Message> getMessageList(String str) {
		return sqlSession.selectList("Chat.getMessageList", str);
	}

	public List<ChatRoom> getRoomList(String str) {
		return sqlSession.selectList("Chat.getRoomList", str);
	}

	public List<ChatRoom> getRoomList2(String str) {
		return sqlSession.selectList("Chat.getRoomList2", str);
	}

	public Message getRecentMessage(String str) {
		return sqlSession.selectOne("Chat.getRecentMessage", str);
	}

	public String getTutorId(String str) {
		return sqlSession.selectOne("Chat.getTutorId", str);
	}

	public List<ChatRoom> getRoomListTutor(String str) {
		return sqlSession.selectList("Chat.getRoomListTutor", str);
	}

	public void updateReadTime(HashMap<String, Object> map) {
		sqlSession.update("Chat.updateReadTime", map);
		
	}

	public int getUnReadCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("Chat.getUnReadCount", map);
	}

	public int getAllCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("Chat.getAllCount", map);
	}

	public void updateReadTimeTutor(HashMap<String, Object> map) {
		sqlSession.update("Chat.updateReadTimeTutor", map);
		
	}

	public int getUnReadCountTutor(HashMap<String, Object> map) {
		return sqlSession.selectOne("Chat.getUnReadCountTutor", map);
	}
    
   
}
