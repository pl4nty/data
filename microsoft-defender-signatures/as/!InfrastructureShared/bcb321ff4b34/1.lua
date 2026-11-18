-- Threat: !InfrastructureShared
-- Name: bcb321ff4b34
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_imagepath()
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = l_0_1.command_line
local l_0_3, l_0_4, l_0_5, l_0_6
l_0_4 = this_sigattrlog[5].utf8p1
l_0_5 = l_0_1.ppid
local l_0_7 = {"/curl", "/wget"}
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if l_0_0:sub(-#l_0_9) == l_0_9 then
    return mp.CLEAN
  end
end
local l_0_10 = "user-agent"
local l_0_11, l_0_12 = pcall(MpCommon.RollingQueueQueryKey, l_0_10, l_0_5)
if l_0_11 and next(l_0_12) then
  l_0_6 = l_0_12.value
end
if l_0_6 ~= nil and string.find(l_0_2, l_0_6, 1, true) then
  taint(l_0_4, "remote_file_created_taint", 3600)
  AppendToRollingQueue("queue_pid_taintfactory_a", l_0_5, 1, 600)
  l_0_3, _ = bm.get_process_relationships()
  for l_0_13, l_0_14 in ipairs(l_0_3) do
    if mp.bitand(l_0_14.reason_ex, 1) == 1 then
      bm.add_related_file(l_0_14.image_path)
      bm.add_related_process(l_0_14.ppid)
      TrackPidAndTechniqueBM(l_0_14.ppid, "T1036.003", "DefenseEvasion")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
