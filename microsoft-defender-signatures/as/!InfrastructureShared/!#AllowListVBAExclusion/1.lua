-- Threat: !InfrastructureShared
-- Name: !#AllowList:VBAExclusion
-- Type: 12
-- MpAttributes: MpIsOfficeVbaAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2)
    if string.find(l_0_3, "\\pavement software files\\", 1, true) or string.find(l_0_3, "fpd2_ver1b.xlsm", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
