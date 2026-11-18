-- Threat: !InfrastructureShared
-- Name: aeb341305902
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "node", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_2 == nil or #l_0_2 <= 2 then
  return mp.CLEAN
end
local l_0_3 = l_0_2 .. "index.js"
if sysio.IsFileExists(l_0_3) then
  mp.ReportLowfi(l_0_3, 1289986745)
  return mp.INFECTED
else
  bm.trigger_sig("SuspNodeJSExecInCurrentFolderBB", l_0_3)
end
return mp.CLEAN
