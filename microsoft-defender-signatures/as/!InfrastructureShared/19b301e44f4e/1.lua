-- Threat: !InfrastructureShared
-- Name: 19b301e44f4e
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if l_0_3 and sysio.IsFileExists(l_0_3) then
        mp.ReportLowfi(l_0_3, 3331634663)
      end
    end
  end
end
return mp.INFECTED
