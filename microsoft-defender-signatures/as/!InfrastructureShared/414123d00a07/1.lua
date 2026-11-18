-- Threat: !InfrastructureShared
-- Name: 414123d00a07
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].p1)
  if string.find(l_0_0, "^%d%d%d%d+$") then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
