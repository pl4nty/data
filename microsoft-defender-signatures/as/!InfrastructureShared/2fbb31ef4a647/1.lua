-- Threat: !InfrastructureShared
-- Name: 2fbb31ef4a647
-- Type: 21

local l_0_0
if this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17].utf8p2
elseif this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) then
      mp.ReportLowfi(l_0_3, 3197181569)
    end
  end
end
return mp.INFECTED
