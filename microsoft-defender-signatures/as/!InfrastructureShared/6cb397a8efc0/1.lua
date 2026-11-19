-- Threat: !InfrastructureShared
-- Name: 6cb397a8efc0
-- Type: 21

local l_0_0, l_0_1
l_0_0 = this_sigattrlog[2].ppid
if this_sigattrlog[3].matched then
  local l_0_2, l_0_3 = bm.get_process_relationships(this_sigattrlog[3].ppid)
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    l_0_1 = l_0_5.ppid
    break
  end
  if l_0_0 == l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
