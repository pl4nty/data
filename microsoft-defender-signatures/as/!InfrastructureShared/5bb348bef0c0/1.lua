-- Threat: !InfrastructureShared
-- Name: 5bb348bef0c0
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, "%systemroot%\\", 1, true) or string.find(l_0_0, "\\windows\\", 1, true) or string.find(l_0_0, "%programfiles%\\", 1, true) or string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "%programfiles(x86)%\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
