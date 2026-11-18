-- Threat: !InfrastructureShared
-- Name: ffb33f42fb71
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, ".ps1", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
