-- Threat: !InfrastructureShared
-- Name: 41b363e1b392
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  if string.sub(l_0_0, -11) == "desktop.ini" then
    return mp.CLEAN
  end
end
return mp.INFECTED
