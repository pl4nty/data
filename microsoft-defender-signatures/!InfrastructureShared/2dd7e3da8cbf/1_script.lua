-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2dd7e3da8cbf\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
local l_0_2, l_0_3 = (MpCommon.StringRegExpSearch)("(?i)-embedding\\s+(.*)", l_0_1)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (string.gsub)(l_0_3, "\'", "")
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = {}
l_0_4.Parents = add_parents_mp()
l_0_4.File_Path = l_0_3
local l_0_5 = nil
local l_0_6, l_0_7 = IsKeyValuePairInRollingQueue("MMC_SnapInCLSID", "SnapInCLSID", l_0_3, false)
if l_0_6 and l_0_7 then
  l_0_5 = true
  l_0_4.CLSID_FromFile = l_0_7
  l_0_4.MSC_File_Matched = true
  local l_0_8 = (string.match)(l_0_7, "(.-);")
  local l_0_9 = IsKeyInRollingQueue("Potential_COM_Hijacked_CLSIDs", (string.lower)(l_0_8))
  if l_0_9 then
    l_0_4.COM_CLSID_Matched = true
    l_0_4.CLSID_BM = "Potential_COM_Hijacked_CLSIDs"
  end
end
do
  if not l_0_5 then
    l_0_6 = IsKeyValuePairInRollingQueue("MMC_SnapInUrls", "SnapInUrls", l_0_3, false)
    if l_0_6 and l_0_7 then
      l_0_5 = true
      l_0_4.SnapIn_URL_FromFile = l_0_7
      l_0_4.MSC_File_Matched = true
    end
  end
  if l_0_5 then
    local l_0_10 = safeJsonSerialize(l_0_4)
    set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_10), false)
    local l_0_11 = (mp.GetParentProcInfo)()
    if l_0_11 and l_0_11.ppid then
      (MpCommon.BmTriggerSig)(l_0_11.ppid, "APML_SuspMMC_B", l_0_10)
    end
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

