-- Threat: !InfrastructureShared
-- Name: 2db3db349f07
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(string.sub(this_sigattrlog[1].wp1, -4))
  if l_0_0 == ".ttf" or l_0_0 == ".fon" then
    return mp.INFECTED
  end
end
return mp.CLEAN
