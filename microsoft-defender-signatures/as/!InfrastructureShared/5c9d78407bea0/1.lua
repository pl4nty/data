-- Threat: !InfrastructureShared
-- Name: 5c9d78407bea0
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
