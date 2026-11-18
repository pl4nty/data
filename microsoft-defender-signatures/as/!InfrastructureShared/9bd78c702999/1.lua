-- Threat: !InfrastructureShared
-- Name: 9bd78c702999
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
