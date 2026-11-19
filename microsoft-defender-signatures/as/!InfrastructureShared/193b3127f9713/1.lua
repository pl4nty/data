-- Threat: !InfrastructureShared
-- Name: 193b3127f9713
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  if this_sigattrlog[2].utf8p2 ~= nil then
    local l_0_2 = this_sigattrlog[2].utf8p2
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
    end
  end
  if this_sigattrlog[2].utf8p1 ~= nil then
    l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  end
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_0 ~= nil and l_0_1 ~= nil and string.find(l_0_0, l_0_1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
