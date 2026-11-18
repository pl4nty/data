-- Threat: !InfrastructureShared
-- Name: f5b39eb837bd
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
  if string.find(this_sigattrlog[1].utf8p2, l_0_0, 1, false) then
    return mp.CLEAN
  end
end
return mp.INFECTED
