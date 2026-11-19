-- Threat: !InfrastructureShared
-- Name: 159b32161686f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
TrackCustomPersistContextNameByPPID("set", l_0_2.ppid, "MimikatzTrigger")
bm.request_SMS(l_0_2.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
