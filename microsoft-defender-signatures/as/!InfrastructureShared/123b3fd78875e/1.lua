-- Threat: !InfrastructureShared
-- Name: 123b3fd78875e
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].reg_block_usermode then
  if this_sigattrlog[2].reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION then
    return mp.CLEAN
  end
elseif this_sigattrlog[3].matched and this_sigattrlog[3].reg_block_usermode then
  if this_sigattrlog[3].reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and mp.bitand(l_0_3.reason_ex, 1) == 1 then
      bm.add_related_process(l_0_3.ppid)
    end
  end
end
return mp.INFECTED
