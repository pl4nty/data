-- Threat: !InfrastructureShared
-- Name: 2d416d246d58
-- Type: 21

local l_0_0 = MpCommon.GetCurrentTimeT() / 100000
if 100 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 140
local l_0_2 = 141
local l_0_3 = {}
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
if this_sigattrlog[1].matched == true then
  local l_0_7 = this_sigattrlog[1].p1
  local l_0_8, l_0_9 = MpCommon.SNidSearch(l_0_1, "00000000" .. l_0_7)
  if l_0_8 == true and l_0_9:sub(1, 20) == "!#AvoidList:NRI:JA3:" then
    l_0_5 = true
    l_0_6 = true
  end
  if l_0_5 == false then
    l_0_3.TlsJa3CHash = l_0_7
  end
end
if this_sigattrlog[2].matched == true then
  local l_0_10 = this_sigattrlog[2].p1
  local l_0_11, l_0_12 = MpCommon.SNidSearch(l_0_2, "00000000" .. l_0_10)
  if l_0_11 == true and l_0_12:sub(1, 20) == "!#AvoidList:NRI:JA3:" then
    l_0_5 = true
  end
  if l_0_5 == false and l_0_6 == false then
    l_0_3.TlsJa3SHash = l_0_10
    l_0_4 = true
  end
end
if l_0_4 == true then
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
