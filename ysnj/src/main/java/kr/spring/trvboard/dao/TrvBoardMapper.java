package kr.spring.trvboard.dao;
		
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.trvboard.vo.TrvBoardVO;

public interface TrvBoardMapper {
	//글쓰기
	@Insert("INSERT INTO trv_board (trv_num,mem_num,trv_local,trv_cate,trv_title,trv_intro,trv_date,trv_place,trv_call,trv_uploadfile1,trv_filename1,trv_uploadfile2,trv_filename2,trv_uploadfile3,trv_filename3,trv_uploadfile4,trv_filename4,trv_uploadfile5,trv_filename5) VALUES (trvboard_seq.nextval,#{mem_num},#{trv_local},#{trv_cate},#{trv_title},#{trv_intro},SYSDATE,#{trv_place},#{trv_call},#{trv_uploadfile1},#{trv_filename1},#{trv_uploadfile2},#{trv_filename2},#{trv_uploadfile3},#{trv_filename3},#{trv_uploadfile4},#{trv_filename4},#{trv_uploadfile5},#{trv_filename5})")
	public void insertTrvBoard(TrvBoardVO trvboard);
	
	//총 레코드 수
	public int selectRowCount();
	
	//글 목록
	public List<TrvBoardVO> selectList(Map<String,Object> map);
	
	//글 상세 페이지
	@Select("SELECT * FROM trv_board t JOIN member m ON t.mem_num=m.mem_num WHERE trv_num = #{trvboard_num}" )
	public TrvBoardVO selectTrvBoard(Integer trvboard_num);
	
	//글 수정
	@Update("UPDATE trv_board SET trv_local=#{trv_local},trv_cate=#{trv_cate},trv_title=#{trv_title},trv_intro=#{trv_intro},trv_date=SYSDATE,trv_place=#{trv_place},trv_call=#{trv_call},trv_uploadfile1=#{trv_uploadfile1},trv_filename1=#{trv_filename1},trv_uploadfile2=#{trv_uploadfile2},trv_filename2=#{trv_filename2},trv_uploadfile3=#{trv_uploadfile3},trv_filename3=#{trv_filename3},trv_uploadfile4=#{trv_uploadfile4},trv_filename4=#{trv_filename4},trv_uploadfile5=#{trv_uploadfile5},trv_filename5=#{trv_filename5} WHERE trv_num=#{trv_num}")
	public void updateTrvBoard(TrvBoardVO trvboard);
	
	//글 삭제
	@Delete("DELETE FROM trv_board WHERE trv_num=#{trvboard_num}")
	public void deleteTrvBoard(Integer trvboard_num);
	
}
