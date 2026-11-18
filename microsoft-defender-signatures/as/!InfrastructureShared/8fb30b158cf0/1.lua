-- Threat: !InfrastructureShared
-- Name: 8fb30b158cf0
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = {}
l_0_1.scenario = this_sigattrlog[1].utf8p1
l_0_1.rawchain = this_sigattrlog[1].utf8p2
bm.add_related_string("RemoteInvocation_scenario", l_0_1.scenario, bm.RelatedStringBMReport)
bm.add_related_string("RemoteInvocation_info", l_0_1.rawchain, bm.RelatedStringBMReport)
bm.trigger_sig(l_0_1.scenario, l_0_1.rawchain)
if this_sigattrlog[3].matched then
  l_0_1.bmdetection = {
    path = bm.get_imagepath(),
    cmd = l_0_0.command_line,
    name = this_sigattrlog[3].utf8p1
  }
end
if this_sigattrlog[2].matched then
  l_0_1.filedetection = {
    path = this_sigattrlog[2].utf8p1,
    name = this_sigattrlog[2].utf8p2
  }
end
if this_sigattrlog[4].matched then
  l_0_1.GenRansom = {
    detection_tyep = this_sigattrlog[4].utf8p1,
    genransommeta = this_sigattrlog[4].utf8p2
  }
end
local l_0_2 = explode(l_0_1.rawchain, ";")
for l_0_3 = 2, #l_0_2 do
  pcall(bm.add_related_process, l_0_2[l_0_3])
end
local l_0_4 = this_sigattrlog[1].utf8p1 .. "|" .. MpCommon.Base64Encode(this_sigattrlog[1].image_path)
l_0_1.triggersessioninformation = GetRollingQueue(l_0_4)
bm.add_related_string("RemoteInvocation_data", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
local l_0_5 = {}
local l_0_6 = {
  UserName = MpCommon.WTSUserName,
  Domain = MpCommon.WTSDomainName,
  ClientIP = MpCommon.WTSClientAddress
}
local l_0_7 = querySessionInformation(l_0_0.ppid, l_0_6)
if l_0_7.UserName ~= nil and l_0_7.Domain ~= nil then
  l_0_5.USER_INFO = scrubData(l_0_7.Domain) .. ":" .. scrubData(l_0_7.UserName)
  l_0_5.SIG_CONTEXT = "BM:" .. l_0_1.scenario
  l_0_5.CONTENT_SOURCE = l_0_1.rawchain
  l_0_5.TAG = "NOLOOKUP"
  l_0_5.DETECTION_NAME = ""
  if l_0_1.bmdetection ~= nil then
    l_0_5.DETECTION_NAME = l_0_1.bmdetection.name
  end
  if l_0_1.filedetection ~= nil then
    l_0_5.DETECTION_NAME = l_0_5.DETECTION_NAME .. ";" .. l_0_1.filedetection.name
  end
  if l_0_7.ClientIP ~= nil then
    l_0_5.SOURCE_IP = l_0_7.ClientIP.Address or ""
  end
  pcall(mp.GetUrlReputation, {
    "http://9ffced16-b0f2-4cf0-b08a-ef2c11396d05.info"
  }, l_0_5)
end
return mp.INFECTED
