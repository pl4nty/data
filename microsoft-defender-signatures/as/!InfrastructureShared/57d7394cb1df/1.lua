-- Threat: !InfrastructureShared
-- Name: 57d7394cb1df
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
