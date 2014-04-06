/*
Author: David Mast
Assignment: Final Project
Semester: Fall 2013
Course: CSCI-C490 Game Programming
Instructor: Dr. Vrajitoru
*/
package 
{
	import Math;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.system.System;
	import Constants;

	public class Level
	{
		static var parent,gameRef;
		public var levelWidth,levelHeight;
		public var offsetX,offsetY;
		public var playerInitialX,playerInitialY;
		var level,tileArray,lives;

		public function Level(theStage,theGame)
		{
			offsetX = 0;
			offsetY = 0;
			parent = theStage;
			gameRef = theGame;
			lives = gameRef.lives;
			newLevel();
		}

		//Change level in the Game class, calls newLevel()
		public function nextLevel()
		{
			gameRef.nextLevel();
		}

		//Set offsets and select the level to be built
		public function newLevel()
		{
			selectLevel();
			resetScreen();
			offsetX = 0;
			offsetY = 0;
		}

		//Resets to the starting point of the screen
		public function resetScreen()
		{
			moveWindow(-offsetX, -offsetY);
		}
		//Select level based on level number
		private function selectLevel()
		{
			switch (gameRef.levelNum)
			{
				case 1 :
					allocateLevel(Constants.levelOneWidth, Constants.levelOneHeight, Constants.levelOne);
					playerInitialX = Constants.levelOneStartX;
					playerInitialY = Constants.levelOneStartY;
					buildLevel();
					break;
				case 2 :
					allocateLevel(Constants.levelTwoWidth, Constants.levelTwoHeight, Constants.levelTwo);
					playerInitialX = Constants.levelTwoStartX;
					playerInitialY = Constants.levelTwoStartY;
					buildLevel();
					break;
				case 3 :
					allocateLevel(Constants.levelThreeWidth, Constants.levelThreeHeight, Constants.levelThree);
					playerInitialX = Constants.levelThreeStartX;
					playerInitialY = Constants.levelThreeStartY;
					buildLevel();
					break;
				case 4 :
					allocateLevel(Constants.levelFourWidth, Constants.levelFourHeight, Constants.levelFour);
					playerInitialX = Constants.levelFourStartX;
					playerInitialY = Constants.levelFourStartY;
					buildLevel();
					break;
				case 5 :
					allocateLevel(Constants.levelFiveWidth, Constants.levelFiveHeight, Constants.levelFive);
					playerInitialX = Constants.levelFiveStartX;
					playerInitialY = Constants.levelFiveStartY;
					buildLevel();
					break;
				default :
					return;
			}
			return;
		}

		public function allocateLevel(w,h,newLevel)
		{
			levelWidth = w;
			levelHeight = h;
			level = new Array(levelWidth);
			var k = 0;

			for (var i = 0; i < levelWidth; i++)
			{
				level[i] = new Array(levelHeight);
				for (var j = 0; j < levelHeight; j++)
				{
					level[i][j] = newLevel[k + (j * levelWidth)];
				}
				k++;
			}
		}

		public function deallocateLevel()
		{
			for (var i = 0; i < levelWidth; i++)
			{
				level[i] = new Array(levelHeight);
				for (var j = 0; j < levelHeight; j++)
				{
					if (tileArray[i][j] != null)
					{
						parent.removeChild(tileArray[i][j]);
						tileArray[i][j] = null;
					}
				}
				level[i] = null;
				tileArray[i] = null;
			}
			level = null;
			tileArray = null;
			System.gc();
		}
		// build the level sprites
		public function buildLevel()
		{
			var i,j,spr;

			tileArray = new Array(levelWidth);
			for (i = 0; i < levelWidth; i++)
			{
				tileArray[i] = new Array(levelHeight);
				for (j = 0; j < levelHeight; j++)
				{
					switch (level[i][j])
					{
						case 1 :
						case 2 :
						case 3 :
						case 4 :
							spr = makeSprite(selectSprite(level[i][j]),Constants.levelTileSize);
							placeSprite(spr,i * Constants.levelTileSize - offsetX * Constants.levelTileSize,j * Constants.levelTileSize - offsetY * Constants.levelTileSize);
							tileArray[i][j] = spr;
							break;
						default :
							tileArray[i][j] = null;
							break;
					}
				}
			}
		}

		public function restartLevel()
		{
			gameRef.lives--;
			lives = gameRef.lives;

			deallocateLevel();
			newLevel();
			updateTextBox();
			parent.removeChild(gameRef.levelTextBox);
			parent.addChild(gameRef.levelTextBox);
			gameRef.character.newLevel();
		}


		static public function makeSprite(bmpName,spriteW)
		{
			// find the width and height of the bitmap from the object properties
			var bmpW = bmpName.width;
			var bmpH = bmpName.height;

			var sprite = new Sprite  ;
			var factor = 1.0 * spriteW;
			factor /=  bmpW;
			var sclMatrix = new Matrix  ;
			sclMatrix.identity();
			sclMatrix.scale(factor,factor);
			sprite.graphics.beginBitmapFill(bmpName,sclMatrix);
			sprite.graphics.drawRect(0,0,spriteW,bmpH * factor);
			sprite.graphics.endFill();
			parent.addChild(sprite);
			return sprite;
		}

		// place the sprite at a given position
		public function placeSprite(sprite,xVal,yVal)
		{
			sprite.x = xVal;
			sprite.y = yVal;
		}

		// move a sprite by the given number of pixels
		static public function moveSprite(sprite,xVal,yVal)
		{
			sprite.x +=  xVal;
			sprite.y +=  yVal;
		}

		// check if the level cell at the given position is a space
		public function checkSpace(xVal,yVal)
		{
			var i,j;
			i = int((offsetX + (xVal / Constants.levelTileSize)));
			j = int((offsetY + (yVal / Constants.levelTileSize)));
			if (((i < 0) || i >= Constants.levelTileSize))
			{
				return 0;
			}
			else if (((j < 0) || j >= Constants.levelTileSize))
			{
				return 0;
			}
			else if (level[i][j] == 0)
			{
				return 1;
			}
			else if (level[i][j] == 2)
			{
				return 2;
			}
			else if (level[i][j] == 3)
			{
				return 3;
			}
			else if (level[i][j] == 4)
			{
				return 4;
			}
			else
			{
				return 0;
			}
		}
		// move the window by a number of tiles when the player gets close to the border
		public function moveWindow(tilesX,tilesY)
		{
			if (((offsetX + tilesX) < -2))
			{
				return false;
			}
			if (((offsetX + tilesX) > levelWidth + 1))
			{
				return false;
			}
			if (((offsetY + tilesY) < -2))
			{
				return false;
			}
			if (((offsetY + tilesY) > levelHeight + 1))
			{
				return false;
			}
			offsetX +=  tilesX;
			offsetY +=  tilesY;
			for (var i = 0; i < levelWidth; i++)
			{
				for (var j = 0; j < levelHeight; j++)
				{
					if (tileArray[i][j] != null)
					{
						moveSprite(tileArray[i][j], -  tilesX * Constants.levelTileSize, -  tilesY * Constants.levelTileSize);
					}
				}
			}
			return true;
		}


		public function updateTextBox()
		{
			gameRef.levelTextBox.text = "Level " + gameRef.levelNum + " Lives: " + lives;
		}

		public function selectSprite(choice)
		{
			var sprite;

			switch (choice)
			{
				case Constants.rainbowBrick :
					sprite = new RainbowBrickBmp  ;
					break;
				case Constants.exitSign :
					sprite = new ExitSignBmp  ;
					break;
				case Constants.spikes :
					sprite = new SpikesBmp  ;
					break;
				case Constants.upsidedownSpikes :
					sprite = new UpsidedownSpikesBmp  ;
					break;
				default :
					sprite = new RainbowBrickBmp  ;
					break;
			}
			return sprite;
		}

		public function gameOver()
		{
			gameRef.gameOver();
		}
	}
}