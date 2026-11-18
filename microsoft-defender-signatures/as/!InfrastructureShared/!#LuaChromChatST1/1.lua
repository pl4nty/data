-- Threat: !InfrastructureShared
-- Name: !#Lua:ChromChat.ST1
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:JSExt

local l_0_0 = mp.enum_mpattributesubstring("SCRT:ChromChatST.")
if 4 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
