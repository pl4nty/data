-- Threat: !InfrastructureShared
-- Name: 41b393cb7b50
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
  l_0_2, l_0_3 = string.find(l_0_1, ".dll,")
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_0 = string.sub(l_0_1, 1, l_0_3 - 1)
  else
    l_0_0 = l_0_1
  end
  if l_0_0 == nil or l_0_0 == "" or sysio.IsFileExists(l_0_0) == false then
    return mp.CLEAN
  end
  if string.find(l_0_0, ".exe", -4, true) or string.find(l_0_0, ".dll", -4, true) then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
