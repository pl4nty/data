-- Threat: !InfrastructureShared
-- Name: 1c3d73c1e2ad5
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
