-- Threat: !InfrastructureShared
-- Name: 19dd7fe8475f9
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
