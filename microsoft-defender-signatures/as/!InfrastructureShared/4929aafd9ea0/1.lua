-- Threat: !InfrastructureShared
-- Name: 4929aafd9ea0
-- Type: 21
-- Includes: ResearchData

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
mp.set_mpattribute("SuspTamperingScript")
if isTamperProtectionOn() then
  return mp.INFECTED
end
if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 3) then
  set_research_data("Reason", "AggressivePeTrigger", false)
  return mp.LOWFI
end
return mp.CLEAN
