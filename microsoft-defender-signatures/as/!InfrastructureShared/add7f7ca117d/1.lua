-- Threat: !InfrastructureShared
-- Name: add7f7ca117d
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
