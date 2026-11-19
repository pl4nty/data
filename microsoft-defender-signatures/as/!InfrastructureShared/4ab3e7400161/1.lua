-- Threat: !InfrastructureShared
-- Name: 4ab3e7400161
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_imagepath()
local l_0_1, l_0_2, l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[2].utf8p1
  l_0_3 = this_sigattrlog[2].ppid
end
local l_0_4 = {"/curl", "/wget"}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if l_0_0:sub(-#l_0_6) == l_0_6 then
    return mp.CLEAN
  end
end
taint(l_0_2, "remote_file_created_taint", 3600)
AppendToRollingQueue("queue_pid_taintfactory_a", l_0_3, 1, 600)
l_0_1, _ = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_1) do
  if mp.bitand(l_0_8.reason_ex, 1) == 1 then
    bm.add_related_file(l_0_8.image_path)
    bm.add_related_process(l_0_8.ppid)
    TrackPidAndTechniqueBM(l_0_8.ppid, "T1036.003", "DefenseEvasion")
    return mp.INFECTED
  end
end
return mp.CLEAN
