-- Threat: !InfrastructureShared
-- Name: abd7c3d7bd39
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
