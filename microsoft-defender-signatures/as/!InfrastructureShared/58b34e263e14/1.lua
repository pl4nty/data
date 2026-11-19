-- Threat: !InfrastructureShared
-- Name: 58b34e263e14
-- Type: 21

local l_0_0
local l_0_1 = string.lower(bm.get_imagepath())
if l_0_1:find("svchost.exe") then
  l_0_0 = string.match(this_sigattrlog[2].utf8p1, "\\%l%l%l%l%l%l%l%l%.exe")
  if l_0_0 ~= nil then
    mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1), 2107638873)
    return mp.INFECTED
  end
end
return mp.CLEAN
