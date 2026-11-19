-- Threat: !InfrastructureShared
-- Name: 35d758f84014
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
