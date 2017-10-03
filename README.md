# README

This is a prototype app to maintain songs and songbooks. Created to simplify searching favourite songs with chords at parties.

## Features

* create, read, update, delete: 
	* songs,
	* songbooks,
* user authentication:
	* user can create his songbook (which only him can see),
	* user can add songs to it (songs are from database availible to everyone),
	* guest can register new account at /sign_up
* search - user can search for songs

## Future features

* validation at adding and updating songs,
* beautiful layout,
* different font sizes (chosen by user),
* improved song.text input (TinyMCE probably or sth like that),
* improved chords display (dunno how-to yet),
* "print songbook" option - to generate complete songbook in .pdf format
* write tests,
* write layout using HAML instead of .erb

## To fix
- [ ] user can add multiple times same song to his songbook,
- [ ] user can't remove songs from his songbook without deleting them from main DB,
- [ ] anybody can create blank song object - needed validation,
- [ ] search field is case sensitive (should be insensitive - maybe regexp?),
- [ ] all users can do all CRUD operations - maybe some mods and admins?,
- [ ] duplicated notice/alert messages,
- [ ] some issues with layout on different browsers,