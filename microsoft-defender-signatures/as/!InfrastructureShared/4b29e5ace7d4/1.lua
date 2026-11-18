-- Threat: !InfrastructureShared
-- Name: 4b29e5ace7d4
-- Type: 21

if mp.get_mpattribute("SCRIPT:PowerShell") then
  return mp.INFECTED
end
return mp.CLEAN
