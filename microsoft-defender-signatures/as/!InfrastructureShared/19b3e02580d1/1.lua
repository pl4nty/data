-- Threat: !InfrastructureShared
-- Name: 19b3e02580d1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "/admin$", 1, true) and string.find(l_0_0, "-c", 1, true) and string.find(l_0_0, "put ", 1, true) then
  local l_0_1 = "|.exe|.dll|.bat|.cmd|.vbs|.js|.jse|.vbe|.scr|.com|.cpl|.hta|.ps1|.psc1"
  local l_0_2 = string.match(l_0_0, "[^\\]+(%.%w+).*$")
  if l_0_2 and string.find(l_0_1, l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
