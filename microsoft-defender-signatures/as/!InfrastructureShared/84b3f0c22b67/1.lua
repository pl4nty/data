-- Threat: !InfrastructureShared
-- Name: 84b3f0c22b67
-- Type: 21

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched and not this_sigattrlog[3].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1]
local l_0_1 = this_sigattrlog[2].matched and this_sigattrlog[2] or this_sigattrlog[3]
local l_0_2, l_0_3 = bm.get_process_relationships(l_0_0.ppid)
if 1 <= #l_0_3 and l_0_3[1].ppid == l_0_1.ppid then
  return mp.INFECTED
end
return mp.CLEAN
