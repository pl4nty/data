-- Threat: !InfrastructureShared
-- Name: !#BLKACC:3b576869-a4ec-4529-8536-b80a7769e899
-- Type: 13
-- MpAttributes: MpIsOfficeVbaAMSIScan & (AsrOfficeExecContentBypass | (AsrOfficeExecContentBypass.P1 & (AsrOfficeExecContentBypass.P2 | AsrOfficeExecContentBypass.P3)))

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if not mp.IsHipsRuleEnabled("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 ~= nil and l_0_1 ~= "" then
  l_0_1 = string.lower(l_0_1)
  if 10 < #l_0_1 and string.find(l_0_1, "^memscanvfz") == nil or #l_0_1 <= 10 then
    if 7 < #l_0_1 and string.find(l_0_1, "^\\device\\") ~= nil then
      l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_1))
    end
    if sysio.IsFileExists(l_0_1) then
      l_0_0 = true
    end
  end
end
if l_0_0 == false then
  l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 ~= nil and l_0_1 ~= "" and (10 < #l_0_1 and string.find(l_0_1, "^memscanvfz") == nil or #l_0_1 <= 10) then
    if 7 < #l_0_1 and string.find(l_0_1, "^\\device\\") ~= nil then
      l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_1))
    end
    if sysio.IsFileExists(l_0_1) then
      l_0_0 = true
    end
  end
end
if l_0_0 and mp.IsPathExcludedForHipsRule(l_0_1, "3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
return mp.INFECTED
