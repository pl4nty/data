-- Threat: !InfrastructureShared
-- Name: 1d2b3019f456b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if l_0_1:find("gitlab-runner run --working-directory", 1, true) or l_0_1:find("www.istitutomarangoni.com", 1, true) or l_0_1:find("gitlab-runner run --working-directory", 1, true) or l_0_1:find("java -jar remoting.jar", 1, true) then
  return mp.CLEAN
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  local l_0_3 = this_sigattrlog[7].utf8p1
  if SuspMacPathsToMonitor(l_0_3, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
