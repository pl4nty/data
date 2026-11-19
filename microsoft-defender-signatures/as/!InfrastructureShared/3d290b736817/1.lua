-- Threat: !InfrastructureShared
-- Name: 3d290b736817
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
return mp.INFECTED
