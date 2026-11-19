-- Threat: !InfrastructureShared
-- Name: 267b3d9d9f5de
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 <= 15 or string.sub(l_0_0, -12) ~= "\\spoolsv.exe" then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
TrackCustomPersistContextNameByPPID("set", l_0_1.ppid, "MimikatzTrigger")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
