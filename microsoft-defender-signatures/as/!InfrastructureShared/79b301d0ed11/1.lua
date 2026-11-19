-- Threat: !InfrastructureShared
-- Name: 79b301d0ed11
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].ppid
end
if l_0_0 then
  local l_0_1 = bm.get_process_notifications(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if l_0_3.tag == bm.ActionTagFileCreate then
        local l_0_4 = l_0_3.rawutf8p1
        taint(l_0_4, "remote_file_created_taint", 3600)
        AppendToRollingQueue("queue_pid_taintfactory_a", l_0_0, 1, 600)
        local l_0_5 = bm.get_current_process_startup_info()
        local l_0_6, l_0_7 = bm.get_process_relationships(l_0_5.ppid)
        for l_0_8, l_0_9 in ipairs(l_0_6) do
          bm.add_related_process(l_0_9.ppid)
          TrackPidAndTechniqueBM(l_0_9.ppid, "T1105", "CommandAndControl")
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
