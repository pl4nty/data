-- Threat: !InfrastructureShared
-- Name: 40b3cab29e67
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
local l_0_1 = {
  "sense",
  "windefend",
  "wdfilter"
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
