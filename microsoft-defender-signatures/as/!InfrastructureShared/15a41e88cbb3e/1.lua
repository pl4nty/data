-- Threat: !InfrastructureShared
-- Name: 15a41e88cbb3e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = 0
local l_0_3 = "RcloneMega"
local l_0_4 = {}
local l_0_5 = 3600
local l_0_6 = 100
local l_0_7 = "|"
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_2 = tonumber(this_sigattrlog[6].utf8p2)
end
local l_0_8 = l_0_0 .. l_0_7 .. l_0_1
local l_0_9 = l_0_8 .. "count"
local l_0_10 = 1
local l_0_11 = MpCommon.AtomicCounterValue(l_0_8)
if l_0_11 == nil then
  MpCommon.AtomicCounterSet(l_0_8, l_0_2, 600)
  MpCommon.AtomicCounterSet(l_0_9, l_0_10, 600)
else
  l_0_11 = MpCommon.AtomicCounterAdd(l_0_8, l_0_2) + l_0_2
  l_0_10 = MpCommon.AtomicCounterAdd(l_0_9, l_0_10) + 1
  if 75000000 < l_0_11 and 10 < l_0_10 then
    l_0_4.ContentLen = l_0_11
    l_0_4.Threshold = l_0_10
    l_0_4.ProcPath = l_0_0
    AppendToRollingQueue(l_0_3, l_0_8, l_0_4, l_0_5, l_0_6, 0)
    return mp.INFECTED
  end
end
return mp.CLEAN
