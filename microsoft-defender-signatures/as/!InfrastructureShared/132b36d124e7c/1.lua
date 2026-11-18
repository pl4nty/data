-- Threat: !InfrastructureShared
-- Name: 132b36d124e7c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = {
  {
    "/usr/bin/run-parts",
    ""
  },
  {
    "/bin/run-parts",
    ""
  }
}
if not l_0_0.ppid or isParentPackageManager(l_0_0.ppid, true) or checkParentCmdline(l_0_0.ppid, l_0_1, 3) then
  return mp.CLEAN
end
local l_0_2 = {}
table.insert(l_0_2, "GrubTampering.A")
MpCommon.SetPersistContextNoPath("isRebootDangerous", l_0_2, 3600)
TrackPidAndTechniqueBM("BM", "T1561.002", "Impact")
return mp.INFECTED
