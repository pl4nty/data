-- Threat: !InfrastructureShared
-- Name: 35b3607b24c5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.ppid
  local l_0_3 = l_0_1.command_line
  if l_0_3 ~= nil then
    l_0_3 = string.lower(l_0_3)
    if l_0_3:find("devenv.exe") or l_0_3:find("msbuild.exe") or l_0_3:find("cl.exe") then
      return mp.CLEAN
    end
    TrackPidAndTechniqueBM(l_0_2, "T1543.003", "persistence")
    return mp.INFECTED
  end
end
return mp.CLEAN
