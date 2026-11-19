-- Threat: !InfrastructureShared
-- Name: e50b31c8fa0ac
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
elseif this_sigattrlog[8].matched then
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
elseif this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19]
elseif this_sigattrlog[20].matched then
  l_0_0 = this_sigattrlog[20]
elseif this_sigattrlog[21].matched then
  l_0_0 = this_sigattrlog[21]
elseif this_sigattrlog[22].matched then
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
elseif this_sigattrlog[41].matched then
  l_0_0 = this_sigattrlog[41]
elseif this_sigattrlog[42].matched then
  l_0_0 = this_sigattrlog[42]
elseif this_sigattrlog[43].matched then
  l_0_0 = this_sigattrlog[43]
elseif this_sigattrlog[44].matched then
  l_0_0 = this_sigattrlog[44]
elseif this_sigattrlog[45].matched then
  l_0_0 = this_sigattrlog[45]
elseif this_sigattrlog[46].matched then
  l_0_0 = this_sigattrlog[46]
elseif this_sigattrlog[47].matched then
  l_0_0 = this_sigattrlog[47]
elseif this_sigattrlog[48].matched then
  l_0_0 = this_sigattrlog[48]
elseif this_sigattrlog[49].matched then
  l_0_0 = this_sigattrlog[49]
elseif this_sigattrlog[50].matched then
  l_0_0 = this_sigattrlog[50]
elseif this_sigattrlog[51].matched then
  l_0_0 = this_sigattrlog[51]
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
local l_0_6 = "ShaiWorm_BM_CredAccess"
local l_0_7 = 600
local l_0_8 = 8
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
    l_0_15.ShaiWormRQName = GetRollingQueueKeys(l_0_6)
    l_0_15.ShaiWormCount = GetRollingQueueCount(l_0_6)
    l_0_15 = safeJsonSerialize(l_0_15)
    bm.add_related_string("ShaiWorm_BM_CredAccess", l_0_15, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1552.001", "shaiworm_credaccess")
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
