EjectaAppState
==============

This sets a flag when your ejecta app goes into the background.  It allows you to check the flag in impact and put up a Pause Screen or continue type of screen.

In most of my web impact games I use the blur and focus events to pause my games, but currently these events are not fire in ejecta games.  Technically this isn't needed because when the app goes to the background, requestAnimationFrame doesn't happen and the game is "paused."  The issue I have is that when the game returns to active state the game picks up right where it was, so in faster paced games, the user may not be ready to play.

Technically how this works, is it just pops up a flag that you can check against and then spawn the pause screen, menu, etc.  The game loop still runs.  If you bypass the game.update() then the enties will not be updated, but the game will continue to loop.  


Set up is similar to this, added to the main game update
if( window.ejecta ){
			// check for ejecta and if was in background 
			var status = new Ejecta.AppStatus();
			this.pauseGame = status.shouldPauseGame;
}

if(this.pauseGame){
  // spawn pause screen, pause timers etc.
  ...
  ...
  // this prevents enties from being updated but still seen on screen
  return false
}else{
  ...
  // normal game updates of entities etc
  this.parent();
  ...
}

// to reset the game flag in the app
status.resetGameStatusFlag();



