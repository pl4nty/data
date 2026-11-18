-- Threat: !InfrastructureShared
-- Name: 151b32a14f1cd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1
local l_0_2 = {
  {
    "/usr/bin/make",
    ""
  },
  {
    "/usr/bin/ninja",
    ""
  }
}
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[8].utf8p1
end
if not (l_0_0.ppid and l_0_1) or isParentPackageManager(l_0_0.ppid, true) or checkParentCmdline(l_0_0.ppid, l_0_2, 3) or not isTainted(l_0_1, "remote_file_created_taint") then
  return mp.CLEAN
end
return mp.INFECTED
