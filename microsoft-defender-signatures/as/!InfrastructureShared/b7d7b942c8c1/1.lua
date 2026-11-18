-- Threat: !InfrastructureShared
-- Name: b7d7b942c8c1
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
