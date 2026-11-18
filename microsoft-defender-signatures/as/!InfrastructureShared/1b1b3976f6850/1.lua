-- Threat: !InfrastructureShared
-- Name: 1b1b3976f6850
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = ""
local l_0_1 = this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_1, "Uri=([^;]+)")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_2.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
local l_0_3 = {}
l_0_3.SIG_CONTEXT = "LummaC2_tempPath"
l_0_3.CONTENT_SOURCE = "BM"
l_0_3.TAG = "INTERFLOW"
local l_0_4, l_0_5 = mp.CheckUrl(l_0_0)
if l_0_4 == 1 and l_0_5 == 1 then
  return mp.CLEAN
end
local l_0_6 = SafeGetUrlReputation({l_0_0}, l_0_3, false, 2000)
if l_0_6.urls[l_0_0] and l_0_6.urls[l_0_0].determination == 2 and l_0_6.urls[l_0_0].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
