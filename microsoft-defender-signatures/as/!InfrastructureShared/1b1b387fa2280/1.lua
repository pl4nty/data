-- Threat: !InfrastructureShared
-- Name: 1b1b387fa2280
-- Type: 21

local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 3307547556)
  end
end
return mp.INFECTED
