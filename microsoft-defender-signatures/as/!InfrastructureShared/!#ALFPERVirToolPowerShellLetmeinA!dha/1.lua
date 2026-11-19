-- Threat: !InfrastructureShared
-- Name: !#ALFPER:VirTool:PowerShell/Letmein.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & LUA:FileSizeLE1M.A

local l_0_0 = mp.enum_mpattributesubstring("SCPT:LetmeinA")
if 3 <= #l_0_0 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
