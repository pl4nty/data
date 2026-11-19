-- Threat: !InfrastructureShared
-- Name: 6cb3e1004e1d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = ""
local l_0_1 = ""
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if not (l_0_0 and l_0_1) or l_0_0 ~= l_0_1 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
local l_0_3 = {
  {
    "/usr/sbin/httpd",
    ""
  },
  {
    "/usr/sbin/apache",
    ""
  },
  {
    "/usr/sbin/nginx",
    ""
  },
  {
    "/usr/sbin/lighttpd",
    ""
  }
}
if not l_0_2.ppid or not checkParentCmdline(l_0_2.ppid, l_0_3, 5) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1190", "InitialAccess_FileDrop")
return mp.INFECTED
