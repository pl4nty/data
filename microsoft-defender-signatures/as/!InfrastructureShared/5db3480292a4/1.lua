-- Threat: !InfrastructureShared
-- Name: 5db3480292a4
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil then
    local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if sysio.IsFileExists(l_0_3) then
        mp.ReportLowfi(l_0_3, 3384585025)
        bm.add_related_file(l_0_3)
      end
    end
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  if l_0_0 ~= nil then
    local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
      if sysio.IsFileExists(l_0_6) then
        mp.ReportLowfi(l_0_6, 1354103547)
        bm.add_related_file(l_0_6)
      end
    end
  end
end
return mp.INFECTED
