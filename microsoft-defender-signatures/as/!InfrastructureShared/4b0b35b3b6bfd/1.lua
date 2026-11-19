-- Threat: !InfrastructureShared
-- Name: 4b0b35b3b6bfd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8]
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9]
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10]
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11]
elseif this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12]
elseif this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13]
elseif this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14]
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15]
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16]
elseif this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17]
elseif this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18]
end
if not l_0_0 or not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.utf8p2)
local l_0_2 = bm.get_current_process_startup_info()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_2.ppid or "0"
local l_0_4 = bm.get_imagepath() or ""
local l_0_5 = string.lower(l_0_4:match("([^/]+)$") or "")
local l_0_6 = "NpmCredHarvest_BM"
local l_0_7 = 600
local l_0_8 = 1
local l_0_9 = 100
local l_0_10 = "|"
local l_0_11 = tostring(l_0_3) .. l_0_10 .. l_0_5
local l_0_12 = GetRollingQueueKeyValues(l_0_6, l_0_11)
if l_0_12 then
  for l_0_13, l_0_14 in ipairs(l_0_12) do
    if l_0_14 and l_0_14.value == l_0_1 then
      return mp.CLEAN
    end
  end
  if l_0_8 <= #l_0_12 then
    local l_0_15 = {}
    l_0_15.NpmCredHarvestRQName = GetRollingQueueKeys(l_0_6)
    l_0_15.NpmCredHarvestCount = GetRollingQueueCount(l_0_6)
    l_0_15 = safeJsonSerialize(l_0_15)
    bm.add_related_string("NpmCredHarvest_BM", l_0_15, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1552.001", "npm_credharvest")
    add_parents()
    local l_0_16, l_0_17 = pcall(reportBmInfo)
    if not l_0_16 and l_0_17 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_17), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
AppendToRollingQueue(l_0_6, l_0_11, l_0_1, l_0_7, l_0_9, 0)
return mp.CLEAN
