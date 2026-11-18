-- Threat: !InfrastructureShared
-- Name: 55d726b27537
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
