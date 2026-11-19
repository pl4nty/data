-- Threat: !InfrastructureShared
-- Name: 7ebb3fcc158fe
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18]
end
if this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19]
end
local l_0_1, l_0_2 = string.match(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3))
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = mp.GetPPidFromPid(l_0_2)
bm.add_related_process(l_0_5)
if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
  bm.add_related_file(l_0_4)
  bm.add_related_string("SUSPICIOUS PATH: ", l_0_1, bm.RelatedStringBMReport)
  bm.request_SMS(l_0_5, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  AppendToRollingQueue("AMSIpatch", "Amsi", "1", 86400)
  return mp.INFECTED
end
return mp.CLEAN
