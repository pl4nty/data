-- Threat: !InfrastructureShared
-- Name: 482916dc7bb1
-- Type: 21
-- Includes: ResearchData

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
mp.set_mpattribute("SuspTamperingScript")
if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
