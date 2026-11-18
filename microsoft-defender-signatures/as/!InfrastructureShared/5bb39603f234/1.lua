-- Threat: !InfrastructureShared
-- Name: 5bb39603f234
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = string.match(l_0_0, "macfqdn:([^;]+)")
  if not l_0_1 then
    return mp.CLEAN
  end
  if IsHostAttackServer(l_0_1) then
    AddResearchData("BM", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
