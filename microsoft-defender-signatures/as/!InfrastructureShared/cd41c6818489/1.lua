-- Threat: !InfrastructureShared
-- Name: cd41c6818489
-- Type: 21

local l_0_0 = {}
l_0_0["cttunesvr.exe"] = true
l_0_0["inetmgr.exe"] = true
l_0_0["migsetup.exe"] = true
l_0_0["mmc.exe"] = true
l_0_0["oobe.exe"] = true
l_0_0["pkgmgr.exe"] = true
l_0_0["provisionshare.exe"] = true
l_0_0["provisionstorage.exe"] = true
l_0_0["spinstall.exe"] = true
l_0_0["winsat.exe"] = true
if this_sigattrlog[4].matched then
  local l_0_1 = string.match(this_sigattrlog[4].p2:lower(), "\\(%w+%.%w+)$")
  if l_0_0[l_0_1] then
    return mp.INFECTED
  end
end
if this_sigattrlog[1].matched then
  local l_0_2 = string.match(this_sigattrlog[1].p1:lower(), "\\(%w+%.%w+)$")
  local l_0_3 = string.match(this_sigattrlog[1].p2:lower(), "\\(%w+%.%w+)$")
  if l_0_0[l_0_2] or l_0_0[l_0_3] then
    return mp.INFECTED
  end
end
if this_sigattrlog[2].matched then
  local l_0_4 = string.match(this_sigattrlog[2].p1:lower(), "\\(%w+%.%w+)$")
  if l_0_0[l_0_4] then
    return mp.INFECTED
  end
end
if this_sigattrlog[3].matched then
  local l_0_5 = string.match(this_sigattrlog[3].p2:lower(), "\\(%w+%.%w+)$")
  if l_0_0[l_0_5] then
    return mp.INFECTED
  end
end
return mp.LOWFI
