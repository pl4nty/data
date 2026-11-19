-- Threat: !InfrastructureShared
-- Name: a1d7f51079a6
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
