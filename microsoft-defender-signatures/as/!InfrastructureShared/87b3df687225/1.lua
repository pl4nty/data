-- Threat: !InfrastructureShared
-- Name: 87b3df687225
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
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[2].utf8p2)
end
if string.find(l_0_3, "do shell script", 1, true) and string.find(l_0_3, "mkdir -p", 1, true) and string.find(l_0_3, "open for access", 1, true) and string.find(l_0_3, "with write permission", 1, true) and string.find(l_0_3, "reverse of every character", 1, true) and (string.find(l_0_3, "posix file", 1, true) or string.find(l_0_3, "posix path", 1, true)) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
