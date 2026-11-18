-- Threat: !InfrastructureShared
-- Name: 73d7b20e7641
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
