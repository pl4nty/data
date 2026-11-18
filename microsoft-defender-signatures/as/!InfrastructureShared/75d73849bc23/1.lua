-- Threat: !InfrastructureShared
-- Name: 75d73849bc23
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
