-- Threat: !InfrastructureShared
-- Name: 87b3cd25418e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
if string.len(l_0_0) > 1000 and isIEXfound(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
