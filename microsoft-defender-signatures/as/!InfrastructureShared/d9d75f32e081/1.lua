-- Threat: !InfrastructureShared
-- Name: d9d75f32e081
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
