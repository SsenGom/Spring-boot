package boot.data.mapper;

import java.util.List;

import boot.data.dto.BookDto;

public interface BookMapperInter {

	public int CountOfAllBook();
	public void insertOfBook(BookDto dto);
	public List<BookDto> ListOfAllBook();
	public BookDto getDataBook(String num);
	public void updateOfBook(BookDto dto);
	public void deleteOfBook(String num);
}
