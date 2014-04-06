/*
Author: David Mast
Assignment: Final Project
Semester: Fall 2013
Course: CSCI-C490 Game Programming
Instructor: Dr. Vrajitoru
*/
package 
{
	import flash.utils.Timer;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.events.*;
	import flash.text.*;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.geom.Matrix;
	import Level;
	import flashx.textLayout.formats.Float;
	import fl.controls.Button;

	public class Player
	{
		var _stage;
		public var playerSprite;
		var playerWidth,playerHeight,DocWidth;
		var posX,posY;
		var playerTimer;
		var keyPressed,moving,speedX,speedY,moveCounter,inAir,falling,jumpLimit;
		var lives,lastKeyPressed,gameIsWon;
		var countDown,countDownShow;
		var levelRef;

		// Constructor: builds the sprites, 
		// sets up the timer and keyboard events.
		public function Player(theStage,theLevel)
		{
			_stage = theStage;
			playerWidth = 45;
			speedX = 1;
			speedY = 0;
			moveCounter = 0;
			levelRef = theLevel;
			lives = levelRef.lives;
			gameIsWon = false;
			makeSprite();

			initialPlacePlayer();
			_stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
			_stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
			playerTimer = new Timer(5);
			playerTimer.addEventListener(TimerEvent.TIMER,moveHandler);
			inAir = false;
			moving = false;
			falling = false;
		}

		// intial position of the player
		public function initialPlacePlayer()
		{
			posX = levelRef.playerInitialX;
			posY = levelRef.playerInitialY;
			placePlayerSprite(posX,posY);
		}

		// creates the Player sprite and adds it to the _stage
		function makeSprite()
		{
			var tile:BitmapData = new CharacterBmp  ;
			playerSprite = Level.makeSprite(tile,playerWidth);
			playerHeight = tile.height * playerWidth / tile.width;// calculate the height
			trace(playerHeight);
			_stage.addChild(playerSprite);
		}

		// Place the Player sprite at a given position.
		public function placePlayerSprite(px,py)
		{
			playerSprite.x = px;
			playerSprite.y = py;
		}

		function keyDownHandler(event:KeyboardEvent)
		{
			if (lives > 0 && gameIsWon == false)
			{
				switch (event.keyCode)
				{
					case Constants.arrowRight :
					case Constants.arrowDown :
					case Constants.arrowLeft :
					case Constants.arrowUp :
						lastKeyPressed = keyPressed;
						keyPressed = event.keyCode;
						if (! moving)
						{
							moving = true;
							playerTimer.start();
						}
						break;
					case Constants.spacebar :
						spaceBarHandler();
						lastKeyPressed = keyPressed;
						keyPressed = event.keyCode;
						break;
				}
			}
		}

		// When the key is released, stop the moving timer.
		function keyUpHandler(event:KeyboardEvent)
		{
			if (event.keyCode != Constants.spacebar)
			{
				keyPressed = Constants.spacebar;
				moving = false;
				moveCounter = 0;
				speedX = 1;
			}
		}

		private function moveHandler(ev:TimerEvent)
		{
			if (lives > 0 && gameIsWon == false)
			{
				if (moving)
				{
					movePlayer();
				}
				else if (inAir)
				{
					if (falling)
					{
						playerFalling();
					}
					else
					{
						playerJump();
					}
					placePlayerSprite(posX, posY);
				}
				else
				{
					playerTimer.stop();
				}
				checkDeath();
				checkLevelOver();
			}
		}

		// Actually moving the Player.
		private function movePlayer()
		{
			switch (keyPressed)
			{
				case Constants.arrowLeft :
					moveLeft();
					break;
				case Constants.arrowRight :
					moveRight();
					break;
			}
			moveCounter++;

			increaseSpeed();

			if (inAir)
			{
				if (falling)
				{
					playerFalling();
				}
				else
				{
					playerJump();
				}
			}
			else if (canMoveDown())
			{
				inAir = true;
				falling = true;
				speedY = Constants.gravity;
				playerFalling();
			}

			checkScreenHorizontal();
			checkScreenVertical();
			placePlayerSprite(posX,posY);
		}

		//Change the speed based on moveCounter
		private function increaseSpeed()
		{
			if ((moveCounter > 3))
			{
				speedX = 2;
			}
			if ((moveCounter > 5))
			{
				speedX = 3;
			}
		}

		//Check to see if the screen needs to be moved horizontally
		private function checkScreenHorizontal()
		{
			if ((posX <= Constants.levelTileSize))
			{
				if (levelRef.moveWindow(-4,0))
				{
					posX +=  4 * Constants.levelTileSize;
				}
			}
			else if ((posX >= _stage.stageWidth - Constants.levelTileSize))
			{
				if (levelRef.moveWindow(4,0))
				{
					posX -=  4 * Constants.levelTileSize;
				}
			}
		}

		//Check to see if the screen needs to be moved vertically
		private function checkScreenVertical()
		{
			if ((posY <= Constants.levelTileSize))
			{
				if (levelRef.moveWindow(0,-3))
				{
					posY +=  3 * Constants.levelTileSize;
				}
			}
			else if ((posY >= _stage.stageHeight - Constants.levelTileSize))
			{
				if (levelRef.moveWindow(0,3))
				{
					posY -=  3 * Constants.levelTileSize;
				}
			}
		}

		// Moving the Player left. 
		public function moveLeft()
		{
			if ((posX > 0))
			{
				posX -=  speedX;
				if (canMoveLeft())
				{
					placePlayerSprite(posX,posY);
				}
				else
				{
					posX +=  speedX;
				}
			}

		}

		// Moving the Player right. 
		public function moveRight()
		{
			if ((posX < _stage.stageWidth - playerWidth))
			{
				posX +=  speedX;
				if (canMoveRight())
				{
					placePlayerSprite(posX,posY);
				}
				else
				{
					posX -=  speedX;
				}
			}

		}

		//Move the Player up.
		public function moveUp()
		{
			if (posY > 0)
			{
				posY -=  speedX;
				if (canMoveUp())
				{
					placePlayerSprite(posX, posY);
				}
				else
				{
					posY +=  speedX;
				}
			}

		}

		// Moving the Player down.
		public function moveDown()
		{
			if (posY < _stage.stageHeight - playerHeight)
			{
				posY +=  speedX;
				if (canMoveDown())
				{
					placePlayerSprite(posX, posY);
				}
				else
				{
					posY -=  speedX;
				}
			}

		}

		//Check to see if the Player can move up
		private function canMoveUp()
		{
			if (levelRef.checkSpace(posX,posY) && levelRef.checkSpace(posX + playerWidth, posY))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//Check to see if the Player can move down
		private function canMoveDown()
		{
			if (levelRef.checkSpace(posX,posY + playerHeight) && levelRef.checkSpace(posX + playerWidth, posY + playerHeight))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//Check to see if the Player can move left
		private function canMoveLeft()
		{
			if (levelRef.checkSpace(posX,posY) && levelRef.checkSpace(posX,posY + .85 * playerHeight))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//Check to see if the Player can move right
		private function canMoveRight()
		{
			if (levelRef.checkSpace(posX + playerWidth, posY) && levelRef.checkSpace(posX + playerWidth, posY + .85 * playerHeight))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//Adjust the Player vertically
		private function playerJump()
		{
			posY -=  speedY;
			jumpLimit -=  2;

			if (! canMoveUp())
			{
				speedY = 0;
				posY +=  speedY + 1 / 40;
				speedY = Constants.gravity;
				falling = true;
			}
			else if (jumpLimit == 0)
			{
				speedY = Constants.gravity;
				falling = true;
			}
		}

		private function playerFalling()
		{
			posY +=  speedY;
			if (! canMoveDown())
			{
				inAir = false;
				falling = false;
				speedY = 0;
			}
		}

		//Handles the spacebar being pressed
		//If the player is not in the air then start a jump
		//Starts playerTimer, resets speedY
		public function spaceBarHandler()
		{
			if (inAir == false)
			{
				if (moving)
				{
					keyPressed = lastKeyPressed;
				}
				jumpLimit = 100;
				inAir = true;
				if (! playerTimer.running)
				{
					playerTimer.start();
				}
				speedY = Constants.jump;
			}
		}

		//Place player on new level
		public function newLevel()
		{
			_stage.removeChild(playerSprite);
			_stage.addChild(playerSprite);
			initialPlacePlayer();
		}

		//Check to see if the player is dead
		private function checkDeath()
		{
			if (levelRef.checkSpace(posX + (playerWidth / 2), posY + playerHeight) == 3 || levelRef.checkSpace(posX, posY) == 4 || levelRef.checkSpace(posX + playerWidth, posY) == 4)
			{
				if (lives > 1)
				{
					levelRef.restartLevel();
					lives = levelRef.lives;
					moving = false;
					inAir = false;
					falling = false;
					speedY = 0
					speedX = 1;
				}
				else
				{
					lives--;
					falling = false;
					moving = false;
					if (playerTimer.running)
					{
						playerTimer.stop();
					}
					levelRef.gameOver();
				}
			}
		}

		//Check to see if 
		private function checkLevelOver()
		{
			if (levelRef.checkSpace(posX + (playerWidth / 2), posY + (playerHeight / 2)) == 2)
			{
				levelRef.nextLevel();
			}
		}

		public function gameWon()
		{
			gameIsWon = true;
		}
	}
}