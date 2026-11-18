-- Threat: !InfrastructureShared
-- Name: 65b3627136e7
-- Type: 21

function checkPossibleEncoded(l_1_0, l_1_1, l_1_2)
  for l_1_3 in l_1_0:gmatch(l_1_1) do
    if l_1_2 <= string.len(l_1_3) then
      return true
    end
  end
  return false
end

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
l_0_0 = string.lower(l_0_0)
if string.len(l_0_0) < 2048 then
  return mp.CLEAN
end
if string.find(l_0_0, "%.ps1") then
  return mp.CLEAN
end
if checkPossibleEncoded(l_0_0, "%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w+", 2048) then
  local l_0_1, l_0_2 = string.match(l_0_0, " ([-/]wi?n?d?o?w?s?s?t?y?l?e?)%s+(%w+)%s")
  if l_0_2 == "1" or string.find(l_0_2, "^hi") then
    return mp.INFECTED
  end
end
return mp.CLEAN
