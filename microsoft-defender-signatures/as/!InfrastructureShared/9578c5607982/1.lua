-- Threat: !InfrastructureShared
-- Name: 9578c5607982
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") then
  return mp.INFECTED
end
return mp.CLEAN
