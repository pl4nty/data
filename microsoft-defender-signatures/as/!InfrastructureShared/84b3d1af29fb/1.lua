-- Threat: !InfrastructureShared
-- Name: 84b3d1af29fb
-- Type: 21
-- Includes: BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = mp.CLEAN
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
    l_0_0 = reportGenericRansomware(this_sigattrlog[1].utf8p2)
  elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
    l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2)
  end
  if l_0_0 == mp.INFECTED then
    return mp.INFECTED
  end
end
return mp.CLEAN
