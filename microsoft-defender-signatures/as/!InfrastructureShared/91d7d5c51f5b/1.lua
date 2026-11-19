-- Threat: !InfrastructureShared
-- Name: 91d7d5c51f5b
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
