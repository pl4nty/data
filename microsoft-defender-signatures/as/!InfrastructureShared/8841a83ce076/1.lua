-- Threat: !InfrastructureShared
-- Name: 8841a83ce076
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].p1)
  local l_0_1 = string.lower(this_sigattrlog[3].p1)
  if string.find(l_0_1, l_0_0 .. ".exe", nil, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
