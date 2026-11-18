-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win64/BoostedFugu.A
-- Type: 9
-- MpAttributes: PEBMPAT:BoostedFugu.A & pea_isdll & pea_no_security

local l_0_0 = pe.get_postemu_sigattr_log_head_size()
for l_0_1 = 1, l_0_0 do
  local l_0_2 = pe.get_postemu_sigattr_log_head(l_0_1)
  if l_0_2.attribute == 12296 and l_0_2.p1 ~= nil and #l_0_2.p1 > 0 and #l_0_2.p1 < 260 and sysio.IsFileExists(l_0_2.p1) then
    mp.ReportLowfi(l_0_2.p1, 180264216)
    break
  end
end
return mp.INFECTED
