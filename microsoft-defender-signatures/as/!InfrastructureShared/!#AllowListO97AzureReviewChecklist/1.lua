-- Threat: !InfrastructureShared
-- Name: !#AllowList:O97/AzureReviewChecklist
-- Type: 13
-- MpAttributes: HSTR:AzureReviewChecklist.A

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if mp.GetMOTWZone() < 3 then
  return mp.CLEAN
end
local l_0_0 = mp.GetMOTWHostUrl()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "review_checklist.xls", 1, true) and string.find(l_0_0, "github", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
