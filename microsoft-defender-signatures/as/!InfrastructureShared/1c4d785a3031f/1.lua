-- Threat: !InfrastructureShared
-- Name: 1c4d785a3031f
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
