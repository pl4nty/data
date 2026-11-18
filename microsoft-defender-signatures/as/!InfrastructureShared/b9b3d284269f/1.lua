-- Threat: !InfrastructureShared
-- Name: b9b3d284269f
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = "remote_file_created_taint"
local l_0_3 = {
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
  }
}
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p1
end
if this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_1 ~= nil and l_0_0 ~= nil and isTainted(l_0_1, l_0_2) then
  local l_0_4 = bm.get_current_process_startup_info()
  local l_0_5 = bm.get_imagepath()
  if l_0_4 ~= nil and l_0_4.ppid ~= nil and l_0_5 ~= nil and l_0_4.command_line ~= nil then
    for l_0_6, l_0_7 in ipairs(l_0_3) do
      local l_0_8 = l_0_7[1]
      local l_0_9 = l_0_7[2]
      if string.find(l_0_5, l_0_8, 1, true) and string.find(l_0_4.command_line, l_0_9, 1, true) then
        return mp.CLEAN
      end
    end
    taint(l_0_0, l_0_2, 3600)
    TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl")
    AppendToRollingQueue("queue_pid_taintfactory_a", l_0_4.ppid, 1, 600)
    local l_0_10, l_0_11 = bm.get_process_relationships(l_0_4.ppid)
    for l_0_12, l_0_13 in ipairs(l_0_10) do
      bm.add_related_process(l_0_13.ppid)
      TrackPidAndTechniqueBM(l_0_13.ppid, "T1105", "CommandAndControl")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
