-- Threat: !InfrastructureShared
-- Name: 5bb3a3579ede
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(l_0_0.utf8p2))
local l_0_2 = {
  "-nop -w h",
  "-w hidden",
  "-windowstyle hidden"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
