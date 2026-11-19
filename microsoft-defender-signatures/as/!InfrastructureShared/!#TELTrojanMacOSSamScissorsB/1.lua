-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:MacOS/SamScissors.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.getfilename())
  if string.find(l_0_1, "/3cx desktop app/updateagent", 1, true) or string.find(l_0_1, "/3cx desktop app/.session-lock", 1, true) or string.find(l_0_1, "/3cx desktop app/.main_storage", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
