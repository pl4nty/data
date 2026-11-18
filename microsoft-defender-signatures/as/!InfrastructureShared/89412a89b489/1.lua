-- Threat: !InfrastructureShared
-- Name: 89412a89b489
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].p1)
  local l_0_1 = string.len(l_0_0)
  local l_0_2 = string.lower(this_sigattrlog[3].p1)
  local l_0_3 = string.len(l_0_2)
  if string.find(l_0_2, l_0_0, l_0_3 - l_0_1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
