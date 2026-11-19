-- Threat: !InfrastructureShared
-- Name: f5d767ac5327
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
