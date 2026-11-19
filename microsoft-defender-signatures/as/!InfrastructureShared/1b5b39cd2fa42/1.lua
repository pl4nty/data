-- Threat: !InfrastructureShared
-- Name: 1b5b39cd2fa42
-- Type: 21

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  mp.ReportLowfi(l_0_0, 694214086)
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
