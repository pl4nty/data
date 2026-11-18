-- Threat: !InfrastructureShared
-- Name: f7d757dd1063
-- Type: 21

local l_0_0 = mp.hstr_full_log()
if l_0_0 == nil then
  return mp.CLEAN
end
if not l_0_0[2].matched and not l_0_0[3].matched then
  return mp.CLEAN
end
if not l_0_0[4].matched and not l_0_0[5].matched and not l_0_0[6].matched then
  return mp.CLEAN
end
if not l_0_0[7].matched and not l_0_0[8].matched then
  return mp.CLEAN
end
return mp.INFECTED
