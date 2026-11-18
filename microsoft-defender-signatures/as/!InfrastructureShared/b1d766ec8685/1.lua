-- Threat: !InfrastructureShared
-- Name: b1d766ec8685
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
