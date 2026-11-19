-- Threat: !InfrastructureShared
-- Name: 7ebb33a0ef967
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = ""
local l_0_1 = 30
local l_0_2 = "DataStager"
local l_0_3 = {}
local l_0_4 = 60
local l_0_5 = 100
local l_0_6 = "|"
if this_sigattrlog[22].matched then
  l_0_0 = this_sigattrlog[22]
elseif this_sigattrlog[23].matched then
  l_0_0 = this_sigattrlog[23]
elseif this_sigattrlog[24].matched then
  l_0_0 = this_sigattrlog[24]
elseif this_sigattrlog[25].matched then
  l_0_0 = this_sigattrlog[25]
elseif this_sigattrlog[26].matched then
  l_0_0 = this_sigattrlog[26]
elseif this_sigattrlog[27].matched then
  l_0_0 = this_sigattrlog[27]
elseif this_sigattrlog[28].matched then
  l_0_0 = this_sigattrlog[28]
elseif this_sigattrlog[29].matched then
  l_0_0 = this_sigattrlog[29]
elseif this_sigattrlog[30].matched then
  l_0_0 = this_sigattrlog[30]
elseif this_sigattrlog[31].matched then
  l_0_0 = this_sigattrlog[31]
elseif this_sigattrlog[32].matched then
  l_0_0 = this_sigattrlog[32]
elseif this_sigattrlog[33].matched then
  l_0_0 = this_sigattrlog[33]
elseif this_sigattrlog[34].matched then
  l_0_0 = this_sigattrlog[34]
elseif this_sigattrlog[35].matched then
  l_0_0 = this_sigattrlog[35]
elseif this_sigattrlog[36].matched then
  l_0_0 = this_sigattrlog[36]
elseif this_sigattrlog[37].matched then
  l_0_0 = this_sigattrlog[37]
elseif this_sigattrlog[38].matched then
  l_0_0 = this_sigattrlog[38]
elseif this_sigattrlog[39].matched then
  l_0_0 = this_sigattrlog[39]
elseif this_sigattrlog[40].matched then
  l_0_0 = this_sigattrlog[40]
else
  return mp.CLEAN
end

local function l_0_7(l_1_0)
  return l_1_0:match("(.*[/\\])")
end

local l_0_8 = l_0_0.utf8p1
local l_0_9 = l_0_0.utf8p2
if l_0_7(l_0_8) == l_0_7(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = bm.get_current_process_startup_info()
local l_0_11 = MpCommon.PathToWin32Path(bm.get_imagepath())
local l_0_12 = l_0_10.ppid .. l_0_6 .. l_0_11 .. l_0_6 .. l_0_7(l_0_9)
local l_0_13 = GetRollingQueueKeyValues(l_0_2, l_0_12)
if l_0_13 then
  for l_0_14, l_0_15 in ipairs(l_0_13) do
    if l_0_15 and l_0_15.value == l_0_9 then
      return mp.CLEAN
    end
  end
  if l_0_1 < #l_0_13 then
    l_0_3.DataStagerRQName = GetRollingQueueKeys(l_0_2)
    l_0_3.DataStagerCount = GetRollingQueueCount(l_0_2)
    l_0_3 = MpCommon.JsonSerialize(l_0_3)
    bm.add_related_string("DataStagerInfo", l_0_3, bm.RelatedStringBMReport)
    reportSessionInformation()
    reportTimingData()
    return mp.INFECTED
  end
end
AppendToRollingQueue(l_0_2, l_0_12, l_0_9, l_0_4, l_0_5, 0)
return mp.CLEAN
