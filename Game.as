/*
Author: David Mast
Assignment: Final Project
Semester: Fall 2013
Course: CSCI-C490 Game Programming
Instructor: Dr. Vrajitoru
*/
package 
{

	import Level;
	import Player;
	import flash.text.*;
	import flash.text.TextField;
	import flash.display.*;

	public class Game
	{
		var character;
		var level;
		var levelNum, lives;
		var levelTextBox;
		var parent;

		public function Game(theStage)
		{
			levelNum = 1;
			lives = 3;
			parent = theStage;
			level = new Level(parent,this);
			character = new Player(parent,level);
			levelTextBox = makeTextBox(parent);
			levelTextBox.text = "Level: " + levelNum + " Lives: " + lives;

		}
		public function startLevel()
		{
			level.newLevel();
			character.placePlayer();
		}

		static function makeTextBox(parent)
		{
			var countDownShow = new TextField  ;
			countDownShow.x = 14;
			countDownShow.y = 4;
			countDownShow.width = 200;
			countDownShow.height = 28;
			var format:TextFormat = new TextFormat  ;
			format.font = "Times";
			format.color = 0x000000;
			format.size = 24;
			countDownShow.defaultTextFormat = format;
			parent.addChild(countDownShow);
			countDownShow.text = "";
			return countDownShow;
		}

		public function nextLevel()
		{
			level.deallocateLevel();
			levelNum++;
			if ((levelNum < 6))
			{
				level.newLevel();
				levelTextBox.text = "Level " + levelNum+ " Lives: " + lives;
				parent.removeChild(levelTextBox);
				parent.addChild(levelTextBox);
				character.newLevel();
			}
			else
			{
				gameWon();
				character.gameWon();
			}
		}
		
		public function gameOver()
		{
			levelTextBox.x = int((parent.stageWidth - levelTextBox.width) / 2);
			levelTextBox.y = int((parent.stageHeight - levelTextBox.height) / 2);
			levelTextBox.text = "Game Over!"
		}
		
		public function gameWon()
		{
			levelTextBox.x = int((parent.stageWidth - levelTextBox.width) / 2);
			levelTextBox.y = int((parent.stageHeight - levelTextBox.height) / 2);
			levelTextBox.text = "Game Won! :)";
		}
	}

}