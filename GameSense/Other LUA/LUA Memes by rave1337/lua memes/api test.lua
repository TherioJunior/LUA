local js = require("libs/access_panorama")
js.eval([[
    $.Msg(GameStateAPI.SubmitPlayerReport(GameStateAPI.GetPlayerXuidStringFromEntIndex(]]..entity.get_local_player()..[[), "grief"));
]])