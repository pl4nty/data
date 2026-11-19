-- Threat: !InfrastructureShared
-- Name: 9db3fd4c30fa
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
