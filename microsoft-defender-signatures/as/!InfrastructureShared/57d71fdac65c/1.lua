-- Threat: !InfrastructureShared
-- Name: 57d71fdac65c
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
