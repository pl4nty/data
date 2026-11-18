-- Threat: !InfrastructureShared
-- Name: 9cb317d95677
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" then
  local l_0_2 = l_0_1:match("([^/\\]+)$")
  local l_0_3, l_0_4 = l_0_2:match("^(.*)(%.[^%.]+)$")
  local l_0_5 = l_0_0:match("([^/\\]+)$")
  local l_0_6, l_0_7 = l_0_5:match("^(.*)(%.[^%.]+)$")
  l_0_5 = l_0_6 or l_0_5
  if l_0_7 ~= ".cpt" and isKnownRansomExtension(l_0_7) and (l_0_5 == l_0_2 or l_0_5 == l_0_3 or StringStartsWith(l_0_3, l_0_5)) then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
