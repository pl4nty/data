-- Threat: !InfrastructureShared
-- Name: 4fd7daa5fed6
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
