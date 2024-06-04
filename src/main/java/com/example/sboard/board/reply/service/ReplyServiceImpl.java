package com.example.sboard.board.reply.service;

import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.mapper.ReplyMapper;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	private final ReplyMapper replyMapper;

	public ReplyServiceImpl(ReplyMapper replyMapper) {
		this.replyMapper = replyMapper;
	}


	@Override
	public Reply get(int replyNo) {
		return replyMapper.get(replyNo);
	}

	@Override
	public List<Reply> getAllByBoardNo(int boardNo) {
		return replyMapper.getAllByBoardNo(boardNo);
	}

	@Override
	public int getLastIndex() {
		return replyMapper.getLastIndex();
	}

	@Override
	public void insert(Reply reply) {
		replyMapper.insert(reply);
	}

	@Override
	public void delete(int replyNo) {
		replyMapper.delete(replyNo);
	}

}
