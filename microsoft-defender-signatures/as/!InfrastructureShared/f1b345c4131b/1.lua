-- Threat: !InfrastructureShared
-- Name: f1b345c4131b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3
if not this_sigattrlog[6].matched or this_sigattrlog[6].utf8p2 == nil or this_sigattrlog[6].utf8p2 == "" or this_sigattrlog[6].utf8p1 == nil or this_sigattrlog[6].utf8p1 == "" then
  return mp.CLEAN
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_2 = this_sigattrlog[5].utf8p2
end
if not SuspMacPathsToMonitor(l_0_2, true) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[6].utf8p2
l_0_0 = this_sigattrlog[6].utf8p1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[3].utf8p2
end
if l_0_2 ~= nil and l_0_0 ~= nil and l_0_1 ~= nil and l_0_3 ~= nil then
  local l_0_4 = l_0_2:match("[^/]*$")
  if not string.find(l_0_3, l_0_4, 1, true) then
    return mp.CLEAN
  end
  if l_0_2 == l_0_0 or string.find(l_0_1, l_0_4, 1, true) then
    bm.trigger_sig("CurlDownChmodExec", l_0_2)
    return mp.INFECTED
  end
end
return mp.CLEAN
