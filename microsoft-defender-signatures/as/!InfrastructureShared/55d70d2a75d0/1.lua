-- Threat: !InfrastructureShared
-- Name: 55d70d2a75d0
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if l_0_2 == "powershell.exe" or string.find(l_0_2, "^%d+%.exe") then
    local l_0_3 = mp.GetScannedPPID()
    if l_0_3 == nil then
      return mp.CLEAN
    end
    MpCommon.RequestSmsOnProcess(l_0_3, MpCommon.SMS_SCAN_LOW)
    return mp.INFECTED
  end
end
return mp.CLEAN
