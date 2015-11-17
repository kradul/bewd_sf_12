![BEWD_Logo](../assets/BEWD_Logo.png)

#Resources - Working Like A Developer

Class is over, but here are some extra resources.

## Class Slides

Slides will be on google drive in this folder: https://drive.google.com/folderview?id=0B4jTIYTi7VEYXzBMREF3VnpJSEU&usp=sharing

##Cheat Sheet

The terminal (command prompt on Windows) is the developer way of navigating your computer. You are probably used to using the graphical interface provided (Finder on a mac and MyComputer on Windows).

Here is a quick reference for some of the most common commands you will use in this class.
Remember when you see ```“$”``` or ```“C:\>”``` in these notes that is the prompt, don’t type it.

 		$  MAC
		C:\>  WINDOWS
		
####Special folders/direcotries

Users home directory, ex. /Users/katyaradul (go to home folder) 

	$ cd ~ 
	
Current directory
	
	$ ls .

Parent of the current directory (move up one folder)
	
	$ cd ..
		
####Navigation


How do I get into a folder?

  		$ cd folder_name
		C:\> cd folder_name

Use quotation marks if your folder name has spaces.

How do I get to the parent folder?

		$ cd ..
		C:\> cd ..

How do I see what is in the folder?

		$ ls
		C:\> dir


How do I know what folder I am in?

		$ pwd
		C:\> cd

How do I create a new folder?

		$ mkdir folder_name
		C:\> mkdir folder_name


####Deleting - (Proceed With Caution)

How do I delete a folder?

		$ rm -r folder_name
		c:\> rmdir folder-name

How do I delete a file?

		$ rm -f file_name
		C:\> del file_name

How do I move a file?

		$ mv file_name folder_name
		C:\> move file_name folder_name
The file is removed from the old location and moved to the new one.

You can rename a file the same way

		$ mv old_name new_name
		C:\> move old_name new_names


##Tips, Tricks & Motivation

__How is my instructor moving so fast?__

They’re using shortcuts in the command line.

Here are some to help you keep up (on Mac and Linux):

**Tab Completion**: Press Tab to complete folder and file names

**Control + a**: Go to the beginning of the line

**Control + e**: Go the the end of the line

**Option + b**: Move back one word

**Option + f**: Move forward one word

**Up/Down Arrow Keys**: Repeats previous commands

**Control + w**: Delete last word typed

**Control + u**: Delete last line typed

**Control + y**: Paste last deleted item

**Control + l**: Clear the screen




## Still Feel Lost? More resources

- [GitHub Cheat Sheet](https://na1.salesforce.com/help/doc/en/salesforce_git_developer_cheatsheet.pdf)
