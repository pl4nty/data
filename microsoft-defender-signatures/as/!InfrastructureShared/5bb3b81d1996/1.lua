-- Threat: !InfrastructureShared
-- Name: 5bb3b81d1996
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = this_sigattrlog[1].utf8p2
  local l_0_2 = {}
  table.insert(l_0_2, l_0_0)
  table.insert(l_0_2, l_0_1)
  MpCommon.SetPersistContextNoPath("dllhijack_winbio_A", l_0_2, 480)
  bm.add_related_file(l_0_0)
  bm.add_threat_file(l_0_1)
end
return mp.INFECTED
