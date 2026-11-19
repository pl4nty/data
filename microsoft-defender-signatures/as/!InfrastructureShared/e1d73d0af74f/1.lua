-- Threat: !InfrastructureShared
-- Name: e1d73d0af74f
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
