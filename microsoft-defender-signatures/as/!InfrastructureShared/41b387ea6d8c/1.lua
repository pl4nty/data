-- Threat: !InfrastructureShared
-- Name: 41b387ea6d8c
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
elseif this_sigattrlog[2].matched then
  local l_0_1 = this_sigattrlog[2].utf8p2
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
