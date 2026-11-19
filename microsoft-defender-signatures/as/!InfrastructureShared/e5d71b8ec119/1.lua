-- Threat: !InfrastructureShared
-- Name: e5d71b8ec119
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
