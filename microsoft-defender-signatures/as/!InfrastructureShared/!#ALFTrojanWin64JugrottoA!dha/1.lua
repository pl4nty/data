-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/Jugrotto.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and string.len(l_0_0) > 50 and (l_0_0:find("https://green.info/chatting/", 1, true) or l_0_0:find(".v8.pro/chat/", 1, true) or l_0_0:find(".v8.pro/attach/", 1, true) or l_0_0:find("//g3.exploit.info/", 1, true)) then
    mp.set_mpattribute("//Lua:JugrottoChild")
    return mp.INFECTED
  end
end
return mp.CLEAN
