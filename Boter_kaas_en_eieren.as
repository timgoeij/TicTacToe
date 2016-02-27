package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Boter_kaas_en_eieren extends MovieClip 
	{
		//variables	
		public var bord:Bord = new Bord(); public var rondje:Rondje = new Rondje(); 
		public var kruisje:Kruisje = new Kruisje();
		public var dobbelsteen:Dobbelsteen = new Dobbelsteen();
		public var dobbelsteen2:Dobbelsteen2 = new Dobbelsteen2();
	
		public var worp1:Number = 0; public var worp2:Number = 0; public var gegooid:Boolean = false; public var gegooid2:Boolean = false;
		public var reset:Reset = new Reset(); public var objecten:Array = new Array();
		public var speler1, speler2, rond1, rond2, rond3, rond4, rond5, rond6, rond7, rond8,
			   rond9, kruis1, kruis2, kruis3, kruis4, kruis5, kruis6, kruis7, kruis8, kruis9:Boolean = new Boolean();
		public var clear = false;
		
		public function Boter_kaas_en_eieren() 
		{
			//set a gameboard on screen
			bord.x = 100; bord.y = 100; addChild(bord); 
			
			//set a reset button on screen
			reset.x = 175; reset.y = 30; addChild(reset);
			
			//set a dice for player 1 on screen
			dobbelsteen.x = 50; dobbelsteen.y = 50; addChild(dobbelsteen); 
			
			//set a dice for player 2 on screen
			dobbelsteen2.x = 500; dobbelsteen2.y = 50; addChild(dobbelsteen2);
			
			//set all booleans to false;
			speler1 = false; speler2 = false; rond1 = false; rond2 = false; rond3 = false; rond4 = false; rond5 = false;
			rond6 = false; rond7 = false; rond8 = false; rond9 = false; kruis1 = false; kruis2 = false; kruis3 = false;
			kruis4 = false; kruis5 = false; kruis6 = false; kruis7 = false; kruis8 = false; kruis9 = false;
			
			//create the gameloop
			stage.addEventListener(Event.ENTER_FRAME, Gameloop); 
			
			//create for each square at the gameboard a click event
			bord.Vak1.addEventListener(MouseEvent.CLICK, mouseControlvak1);
			bord.Vak2.addEventListener(MouseEvent.CLICK, mouseControlvak2); bord.Vak3.addEventListener(MouseEvent.CLICK, mouseControlvak3);
			bord.Vak4.addEventListener(MouseEvent.CLICK, mouseControlvak4); bord.Vak5.addEventListener(MouseEvent.CLICK, mouseControlvak5);
			bord.Vak6.addEventListener(MouseEvent.CLICK, mouseControlvak6); bord.Vak7.addEventListener(MouseEvent.CLICK, mouseControlvak7);
			bord.Vak8.addEventListener(MouseEvent.CLICK, mouseControlvak8); bord.Vak9.addEventListener(MouseEvent.CLICK, mouseControlvak9);
			
			//create for the reset button a click event
			reset.addEventListener(MouseEvent.CLICK, resetspel); 
			
			//create for each dice a click event
			dobbelsteen.addEventListener(MouseEvent.CLICK, dobbel1);
			dobbelsteen2.addEventListener(MouseEvent.CLICK, dobbel2);
			
		}		
		public function Gameloop (event:Event)
		{
			//check if clear is false
			if(!clear)
			{
				//check if both dices if thrown
				if(gegooid && gegooid2)
				{
					//check which player has the highest number and set his turn on true
					if(worp1 > worp2){speler1 = true; speler2 = false;}
					else if(worp1 < worp2){speler2 = true; speler1 = false;}
					else{gegooid = false; gegooid2 = false;}				
				}
			}
			
			//check for all possibilities to complete the game for player 1 if true set clear at true and give the background the right color
			if(kruis1 && kruis2 && kruis3){bord.Vak1.gotoAndStop(2); bord.Vak2.gotoAndStop(2); bord.Vak3.gotoAndStop(2); clear = true;}
			else if(kruis1 && kruis5 && kruis9){bord.Vak1.gotoAndStop(2); bord.Vak5.gotoAndStop(2); bord.Vak9.gotoAndStop(2); clear = true;}
			else if(kruis1 && kruis4 && kruis7){bord.Vak1.gotoAndStop(2); bord.Vak4.gotoAndStop(2); bord.Vak7.gotoAndStop(2); clear = true;}
			else if(kruis4 && kruis5 && kruis6){bord.Vak4.gotoAndStop(2); bord.Vak5.gotoAndStop(2); bord.Vak6.gotoAndStop(2); clear = true;}
			else if(kruis7 && kruis8 && kruis9){bord.Vak7.gotoAndStop(2); bord.Vak8.gotoAndStop(2); bord.Vak9.gotoAndStop(2); clear = true;}
			else if(kruis2 && kruis5 && kruis8){bord.Vak2.gotoAndStop(2); bord.Vak5.gotoAndStop(2); bord.Vak8.gotoAndStop(2); clear = true;}
			else if(kruis3 && kruis6 && kruis9){bord.Vak3.gotoAndStop(2); bord.Vak6.gotoAndStop(2); bord.Vak9.gotoAndStop(2); clear = true;}
			else if(kruis3 && kruis5 && kruis7){bord.Vak3.gotoAndStop(2); bord.Vak5.gotoAndStop(2); bord.Vak7.gotoAndStop(2); clear = true;}
			
			//check for all possibilities to complete the game for player 2 if true set clear at true and give the background the right color
			if(rond1 && rond2 && rond3){bord.Vak1.gotoAndStop(3); bord.Vak2.gotoAndStop(3); bord.Vak3.gotoAndStop(3); clear = true;}
			else if(rond1 && rond5 && rond9){bord.Vak1.gotoAndStop(3); bord.Vak5.gotoAndStop(3); bord.Vak9.gotoAndStop(3); clear = true;}
			else if(rond1 && rond4 && rond7){bord.Vak1.gotoAndStop(3); bord.Vak4.gotoAndStop(3); bord.Vak7.gotoAndStop(3); clear = true;}
			else if(rond4 && rond5 && rond6){bord.Vak4.gotoAndStop(3); bord.Vak5.gotoAndStop(3); bord.Vak6.gotoAndStop(3); clear = true;}
			else if(rond7 && rond8 && rond9){bord.Vak7.gotoAndStop(3); bord.Vak8.gotoAndStop(3); bord.Vak9.gotoAndStop(3); clear = true;}
			else if(rond2 && rond5 && rond8){bord.Vak2.gotoAndStop(3); bord.Vak5.gotoAndStop(3); bord.Vak8.gotoAndStop(3); clear = true;}
			else if(rond3 && rond6 && rond9){bord.Vak3.gotoAndStop(3); bord.Vak6.gotoAndStop(3); bord.Vak9.gotoAndStop(3); clear = true;}
			else if(rond3 && rond5 && rond7){bord.Vak3.gotoAndStop(3); bord.Vak5.gotoAndStop(3); bord.Vak7.gotoAndStop(3); clear = true;}
			
			//check if all squares are empty and give them the right backrgound
			if(!kruis1 && !kruis2 && !kruis3 && !kruis4 && !kruis5 && !kruis6 && !kruis7 && !kruis8 && !kruis9
			   && !rond1 && !rond2  && !rond3 && !rond4 && !rond5 && !rond6 && !rond7 && !rond8 && !rond9)
			   {
				   bord.Vak1.gotoAndStop(1); bord.Vak2.gotoAndStop(1); bord.Vak3.gotoAndStop(1); bord.Vak4.gotoAndStop(1); bord.Vak5.gotoAndStop(1);
			       bord.Vak6.gotoAndStop(1); bord.Vak7.gotoAndStop(1); bord.Vak8.gotoAndStop(1); bord.Vak9.gotoAndStop(1);
			   }
			   //check if all squares are filled and set clear at true
			   else if(kruis1 && kruis2 && kruis3 && kruis4 && kruis5 && kruis6 && kruis7 && kruis8 && kruis9
			   && rond1 && rond2  && rond3 && rond4 && rond5 && rond6 && rond7 && rond8 && rond9)
			   {
				   clear = true;
			   }
		}
		
		/*all the squares has the same click function in the function is check which player is on turn
			and checkt if the square is empty, is the square empty place a cross or circle and set the booleans
			to false*/
		public function mouseControlvak1(event:MouseEvent)
		{
			if(speler1 && !rond1){kruisje = new Kruisje(); kruisje.x = 110; kruisje.y = 110; 
								   addChild(kruisje); objecten.push(kruisje); kruis1 = true;}
			else if(speler2 && !kruis1){ rondje = new Rondje(); rondje.x = 110; rondje.y = 110;
										 addChild(rondje); objecten.push(rondje); rond1 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak2(event:MouseEvent)
		{
			if(speler1 && !rond2){kruisje = new Kruisje(); kruisje.x = 210; kruisje.y = 110;
				                  addChild(kruisje); objecten.push(kruisje); kruis2 = true;}
			else if(speler2 && !kruis2){rondje = new Rondje(); rondje.x = 210; rondje.y = 110;
				                        addChild(rondje); objecten.push(rondje); rond2 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak3(event:MouseEvent)
		{
			if(speler1 && !rond3){kruisje = new Kruisje(); kruisje.x = 310; kruisje.y = 110;
				                  addChild(kruisje); objecten.push(kruisje); kruis3 = true;}
			else if(speler2 && !kruis3){rondje = new Rondje(); rondje.x = 310; rondje.y = 110;
										addChild(rondje); objecten.push(rondje); rond3 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak4(event:MouseEvent)
		{
			if(speler1 && !rond4){kruisje = new Kruisje(); kruisje.x = 110; kruisje.y = 210;
								  addChild(kruisje); objecten.push(kruisje); kruis4 = true;}
			else if(speler2 && !kruis4){rondje = new Rondje(); rondje.x = 110; rondje.y = 210;
										addChild(rondje); objecten.push(rondje); rond4 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak5(event:MouseEvent)
		{
			if(speler1 && !rond5){kruisje = new Kruisje(); kruisje.x = 210; kruisje.y = 210;
				                  addChild(kruisje); objecten.push(kruisje); kruis5 = true;}
			else if(speler2 && !kruis5){rondje = new Rondje(); rondje.x = 210; rondje.y = 210;
										addChild(rondje); objecten.push(rondje); rond5 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak6(event:MouseEvent)
		{
			if(speler1 && !rond6){kruisje = new Kruisje(); kruisje.x = 310; kruisje.y = 210;
				                  addChild(kruisje); objecten.push(kruisje); kruis6 = true;}
			else if(speler2 && !kruis6){rondje = new Rondje(); rondje.x = 310; rondje.y = 210;
				                        addChild(rondje); objecten.push(rondje); rond6 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak7(event:MouseEvent)
		{
			if(speler1 && !rond7){kruisje = new Kruisje(); kruisje.x = 110; kruisje.y = 310;
				                  addChild(kruisje); objecten.push(kruisje); kruis7 = true;}
			else if(speler2 && !kruis7){rondje = new Rondje(); rondje.x = 110; rondje.y = 310;
				                        addChild(rondje); objecten.push(rondje); rond7 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak8(event:MouseEvent)
		{
			if(speler1 && !rond8){kruisje = new Kruisje(); kruisje.x = 210; kruisje.y = 310;
				                  addChild(kruisje); objecten.push(kruisje); kruis8 = true;}
			else if(speler2 && !kruis8){rondje = new Rondje(); rondje.x = 210; rondje.y = 310;
				                        addChild(rondje); objecten.push(rondje); rond8 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		public function mouseControlvak9(event:MouseEvent)
		{
			if(speler1 && !rond9){kruisje = new Kruisje(); kruisje.x = 310; kruisje.y = 310;
				                  addChild(kruisje); objecten.push(kruisje); kruis9 = true;}
			else if(speler2 && !kruis9){rondje = new Rondje(); rondje.x = 310; rondje.y = 310;
				                        addChild(rondje); objecten.push(rondje); rond9 = true;}
			gegooid = false; gegooid2 = false; speler1 = false; speler2 = false;
		}
		
		//remove all the croses and circles and set all booleans at false to reset the game
		public function resetspel(event:MouseEvent)
		{
			for(var i:int = 0; i < objecten.length; i++)
			{
				removeChild(objecten[i]);
			}
			objecten = new Array();
			
			kruis1 = false; kruis2 = false; kruis3 = false; kruis4 = false; kruis5 = false; kruis6 = false; kruis7 = false; kruis8 = false; kruis9 = false;
			rond1 = false; rond2 = false; rond3 = false; rond4 = false; rond5 = false; rond6 = false; rond7 = false; rond8 = false; rond9 = false;
			
			clear = false;
		}
		
		/*both dices has the same click event. first check of the player hasn't threw the dice, 
			second get a random number between 1-6, third give the dice the background and set the gegooid boolean at true*/ 
		public function dobbel1(event:MouseEvent)
		{
			if(!gegooid)
			{
				worp1 = Math.floor(Math.random()*(6))+1;
				dobbelsteen.gotoAndStop(worp1);
				gegooid = true;
			}
		}
		public function dobbel2(event:MouseEvent)
		{
			if(!gegooid2)
			{
				worp2 = Math.floor(Math.random()*(6))+1;
				dobbelsteen2.gotoAndStop(worp2);
				gegooid2 = true;
			}
		} 
	}	
}