-- Threat: !InfrastructureShared
-- Name: 53b312b94a03
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  mp.TriggerScanResource("file", l_0_0, 0)
  return mp.INFECTED
end
return mp.CLEAN
