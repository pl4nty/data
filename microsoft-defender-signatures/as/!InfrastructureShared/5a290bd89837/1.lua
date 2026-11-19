-- Threat: !InfrastructureShared
-- Name: 5a290bd89837
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
return mp.INFECTED
