-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Script/Upstyle.C!dha
-- Type: 24
-- MpAttributes: Lua:PYExt & LUA:FileSizeLE1000.A

local l_0_0 = mp.enum_mpattributesubstring("SCPT:UpstyleC")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
