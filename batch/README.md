# Batch  Cheatsheet


## Input/Output
### Input
```bat
%1
:: file.bat argument-1
```
### Output
```bat
@echo off
echo Hello world
```

## Variables
```bat
set variable=Hello world
set /A number=5
set array=1 2 3 4 5
set obj[0].Name=None

echo %variable%
```

## Function
```bat
:function_x

	echo Nice

EXIT /B 0
```

## Loop
```bat
:: array
(for %%a in (%array%) do (
	echo %%a
))

:: obj
FOR /L %%i IN (0 1 2) DO  (
   call echo Name = %%obj[%%i].Name%%
	call echo Value = %%obj[%%i].ID%%
)
```

## If/else
```bat
if %x% == 2 (
	echo It's 2
) else (
	echo It's not 2
)

:: Exist, defined
if exist C:\file.txt (
	echo File exists
) else (
	echo File does not exist
)
```


## Others
### GOTO
```bat
goto :name

:name
	echo Nice
exit /b 0
```

### Date
```bat
echo %DATE% %TIME%
```

### Write to file
```bat
:: >  for create a write 
:: >> for write
echo text > ./file
```

### Size of array
```bat
set Arr[0]=1 
set Arr[1]=2 
set Arr[2]=3 
set Arr[3]=4 
set "x=0"

:SymLoop
if defined Arr[%x%] ( 
	call echo %%Arr[%x%]%% 
	set /a "x+=1"
	GOTO :SymLoop 
)
echo "The length of the array is" %x%
```
