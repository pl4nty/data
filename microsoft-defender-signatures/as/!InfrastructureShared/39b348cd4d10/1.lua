-- Threat: !InfrastructureShared
-- Name: 39b348cd4d10
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].ppid
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4.ppid == l_0_0 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
