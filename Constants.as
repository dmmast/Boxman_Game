/*
Author: David Mast
Assignment: Final Project
Semester: Fall 2013
Course: CSCI-C490 Game Programming
Instructor: Dr. Vrajitoru
*/
package  {
	
	public class Constants {
		//Level One constants
		static public const levelOne:Array = 
		[ 
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
		1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
		1,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
		];
		static public const levelOneHeight:Number = 10;
		static public const levelOneWidth:Number = 30;
		static public const levelOneStartX:Number = levelTileSize;
		static public const levelOneStartY:Number = (levelOneHeight * levelTileSize) -  2 * levelTileSize  + 10;

		//Level Two constants
		static public const levelTwo:Array = 		
		[ 
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,1,
		1,0,1,1,0,1,0,0,1,1,0,0,0,1,1,0,0,0,0,1,0,0,0,1,0,1,1,0,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1
		];
		static public const levelTwoHeight:Number = 10;
		static public const levelTwoWidth:Number = 30;
		static public const levelTwoStartX:Number = 2 * levelTileSize;
		static public const levelTwoStartY:Number = (levelTwoHeight * levelTileSize) -  6 * levelTileSize + 10;

		//Level Three constants
		static public const levelThree:Array = 
		[
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,4,1,1,1,1,1,1,1,1,1,1,1,4,0,0,0,0,0,0,4,4,1,1,1,1,1,1,1,1,
		1,0,4,1,1,1,1,1,1,1,1,1,4,0,0,0,0,0,0,0,0,0,0,4,4,1,1,1,1,1,
		1,0,0,4,1,1,1,1,1,1,1,4,0,0,0,1,1,0,0,0,0,0,0,0,0,0,4,4,1,1,
		1,0,0,0,4,1,1,1,1,1,4,0,0,0,1,1,1,1,0,1,1,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,4,1,1,1,4,0,0,0,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,2,1,
		1,1,1,0,0,0,4,1,4,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,
		1,1,1,1,0,0,0,4,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,1
		];
		static public const levelThreeHeight:Number = 10;
		static public const levelThreeWidth:Number = 30;
		static public const levelThreeStartX:Number = levelTileSize;
		static public const levelThreeStartY:Number = (levelTwoHeight * levelTileSize) -  6 * levelTileSize  + 10;
		
		//Level Four constants
		static public const levelFour:Array = 
		[ 
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
		1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,
		1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,1,0,1,0,3,1,3,3,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,1,
		1,1,1,3,1,3,1,1,1,1,0,1,0,1,0,0,0,1,1,0,0,1,3,3,3,1,1,0,1,1,
		1,1,1,1,1,1,1,1,1,1,3,1,3,1,3,3,3,1,1,3,3,1,1,1,1,1,1,3,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
		];
		static public const levelFourHeight:Number = 10;
		static public const levelFourWidth:Number = 30;
		static public const levelFourStartX:Number = levelTileSize;
		static public const levelFourStartY:Number = (levelFourHeight * levelTileSize) -  9 * levelTileSize  + 10;
		
		//Level Five
		static public const levelFive:Array = 
		[ 
		1,1,1,1,1,1,1,1,1,1,
		1,0,0,0,0,0,0,0,2,1,
		1,1,1,1,0,1,1,1,1,1,
		1,4,4,0,0,0,0,4,4,1,
		1,0,0,0,1,0,0,0,0,1,
		1,0,0,0,0,0,0,0,0,1,
		1,0,0,0,0,0,0,1,1,1,
		1,0,0,0,0,0,0,0,4,1,
		1,0,0,0,1,0,0,0,0,1,
		1,1,0,0,0,0,0,0,0,1,
		1,1,1,0,0,0,0,1,1,1,
		1,4,0,0,0,0,0,0,4,1,
		1,0,0,0,0,1,1,0,0,1,
		1,0,0,0,0,0,4,0,0,1,
		1,1,1,0,0,0,0,0,0,1,
		1,4,0,0,1,1,0,0,0,1,
		1,0,0,0,0,0,0,0,0,1,
		1,0,1,1,0,0,0,0,0,1,
		1,0,0,0,3,3,3,3,3,1,
		1,1,1,1,1,1,1,1,1,1
		];
		static public const levelFiveHeight:Number = 20;
		static public const levelFiveWidth:Number = 10;
		static public const levelFiveStartX:Number = levelTileSize;
		static public const levelFiveStartY:Number = (levelFiveHeight * levelTileSize) -  2 * levelTileSize  + 10;

		//Geometry/Tiles Constants
		static public const space = 0,rainbowBrick = 1,exitSign = 2;
		static public const spikes = 3, upsidedownSpikes = 4;
		static public const levelTileSize = 60;

		//Physics constants
		static public const jump = 2.5;
		static public const gravity = 2.5;

		//Keyboard constants
		static public const arrowUp:Number = 38;
		static public const arrowDown:Number = 40;
		static public const arrowLeft:Number = 37;
		static public const arrowRight:Number = 39;
		static public const spacebar:Number = 32;
	}
	
}
