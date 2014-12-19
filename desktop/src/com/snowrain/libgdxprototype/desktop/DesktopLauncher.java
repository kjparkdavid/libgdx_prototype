package com.snowrain.libgdxprototype.desktop;

import com.badlogic.gdx.backends.lwjgl.LwjglApplication;
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration;
import com.snowrain.libgdxprototype.PrototypeGameClass;

public class DesktopLauncher {
	public static void main (String[] arg) {
		LwjglApplicationConfiguration config = new LwjglApplicationConfiguration();
		config.title = "BattleDodgeBall";
		config.width = 800;
		config.height = 480;
		new LwjglApplication(new PrototypeGameClass(), config);
	}
}
