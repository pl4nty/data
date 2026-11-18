-- Threat: !InfrastructureShared
-- Name: 2db3ea96c619
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -10))
local l_0_1
if l_0_0 == "\\lsass.exe" then
  if this_sigattrlog[1].matched then
    l_0_1 = this_sigattrlog[1].utf8p1
  elseif this_sigattrlog[2].matched then
    l_0_1 = this_sigattrlog[2].utf8p1
  end
  if l_0_1 ~= nil then
    bm.add_threat_file(l_0_1)
  end
  return mp.INFECTED
end
return mp.CLEAN
