-- Threat: !InfrastructureShared
-- Name: 9bd71069761b
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
