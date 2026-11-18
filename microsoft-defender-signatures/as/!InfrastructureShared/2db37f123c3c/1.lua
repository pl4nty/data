-- Threat: !InfrastructureShared
-- Name: 2db37f123c3c
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
  l_0_2, l_0_3 = string.find(l_0_1, ".cpl,")
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_0 = string.sub(l_0_1, 1, l_0_3 - 1)
  else
    l_0_0 = l_0_1
  end
  if l_0_0 == nil or l_0_0 == "" or sysio.IsFileExists(l_0_0) == false then
    return mp.CLEAN
  end
  if string.find(l_0_0, ".cpl", -4, true) then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
