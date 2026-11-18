-- Threat: !InfrastructureShared
-- Name: 7b2b3b46372c8
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = "remote_file_created_taint"
local l_0_1 = {
  {
    "/bin/python",
    "/bin/pip"
  },
  {
    "/bin/python",
    "-m pip"
  },
  {
    "/bin/python",
    "/bin/yum"
  },
  {
    "/bin/ruby",
    "/opt/microsoft/omsagent"
  },
  {
    "/opt/dsc/bin/dsc_host",
    ""
  }
}
local l_0_2
if this_sigattrlog[27].matched then
  l_0_2 = this_sigattrlog[27].utf8p1
end
if l_0_2 ~= nil then
  local l_0_3 = bm.get_current_process_startup_info()
  local l_0_4 = bm.get_imagepath()
  if l_0_3 ~= nil and l_0_3.ppid ~= nil and l_0_4 ~= nil and l_0_3.command_line ~= nil then
    for l_0_5, l_0_6 in ipairs(l_0_1) do
      local l_0_7 = l_0_6[1]
      local l_0_8 = l_0_6[2]
      if string.find(l_0_4, l_0_7, 1, true) and string.find(l_0_3.command_line, l_0_8, 1, true) then
        return mp.CLEAN
      end
    end
    taint(l_0_2, l_0_0, 3600)
    TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl")
    AppendToRollingQueue("queue_pid_taintfactory_a", l_0_3.ppid, 1, 600)
    local l_0_9, l_0_10 = bm.get_process_relationships(l_0_3.ppid)
    for l_0_11, l_0_12 in ipairs(l_0_9) do
      bm.add_related_process(l_0_12.ppid)
      TrackPidAndTechniqueBM(l_0_12.ppid, "T1105", "CommandAndControl")
    end
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
