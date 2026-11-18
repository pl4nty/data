-- Threat: !InfrastructureShared
-- Name: 19b331281d52
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = string.lower(l_0_0):match("([^\\]+%.exe)$")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:find("service.exe")
if l_0_2 then
  l_0_1 = l_0_1:sub(1, l_0_2 - 1)
else
  l_0_1 = l_0_1:sub(1, -5)
end
local l_0_3 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\" .. l_0_1
if sysio.RegOpenKey(l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
