-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Python/CoreDrive.B!dha
-- Type: 13
-- MpAttributes: LUA:FileSizeLE1M.A & BM_ScriptFile

local l_0_0 = mp.enum_mpattributesubstring("SCPT:CoreDriveB")
if 3 < #l_0_0 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
