@echo off

:: HTML Template
echo	^<!DOCTYPE html^> > ./index.html
echo	^<html^> >> ./index.html
echo		^<head^> >> ./index.html
echo			^<meta charset="UTF-8"^> >> ./index.html
echo			^<title^> Title ^</title^> >> ./index.html
echo			^<link rel="stylesheet" href="./style.css"^> >> ./index.html
echo			^<script src="./index.js" defer^>^</script^> >> ./index.html
echo		^</head^> >> ./index.html
echo		^<body^> >> ./index.html
echo		^</body^> >> ./index.html
echo	^</html^> >> ./index.html

:: CSS Template
echo	* {> ./style.css
echo		margin: 0; >> ./style.css
echo		padding: 0; >> ./style.css
echo	} >> ./style.css
echo. >> ./style.css
echo	body { >> ./style.css
echo		background: rgb(45,45,45); >> ./style.css
echo	} >> ./style.css

:: JavaScript file
echo. > ./index.js

:: Update
@echo on
echo Files were successfully created
