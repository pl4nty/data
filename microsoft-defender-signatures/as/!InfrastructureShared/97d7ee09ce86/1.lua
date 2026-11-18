-- Threat: !InfrastructureShared
-- Name: 97d7ee09ce86
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.match(string.lower(l_0_0.image_path), "([^\\]+)$")
  if l_0_1 == "powershell.exe" then
    return mp.CLEAN
  end
  if l_0_1 == "cmd.exe" then
    return mp.CLEAN
  end
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
  mp.AddDeferredBMAction("SmsAsyncScanEvent", 10000)
  return mp.INFECTED
end
return mp.CLEAN
