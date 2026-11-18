-- Threat: !InfrastructureShared
-- Name: 67b3abe246ee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
local l_0_2 = {"/i", "/package"}
if not contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "OFFICE",
  "EMAILCLIENT"
}
local l_0_4 = {min = 1, max = 5}
if QueryProcContext(l_0_3, l_0_4) then
  l_0_1 = true
end
if QueryProcContext({"SCRIPTENG"}, {min = 1, max = 5}) and not contains(l_0_0, "%.msi", false) then
  l_0_1 = true
end
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
