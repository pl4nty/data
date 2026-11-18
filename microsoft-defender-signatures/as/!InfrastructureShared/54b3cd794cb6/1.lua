-- Threat: !InfrastructureShared
-- Name: 54b3cd794cb6
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1))
else
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_0, "BitsadminTarget") then
  mp.ReportLowfi(l_0_0, 1556043553)
  return mp.INFECTED
end
return mp.CLEAN
