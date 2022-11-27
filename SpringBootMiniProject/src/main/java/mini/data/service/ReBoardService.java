package mini.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.data.dto.ReBoardDto;
import mini.data.mapper.ReBoardMapperInter;

@Service
public class ReBoardService implements ReBoardServiceInter {

	@Autowired
	ReBoardMapperInter mapperInter;
	
	@Override
	public int getReTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapperInter.getReTotalCount(map);
	}

	@Override
	public int getReMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getReMaxNum();
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		mapperInter.updateRestep(map);
	}

	@Override
	public void insertReBoard(ReBoardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum(); //0:새글 1보다큰값:답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) //새글 
		{
			regroup=getReMaxNum()+1; //num의 최대값+1
			restep=0;
			relevel=0;
			
		}else {
			//같은 그룹중에서 전달받은 restep보다 큰 글들은 모두 +1
			updateRestep(regroup, restep);
			//전달받은 스텝과 레벨은 모두 1증가
			restep++;
			relevel++;
		}
		
		//바뀐값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		mapperInter.insertReBoard(dto);
	}

	@Override
	public List<ReBoardDto> getReList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);

		return mapperInter.getReList(map);
	}

	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadcount(num);
	}

	@Override
	public ReBoardDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		mapperInter.likesUpdate(num);
	}



}
