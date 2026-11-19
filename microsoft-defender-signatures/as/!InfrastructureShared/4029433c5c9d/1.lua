-- Threat: !InfrastructureShared
-- Name: 4029433c5c9d
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
return mp.INFECTED
