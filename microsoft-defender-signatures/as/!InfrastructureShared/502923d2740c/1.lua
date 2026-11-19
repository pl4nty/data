-- Threat: !InfrastructureShared
-- Name: 502923d2740c
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
