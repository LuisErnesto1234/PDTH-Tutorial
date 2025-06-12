function MaskOptionInitiator:modify_node(node)
	local choose_mask = node:item("choose_mask")
	local data_node = { type = "MenuItemMultiChoice" }
	local params = {
		name = "choose_mask",
		text_id = "menu_choose_mask",
		callback = "choice_mask"
	}
	if choose_mask:parameters().help_id then
		params.help_id = choose_mask:parameters().help_id
	end
	
	self._masks = {"clowns", "developer", "hockey_com", "alienware", "bf3", "santa", "president", "gold", "zombie", "troll", "music", "halloween", "vyse", "tester", "end_of_the_world"}
	
	for _, v in ipairs(self._masks) do
		table.insert(data_node, {
			_meta = "option",
			text_id = "menu_mask_"..v,
			value = v
		})
	end
	
	choose_mask:init(data_node, params)
	choose_mask:set_callback_handler(MenuCallbackHandler:new())
	choose_mask:set_value(managers.user:get_setting("mask_set") or "clowns")
	return node
end