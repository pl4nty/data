-- Threat: !InfrastructureShared
-- Name: ef78d65fa1cd
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
