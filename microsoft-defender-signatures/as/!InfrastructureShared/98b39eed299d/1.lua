-- Threat: !InfrastructureShared
-- Name: 98b39eed299d
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
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_3 ~= "" and l_0_3 ~= nil and string.find(l_0_3, "curl", 1, true) and string.find(l_0_3, "post", 1, true) and string.find(l_0_3, "-s --max-time", 1, true) and string.find(l_0_3, "jsonrpc", 1, true) and string.find(l_0_3, "eth_call", 1, true) and string.find(l_0_3, "echo ", 1, true) and string.find(l_0_3, " | sed ", 1, true) and string.find(l_0_3, "exit ", 1, true) and string.find(l_0_3, "print", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
