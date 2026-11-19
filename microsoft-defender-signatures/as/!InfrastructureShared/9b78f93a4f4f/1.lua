-- Threat: !InfrastructureShared
-- Name: 9b78f93a4f4f
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") then
  return mp.INFECTED
end
return mp.CLEAN
