Adds a minimap to the HUD, showing the player position and rotation (centered) as well as that of your team and any marked units and objective waypoints. Can be relatively easily modified to show other points of interest as well.

The minimap uses the preplanning maps as map texture. Some of these have been merged, others have been edited for greater accuracy, and a handful have been created from scratch (e.g. jewelry store). If a particular heist/day does not have a map texture, the attribute "HUDMiniMap.SHOW_BLANK_MAP" in the script will determine if a map should be shown regardless using only a black background. The SIZE and DEFAULT_RADIUS attributes can also be edited to change the size and default zoom level of the map.

As the map uses custom textures, setting up a texture override folder is necessary. To install the minimap, you need the main script itself that you'll install like any other mod for whatever hook you're using, as well as move the .dds files found in the root of the "Textures" directory as well as change their extension to .texture.
File and folder structure for the overrides should be as follows, starting from your game install directory:
..\PAYDAY 2\assets\mod_overrides\MiniMap\guis\dlcs\kenaz\textures\pd2\pre_planning\kenaz_loc_b_df.texture
..\PAYDAY 2\assets\mod_overrides\MiniMap\guis\textures\pd2\pre_planning\mus_1.texture
..\PAYDAY 2\assets\mod_overrides\MiniMap\guis\textures\pd2\pre_planning\mus_2.texture
..\PAYDAY 2\assets\mod_overrides\MiniMap\guis\textures\pd2\pre_planning\mus_3.texture
..\PAYDAY 2\assets\mod_overrides\MiniMap\guis\textures\pd2\pre_planning\shadow_raid_5.texture

Thanks to Elysium for a lot of help with editing maps, testing and various ideas.
