-- Threat: !InfrastructureShared
-- Name: c778a945252a
-- Type: 21

if mp.get_mpattribute("HSTR:NSIS_Installer") or mp.get_mpattribute("HSTR:NSIS.gen!A") then
  return mp.INFECTED
end
return mp.CLEAN
