-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Script/Upstyle.B!dha
-- Type: 24
-- MpAttributes: Lua:PYExt & LUA:FileSizeLE50KB.B

local l_0_0 = mp.enum_mpattributesubstring("SCPT:UpstyleB")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
