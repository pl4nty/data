-- Threat: !InfrastructureShared
-- Name: 3a0b3a41e7284
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0
local l_0_1 = bm.get_imagepath()
local l_0_2 = ""
local l_0_3 = 0
local l_0_4 = bm.get_current_process_startup_info()
if l_0_4 and l_0_4.ppid then
  l_0_3 = l_0_4.ppid
end
if l_0_1 == nil then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_2 = "BM_fsutil_symlink"
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_2 = "BM_iisreset_stop"
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_2 = "BM_VSS_Shadowcopy"
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
  l_0_2 = "BM_WMIC_Shadowcopy"
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
  l_0_2 = "BM_bcdedit_Shadowcopy"
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
  l_0_2 = "BM_bcdedit_Shadowcopy"
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
  l_0_2 = "BM_clearlog"
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
  l_0_2 = "masskill"
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
  l_0_2 = "masskill"
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
  l_0_2 = "masskill"
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
  l_0_2 = "BM_GenRansom"
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2
  l_0_2 = "RansomNote"
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
  l_0_2 = "RansomNote"
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p2
  l_0_2 = "RansomNote"
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p2
  l_0_2 = "RansomNote"
end
if l_0_2 == "masskill" and 10 <= AddToAtomicCounter(l_0_2, 1, 600) then
  l_0_2 = "BM_masskill"
end
if l_0_2 == "RansomNote" and 5 <= AddToAtomicCounter(l_0_2, 1, 600) then
  l_0_2 = "BM_RansomNote"
end
if StringStartsWith(l_0_2, "BM_") then
  if MpCommon.DoesProcessHaveAttribute(l_0_3, l_0_2) or MpCommon.DoesProcessHaveAttribute(l_0_3, "inherit:" .. l_0_2) then
    return mp.CLEAN
  end
  MpCommon.AddProcessAttribute(l_0_3, l_0_2, l_0_0, false)
  local l_0_5 = MpCommon.GetProcessAttributes(l_0_3)
  if 3 < #l_0_5 then
    bm.add_related_string("RanProcAttrib", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
