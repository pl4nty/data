-- Threat: !InfrastructureShared
-- Name: 7178f9c7009c
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") then
  return mp.INFECTED
end
return mp.CLEAN
