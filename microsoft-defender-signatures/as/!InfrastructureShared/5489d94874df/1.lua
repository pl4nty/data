-- Threat: !InfrastructureShared
-- Name: 5489d94874df
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.mmap_va(pe.get_regval(pe.REG_ESP), 16)
local l_0_2 = mp.readu_u32(l_0_1, 1)
if l_0_2 <= 0 or 4194304 < l_0_2 or not pe.isdynamic_va(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(l_0_1, 5)
if l_0_3 <= 0 or l_0_0 <= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = pe.mmap_va(l_0_2, l_0_3)
mp.vfo_add_buffer(l_0_4, "[EvrStkExeScpt]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
