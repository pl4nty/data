-- Threat: !InfrastructureShared
-- Name: 195b365928c49
-- Type: 21

if this_sigattrlog[11].matched then
  local l_0_0, l_0_1 = string.match(this_sigattrlog[11].ppid, "pid:(%w+),ProcessStart:(%w+)")
  local l_0_2 = tonumber(l_0_0)
  local l_0_3 = tonumber(l_0_1)
  local l_0_4, l_0_5 = mp.bsplit(l_0_3, 32)
  local l_0_6 = string.format("ppids:{{%d,%d,%d}}\000", l_0_2, l_0_4, l_0_5)
  mp.TriggerScanResource("ems", l_0_6)
end
return mp.INFECTED
