-- Threat: !InfrastructureShared
-- Name: 3bd72ab3c107
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
