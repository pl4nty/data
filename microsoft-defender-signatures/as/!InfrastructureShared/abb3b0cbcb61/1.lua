-- Threat: !InfrastructureShared
-- Name: abb3b0cbcb61
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[2].utf8p2):match("|app=(.-)|")
if l_0_0 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
    mp.ReportLowfi(l_0_0, 2240217800)
  end
end
return mp.INFECTED
