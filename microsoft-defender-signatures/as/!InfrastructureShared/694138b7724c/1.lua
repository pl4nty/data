-- Threat: !InfrastructureShared
-- Name: 694138b7724c
-- Type: 21

if this_sigattrlog[4].matched then
  local l_0_0 = string.lower(this_sigattrlog[4].p1)
  local l_0_1 = string.lower(this_sigattrlog[4].p2)
  if l_0_0 and l_0_1 and string.find(l_0_0, "^%d%d%d+") and string.find(l_0_1, "^(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)$") then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
