-- Threat: !InfrastructureShared
-- Name: c5b3008c78b3
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.len(l_0_0) < 4096 then
    return mp.CLEAN
  end
  if string.find(l_0_0, "%.ps1") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
