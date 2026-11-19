-- Threat: !InfrastructureShared
-- Name: !#ArchiveWithDllAndExec
-- Type: 10
-- Includes: LuaFuncHelper, ResearchData, AppomalyHelpers
-- MpAttributes: //AGGR:SignedExecInArchive | //AGGR:UnsignedDLLInArchive | //InvalidSignedDLLInArchive

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
l_0_0 = l_0_0 and MpCommon.PathToWin32Path(l_0_0) or l_0_0
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "(.*)%->")
local l_0_2 = string.match(l_0_0, "%w+%->.*/(.*)") or string.match(l_0_0, "%->(.*%.exe)$") or string.match(l_0_0, "%->(.*%.dll)$")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = 259200
local l_0_4 = 1000
AppendToRollingQueue("ArchivesWithExec_FileName", l_0_2, l_0_1, l_0_3, l_0_4, 0)
local l_0_5 = string.match(l_0_2, "%.(.*)$")
local l_0_6
if l_0_5 == "exe" then
  l_0_6 = ".dll"
else
  l_0_6 = ".exe"
end
local l_0_7, l_0_8, l_0_9 = IsKeyInRollingQueue("ArchivesWithExec_FileName", l_0_6, false)
if not l_0_7 or not l_0_9 then
  return mp.CLEAN
end
for l_0_10, l_0_11 in ipairs(l_0_9) do
  if l_0_11.value == l_0_1 then
    if l_0_5 == "exe" and string.find(l_0_11.key, "loc.dll", 1, true) and Contains_any_caseinsenstive(l_0_2, {
      "U3BoostSvr",
      "USHSVC",
      "AgentInstall"
    }) then
      mp.set_mpattribute("DllSideLoading_VulnerableExe_Asus")
      return mp.INFECTED
    end
    if l_0_5 == "dll" and string.find(l_0_2, "loc.dll", 1, true) and Contains_any_caseinsenstive(l_0_11.key, {
      "U3BoostSvr",
      "USHSVC",
      "AgentInstall"
    }) then
      mp.set_mpattribute("DllSideLoading_VulnerableExe_Asus")
      return mp.INFECTED
    end
    set_research_data("Evidence", MpCommon.Base64Encode(l_0_0 .. "|" .. l_0_11.key), false)
    local l_0_12 = "([^\\\\/?%*:|\"<>\\.][A-Za-z0-9._\\-\\+\\(\\)\\[\\]\\{\\}&~]*[^\\\\/?%*:|\"<>\\.]\\.(exe|dll)+$)"
    local l_0_13, l_0_14 = MpCommon.StringRegExpSearch(l_0_12, l_0_2)
    local l_0_15, l_0_16 = MpCommon.StringRegExpSearch(l_0_12, l_0_11.key)
    if l_0_14 and l_0_16 then
      local l_0_17, l_0_18
      if l_0_6 == ".exe" then
        l_0_18 = l_0_16
        l_0_17 = l_0_14
      else
        l_0_18 = l_0_14
        l_0_17 = l_0_16
      end
      local l_0_19, l_0_20, l_0_21 = IsDllInExpectedPath(l_0_17, l_0_1, l_0_18)
      if l_0_21 then
        mp.set_mpattribute("DllSideLoading_VulnerableExe_" .. l_0_21)
      end
      if l_0_19 then
        mp.set_mpattribute("DllSideLoading_VulnerableDll_" .. l_0_19)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
