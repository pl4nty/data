-- Threat: !InfrastructureShared
-- Name: 2f781203b42d
-- Type: 21

if mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_lastscn_writable") then
  return mp.INFECTED
end
return mp.CLEAN
