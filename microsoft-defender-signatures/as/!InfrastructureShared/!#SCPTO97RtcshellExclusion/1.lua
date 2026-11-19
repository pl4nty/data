-- Threat: !InfrastructureShared
-- Name: !#SCPT:O97/RtcshellExclusion
-- Type: 12
-- MpAttributes: MpIsOfficeVbaAMSIScanViaOfficeProdApps

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1:find("msaccess.exe", 1, true) then
    return mp.INFECTED
  end
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_2 and l_0_3 ~= nil then
    local l_0_4 = string.lower(l_0_3)
    if string.find(l_0_4, ".accdb", -6, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
