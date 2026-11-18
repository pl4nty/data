-- Threat: !InfrastructureShared
-- Name: 93d76d3e7c9e
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
