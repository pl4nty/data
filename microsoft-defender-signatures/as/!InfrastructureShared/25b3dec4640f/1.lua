-- Threat: !InfrastructureShared
-- Name: 25b3dec4640f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if StringStartsWith(l_0_1, "%") then
    return mp.CLEAN
  end
  if l_0_1:find("\\wbem\\wmiprvse.exe", 1, true) or l_0_1:find("-embedding", 1, true) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1036", "masq_wmiprvse")
  return mp.INFECTED
end
return mp.CLEAN
