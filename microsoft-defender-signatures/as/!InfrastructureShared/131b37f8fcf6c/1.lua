-- Threat: !InfrastructureShared
-- Name: 131b37f8fcf6c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if sysio.IsFileExists("/run/yum.pid") then
  return mp.CLEAN
end
local l_0_0 = "remote_file_created_taint"
local l_0_1, l_0_2
if this_sigattrlog[13].matched then
  l_0_1 = this_sigattrlog[13].utf8p1
  l_0_2 = this_sigattrlog[13].ppid
elseif this_sigattrlog[14].matched then
  l_0_1 = this_sigattrlog[14].utf8p1
  l_0_2 = this_sigattrlog[14].ppid
end
if l_0_1 ~= nil then
  if isParentPackageManager(l_0_2) then
    return mp.CLEAN
  end
  taint(l_0_1, l_0_0, 3600)
  local l_0_3 = bm.get_current_process_startup_info()
  local l_0_4, l_0_5 = bm.get_process_relationships(l_0_3.ppid)
  for l_0_6, l_0_7 in ipairs(l_0_4) do
    bm.add_related_process(l_0_7.ppid)
    TrackPidAndTechniqueBM(l_0_7.ppid, "T1105", "CommandAndControl")
  end
  return mp.INFECTED
end
return mp.CLEAN
