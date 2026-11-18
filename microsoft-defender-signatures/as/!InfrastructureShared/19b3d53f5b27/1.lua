-- Threat: !InfrastructureShared
-- Name: 19b3d53f5b27
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 == nil or l_0_0 == "" or sysio.IsFileExists(l_0_0) == false then
    return mp.CLEAN
  end
  if string.sub(l_0_0, 1, 3) == "COM" then
    return mp.CLEAN
  end
  if string.find(l_0_0, ".exe", -4, true) or string.find(l_0_0, ".dll", -4, true) or string.find(l_0_0, ".sys", -4, true) then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
