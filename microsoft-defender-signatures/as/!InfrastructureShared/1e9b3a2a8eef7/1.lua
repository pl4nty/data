-- Threat: !InfrastructureShared
-- Name: 1e9b3a2a8eef7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil and this_sigattrlog[7].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p2
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p1 ~= "" then
  l_0_1 = this_sigattrlog[5].utf8p1
end
if l_0_1 ~= nil and l_0_1 ~= "" and l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_2 = l_0_1:match("/([^/]+%.app)")
  if l_0_2 ~= nil and l_0_2 ~= "" and l_0_0:find(l_0_2, 1, true) then
    reportRelatedBmHits()
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
    return mp.INFECTED
  end
end
return mp.CLEAN
