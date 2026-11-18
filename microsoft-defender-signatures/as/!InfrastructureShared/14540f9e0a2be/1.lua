-- Threat: !InfrastructureShared
-- Name: 14540f9e0a2be
-- Type: 21

if mp.get_mpattribute("SIGATTR:ExCheckInstalledAV") then
  return mp.CLEAN
end
return mp.INFECTED
