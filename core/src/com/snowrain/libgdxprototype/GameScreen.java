package com.snowrain.libgdxprototype;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.actions.MoveToAction;

public class GameScreen implements Screen {

	public class MyActor extends Actor {
		Texture texture = new Texture(Gdx.files.internal("4.png"));
		float actorX = 0, actorY = 0;
		public boolean started = false;

		public MyActor() {
			setBounds(getX(), getY(), texture.getWidth(), texture.getHeight());
			// addListener(new InputListener() {
			// public boolean touchDown(InputEvent event, float x, float y,
			// int pointer, int button) {
			// ((MyActor) event.getTarget()).started = true;
			// return true;
			// }
			// });
		}

		@Override
		public void draw(Batch batch, float alpha) {
			batch.draw(texture, this.getX(), this.getY());
		}

		// @Override
		// public void act(float delta) {
		// if (started) {
		// actorX += 5;
		// }
		// }
	}

	private Stage stage;

	final PrototypeGameClass game;

	// Texture dropImage;
	Texture characterTexture;
	// Sound dropSound;
	// Music rainMusic;
	OrthographicCamera camera;
	Sprite mainChar;
	// Array<Rectangle> raindrops;
	long lastDropTime;
	int dropsGathered;
	int charWidth, charHeight;

	public GameScreen(final PrototypeGameClass game) {

		this.game = game;
		charWidth = 64;
		charHeight = 64;
		// load the images for the droplet and the bucket, 64x64 pixels each
		// dropImage = new Texture(Gdx.files.internal("red_circle.png"));
		// characterTexture = new Texture(Gdx.files.internal("4.png"));

		// load the drop sound effect and the rain background "music"
		// dropSound = Gdx.audio.newSound(Gdx.files.internal("drop.wav"));
		// rainMusic = Gdx.audio.newMusic(Gdx.files.internal("rain.mp3"));
		// rainMusic.setLooping(true);

		// create the camera and the SpriteBatch
		camera = new OrthographicCamera();
		camera.setToOrtho(false, 800, 480);

		// create a Rectangle to logically represent the bucket
		// mainChar = new Sprite(characterTexture);
		// mainChar.setTexture();
		// mainChar.setPosition(800 / 2 - charWidth / 2, 20); // center the
		// bucket
		// horizontally
		// bucket.y = 20; // bottom left corner of the bucket is 20 pixels above
		// the bottom screen edge
		// bucket.width = 32;
		// bucket.height = 32;
		// mainChar.setSize(charWidth, charHeight);

		stage = new Stage();
		Gdx.input.setInputProcessor(stage);
		MyActor myActor = new MyActor();
		// myActor.setTouchable(Touchable.enabled);
		MoveToAction moveAction = new MoveToAction();
		moveAction.setPosition(300f, 0f);
		moveAction.setDuration(2f);
		myActor.addAction(moveAction);
		stage.addActor(myActor);
		// create the raindrops array and spawn the first raindrop
		// raindrops = new Array<Rectangle>();
		// spawnRaindrop();

	}

	// private void spawnRaindrop() {
	// Rectangle raindrop = new Rectangle();
	// raindrop.x = MathUtils.random(0, 800 - 64);
	// raindrop.y = 480;
	// raindrop.width = 64;
	// raindrop.height = 64;
	// raindrops.add(raindrop);
	// lastDropTime = TimeUtils.nanoTime();
	// }

	@Override
	public void show() {
		// TODO Auto-generated method stub

	}

	@Override
	public void render(float delta) {

		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		stage.act(Gdx.graphics.getDeltaTime());
		stage.draw();
		// TODO Auto-generated method stub
		// clear the screen with a dark blue color. The
		// arguments to glClearColor are the red, green
		// blue and alpha component in the range [0,1]
		// of the color to be used to clear the screen.
		// Gdx.gl.glClearColor(0, 0, 0.2f, 1);
		// Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		//
		// // tell the camera to update its matrices.
		// camera.update();
		//
		// // tell the SpriteBatch to render in the
		// // coordinate system specified by the camera.
		// game.batch.setProjectionMatrix(camera.combined);
		//
		// // begin a new batch and draw the bucket and
		// // all drops
		// game.batch.begin();
		// // game.font.draw(game.batch, "Drops Collected: " + dropsGathered, 0,
		// // 480);
		// mainChar.draw(game.batch);
		// // for (Rectangle raindrop : raindrops) {
		// // game.batch.draw(dropImage, raindrop.x, raindrop.y);
		// // }
		// game.batch.end();
		//
		// // process user input
		// if (Gdx.input.isTouched()) {
		// Vector3 touchPos = new Vector3();
		// touchPos.set(Gdx.input.getX(), Gdx.input.getY(), 0);
		// camera.unproject(touchPos);
		// mainChar.setX(touchPos.x - charWidth / 2);
		// mainChar.setY(touchPos.y - charHeight / 2);
		// }
		// // if (Gdx.input.isKeyPressed(Keys.LEFT))
		// // bucket.x -= 200 * Gdx.graphics.getDeltaTime();
		// // if (Gdx.input.isKeyPressed(Keys.RIGHT))
		// // bucket.x += 200 * Gdx.graphics.getDeltaTime();
		//
		// // make sure the bucket stays within the screen bounds
		// if (mainChar.getX() < 0)
		// mainChar.setX(0);
		// if (mainChar.getX() > 800 - charWidth)
		// mainChar.setX(800 - charWidth);

		// check if we need to create a new raindrop
		// if (TimeUtils.nanoTime() - lastDropTime > 1000000000)
		// spawnRaindrop();

		// move the raindrops, remove any that are beneath the bottom edge of
		// the screen or that hit the bucket. In the later case we increase the
		// value our drops counter and add a sound effect.
		// Iterator<Rectangle> iter = raindrops.iterator();
		// while (iter.hasNext()) {
		// Rectangle raindrop = iter.next();
		// raindrop.y -= 200 * Gdx.graphics.getDeltaTime();
		// if (raindrop.y + 64 < 0)
		// iter.remove();
		// if (raindrop.overlaps(bucket)) {
		// dropsGathered++;
		// // dropSound.play();
		// iter.remove();
		// }
		// }
	}

	@Override
	public void resize(int width, int height) {
		// TODO Auto-generated method stub

	}

	@Override
	public void pause() {
		// TODO Auto-generated method stub

	}

	@Override
	public void resume() {
		// TODO Auto-generated method stub

	}

	@Override
	public void hide() {
		// TODO Auto-generated method stub

	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		stage.dispose();
	}

}
