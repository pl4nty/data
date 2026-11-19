-- Threat: !InfrastructureShared
-- Name: 135d7c9b7274a
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
