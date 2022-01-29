panorama.loadstring([[
	function every_second()
	{
		$.Msg("You can't unload me, " + MyPersonaAPI.GetName() + "!");
		$.Schedule(1, every_second);
	}
	every_second();
]])()