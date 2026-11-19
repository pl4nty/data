-- Threat: !InfrastructureShared
-- Name: 32b305bf5764
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.trigger_sig_delayed("Report_hmdprecisionpulsefullfilepathscan_statuscheck_10", l_0_0, 300000)
  bm.trigger_sig("SummaryReport_hmdprecisionpulsefullfilepathscan", "A")
end
return mp.CLEAN
