-- Threat: !InfrastructureShared
-- Name: 93d703036753
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "schtasks.exe", 1, true) and l_0_0.ppid ~= nil then
    local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
    if l_0_2 ~= nil then
      MpCommon.RequestSmsOnProcess(l_0_2.ppid, MpCommon.SMS_SCAN_MED)
      mp.SMSAsyncScan(l_0_2.ppid)
      return mp.LOWFI
    end
  else
    MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
    mp.SMSAsyncScan(l_0_0.ppid)
    return mp.LOWFI
  end
end
return mp.LOWFI
