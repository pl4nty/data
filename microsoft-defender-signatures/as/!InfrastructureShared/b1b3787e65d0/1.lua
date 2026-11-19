-- Threat: !InfrastructureShared
-- Name: b1b3787e65d0
-- Type: 21

local l_0_0 = bm.get_imagepath()
local l_0_1 = this_sigattrlog[1].utf8p1
local l_0_2 = string.match(l_0_1, "\\%l%l%l%l%l%l%l%l.exe")
if l_0_2 ~= nil then
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(l_0_0), 83782614)
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(l_0_1), 83782614)
  return mp.INFECTED
end
return mp.CLEAN
