local AutoUnsilence = {}
AutoUnsilence.option = Menu.AddOption({ "Utility", "Auto Unsilence"}, "Enable", "Auto remove the silence buff")

function AutoUnsilence.OnUpdate()
	if not Menu.IsEnabled(AutoUnsilence.option) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if not Entity.IsAlive(myHero) then return end

	local lotus = NPC.GetItem(myHero,"item_lotus_orb")
	local manta = NPC.GetItem(myHero,"item_manta")
	local eul = NPC.GetItem(myHero,"item_cyclone")

	if not NPC.IsSilenced(myHero) then return end

	if lotus and Ability.IsReady(lotus) then
		Ability.CastTarget(lotus,myHero)
		return
	end

	if eul and Ability.IsReady(eul) then
		Ability.CastTarget(eul,myHero)
		return
	end

	if manta and Ability.IsReady(manta) then
		Ability.CastNoTarget(manta)
		return
	end
end

return AutoUnsilence