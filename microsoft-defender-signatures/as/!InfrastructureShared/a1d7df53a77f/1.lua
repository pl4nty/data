-- Threat: !InfrastructureShared
-- Name: a1d7df53a77f
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.find(l_0_1, "d0027073-ea64-42ca-8293-241186e9011f", 1, true)
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.sub(l_0_1, l_0_3 + 1, -1)
local l_0_5 = ""
local l_0_6 = 0
local l_0_7 = 1
for l_0_8 in string.gmatch(l_0_4, "%S+") do
  if l_0_7 == 1 then
    l_0_5 = l_0_8
  elseif l_0_7 == 2 then
    l_0_6 = tonumber(l_0_8)
  end
  l_0_7 = l_0_7 + 1
end
if l_0_7 < 3 then
  return mp.CLEAN
end
local l_0_9 = {
  mp.SMS_SCAN_ONCE,
  mp.SMS_SCAN_LOW,
  mp.SMS_SCAN_MED,
  mp.SMS_SCAN_HIGH,
  mp.SMS_SCAN_ONCE_ADV,
  mp.SMS_SCAN_LOW_ADV,
  mp.SMS_SCAN_MED_ADV,
  mp.SMS_SCAN_HIGH_ADV,
  mp.EMS_SCAN
}
if l_0_6 == 536870912 then
  mp.SMSAsyncScan(l_0_5)
  return mp.CLEAN
end
for l_0_10, l_0_11 in ipairs(l_0_9) do
  if l_0_11 == l_0_6 then
    MpCommon.RequestSmsOnProcess(l_0_5, l_0_6)
    break
  end
end
return mp.CLEAN
