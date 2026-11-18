-- Threat: !InfrastructureShared
-- Name: 19b3b79170ba
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
      mp.ReportLowfi(l_0_3, 2969606243)
    end
  end
end
return mp.INFECTED
