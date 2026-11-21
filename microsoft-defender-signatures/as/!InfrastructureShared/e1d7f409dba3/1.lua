-- Threat: !InfrastructureShared
-- Name: e1d7f409dba3
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
