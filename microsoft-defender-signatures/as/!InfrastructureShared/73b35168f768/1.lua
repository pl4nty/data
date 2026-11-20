-- Threat: !InfrastructureShared
-- Name: 73b35168f768
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
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("txid=(%x+)")
if l_0_3:find("curl", 1, true) and l_0_3:find("post", 1, true) and l_0_3:find("module", 1, true) and l_0_4 ~= nil and 16 <= #l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
