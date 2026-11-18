-- Threat: !InfrastructureShared
-- Name: 764b31092eeb7
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {
  "svchost.exe",
  "microsoft",
  "\\installer\\",
  "\\appdata\\",
  "Windows\\System32\\spoolsv.exe"
}
local l_0_1 = bm.get_imagepath()
if l_0_1 and contains(l_0_1, l_0_0) then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[7].matched then
  l_0_2 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched then
  l_0_2 = this_sigattrlog[8].utf8p2
end
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = "c:\\\\programdata\\\\microsoft\\\\windows defender.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$|c:\\\\.*\\\\microsoft\\\\windows defender advanced threat protection\\\\.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$"
local l_0_4 = "c:\\\\programdata\\\\microsoft(_bak)?$|c:\\\\program files\\\\windows defender advanced threat protection(_bak)?$"
local l_0_5 = "c:\\\\programdata\\\\microsoft(_bak)?\\\\windows defender\\\\platform(\\\\)?([^\\\\]+)\\\\?$|c:\\\\programdata\\\\microsoft(_bak)?\\\\windows defender(\\\\)?$"
if MpCommon.StringRegExpSearch(l_0_3, l_0_2) or MpCommon.StringRegExpSearch(l_0_4, l_0_2) or MpCommon.StringRegExpSearch(l_0_5, l_0_2) then
  bm.add_related_string("MDE_Path", l_0_2, bm.RelatedStringBMReport)
  local l_0_6 = add_parents() or {}
  local l_0_7 = bm.get_current_process_startup_info()
  if l_0_7 and l_0_7.ppid and checkParentCmdlineCaseInsensitive(l_0_7.ppid, {
    {"setup.exe", ""}
  }, 3) then
    return mp.CLEAN
  end
  bm.add_related_string("Parents", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
  if not string.find(l_0_2, "advanced threat protection", 1, true) then
    bm.add_related_string("AV", "True", bm.RelatedStringBMReport)
    l_0_1 = MpCommon.PathToWin32Path(l_0_1)
    if l_0_1 and not contains(l_0_1, {
      "C:\\ProgramData\\",
      "C:\\Program Files",
      "c:\\windows\\"
    }) then
      bm.trigger_sig("MpTamperPFRO_Susp", l_0_2)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
