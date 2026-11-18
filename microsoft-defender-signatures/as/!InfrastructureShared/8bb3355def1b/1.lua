-- Threat: !InfrastructureShared
-- Name: 8bb3355def1b
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0:find("svchost.exe") then
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1), 2527504772)
  return mp.INFECTED
end
return mp.CLEAN
