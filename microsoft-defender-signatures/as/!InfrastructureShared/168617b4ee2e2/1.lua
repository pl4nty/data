-- Threat: !InfrastructureShared
-- Name: 168617b4ee2e2
-- Type: 21

if mp.get_mpattribute("//NSIS_Installer") then
  return mp.INFECTED
end
return mp.CLEAN
