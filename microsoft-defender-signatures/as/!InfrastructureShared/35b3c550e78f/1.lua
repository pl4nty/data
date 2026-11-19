-- Threat: !InfrastructureShared
-- Name: 35b3c550e78f
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  if l_0_2:match("([^\\]+)$") == "svchost.exe" then
    MpCommon.TurnNriOnProcess(l_0_0.ppid)
    bm.request_SMS(l_0_0.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
    return mp.INFECTED
  end
end
return mp.CLEAN
