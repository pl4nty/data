-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\2a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (sysio.RegOpenKey)("hklm\\software\\microsoft\\skw")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (sysio.GetRegValueAsBinary)(l_0_0, "d")
local l_0_2 = (MpCommon.BinaryRegExpSearch)("GetCurrentProcess", l_0_1)
local l_0_3 = (MpCommon.BinaryRegExpSearch)("GetTokenInformation", l_0_1)
local l_0_4 = (MpCommon.BinaryRegExpSearch)("OpenProcessToken", l_0_1)
if l_0_2 ~= nil and l_0_3 ~= nil and l_0_4 ~= nil then
  (bm.set_detection_string)("HSTR:IntentToSystemInformationDiscovery.A")
end
local l_0_5 = (MpCommon.BinaryRegExpSearch)("gethostname", l_0_1)
local l_0_6 = (MpCommon.BinaryRegExpSearch)("getaddrinfo", l_0_1)
if l_0_5 or l_0_6 then
  (bm.set_detection_string)("HSTR:IntentToGetDomain.A")
end
local l_0_7 = (MpCommon.BinaryRegExpSearch)("GetComputerName", l_0_1)
if l_0_7 then
  (bm.set_detection_string)("HSTR:IntentToGetComputerName.A")
end
local l_0_8 = (MpCommon.BinaryRegExpSearch)("GetUserNameA", l_0_1)
if l_0_8 then
  (bm.set_detection_string)("HSTR:IntentToGetUsername.A")
end
local l_0_9 = (MpCommon.BinaryRegExpSearch)("GetUserGeoID", l_0_1)
local l_0_10 = (MpCommon.BinaryRegExpSearch)("GetGeoInfoW", l_0_1)
if l_0_9 and l_0_10 then
  (bm.set_detection_string)("HSTR:IntentToGetGeoInfo.A")
end
local l_0_11 = (MpCommon.BinaryRegExpSearch)("rtlGetVersion", l_0_1)
if l_0_11 then
  (bm.set_detection_string)("HSTR:IntentToSystemInformationDiscovery.A")
end
local l_0_12 = (MpCommon.BinaryRegExpSearch)("GetKeyboardLayout", l_0_1)
local l_0_13 = (MpCommon.BinaryRegExpSearch)("GetTextCharset", l_0_1)
if l_0_12 or l_0_13 then
  (bm.set_detection_string)("HSTR:IntentToSystemLanguageDiscovery.A")
end
return mp.INFECTED

