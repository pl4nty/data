-- Threat: !InfrastructureShared
-- Name: 1f5b34c385551
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2
local l_0_3 = {
  {
    "/usr/bin/make",
    ""
  },
  {
    "/usr/bin/ninja",
    ""
  }
}
if l_0_1.ppid == nil or l_0_0 == nil or isParentPackageManager(l_0_1.ppid, true) or checkParentCmdline(l_0_1.ppid, l_0_3, 3) then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[12].utf8p1
end
if l_0_2 == nil then
  return mp.CLEAN
end
if isTainted(l_0_0, "remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  bm.add_related_file(l_0_2)
  TrackPidAndTechniqueBM("BM", "T1036", "DefenseEvasion_Masquerading_FileDropinBinByRemoteFile")
  return mp.INFECTED
end
return mp.CLEAN
