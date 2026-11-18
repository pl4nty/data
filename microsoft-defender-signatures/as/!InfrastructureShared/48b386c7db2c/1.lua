-- Threat: !InfrastructureShared
-- Name: 48b386c7db2c
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1)
  if l_0_0 ~= nil then
    mp.ReportLowfi(l_0_0, 3467016256)
  end
end
return mp.INFECTED
