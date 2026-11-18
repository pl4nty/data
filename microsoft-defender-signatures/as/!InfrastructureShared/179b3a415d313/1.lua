-- Threat: !InfrastructureShared
-- Name: 179b3a415d313
-- Type: 21

if this_sigattrlog[9].matched then
  local l_0_0, l_0_1 = string.match(this_sigattrlog[9].ppid, "pid:(%w+),ProcessStart:(%w+)")
  local l_0_2 = tonumber(l_0_0)
  local l_0_3 = tonumber(l_0_1)
  local l_0_4, l_0_5 = mp.bsplit(l_0_3, 32)
  local l_0_6 = string.format("ppids:{{%d,%d,%d}}\000", l_0_2, l_0_4, l_0_5)
  mp.TriggerScanResource("ems", l_0_6)
end
return mp.INFECTED
