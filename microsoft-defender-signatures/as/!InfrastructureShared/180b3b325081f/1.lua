-- Threat: !InfrastructureShared
-- Name: 180b3b325081f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[5].utf8p2)
end
if string.find(l_0_3, "do shell script", 1, true) and string.find(l_0_3, "mkdir -p", 1, true) and string.find(l_0_3, "filegrabber", 1, true) and string.find(l_0_3, "tell application", 1, true) and (string.find(l_0_3, "documents", 1, true) or string.find(l_0_3, "downloads", 1, true)) and (string.find(l_0_3, "posix file", 1, true) or string.find(l_0_3, "posix path", 1, true)) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
