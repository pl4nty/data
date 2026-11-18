-- Threat: !InfrastructureShared
-- Name: 6fd7f41cba78
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
