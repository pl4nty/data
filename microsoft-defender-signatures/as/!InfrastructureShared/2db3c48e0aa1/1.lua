-- Threat: !InfrastructureShared
-- Name: 2db3c48e0aa1
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
end
if string.lower(string.gsub(l_0_1, ".exe", "")) == string.lower(string.gsub(l_0_0, ".ahk", "")) then
  return mp.INFECTED
end
return mp.CLEAN
