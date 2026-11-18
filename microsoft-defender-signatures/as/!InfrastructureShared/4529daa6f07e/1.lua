-- Threat: !InfrastructureShared
-- Name: 4529daa6f07e
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.INFECTED
end
return mp.CLEAN
