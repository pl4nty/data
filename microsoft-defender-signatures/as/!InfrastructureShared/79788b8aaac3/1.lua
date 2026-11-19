-- Threat: !InfrastructureShared
-- Name: 79788b8aaac3
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0
local l_0_1 = 0
mp.readprotection(false)
if hstrlog[1].matched then
  l_0_0 = pe.mmap_va(hstrlog[1].VA, 80)
  l_0_1 = string.find(l_0_0, "\185....\190.....-\243\165")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = mp.readu_u32(l_0_0, l_0_1 + 6)
elseif hstrlog[2].matched then
  l_0_1 = hstrlog[2].VA
  local l_0_2 = pe.foffset_va(l_0_1)
  l_0_0 = mp.readfile(l_0_2, 80)
  l_0_1 = string.find(l_0_0, "\137E.h....h....\139E")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = mp.readu_u32(l_0_0, l_0_1 + 9)
end
if l_0_1 == pehdr.AddressOfEntryPoint + pehdr.ImageBase then
  return mp.CLEAN
end
local l_0_3 = mp.readfile(0, mp.getfilesize())
local l_0_4 = mp.readu_u32(l_0_3, 61)
mp.writeu_u32(l_0_3, l_0_4 + 40 + 1, l_0_1 - pehdr.ImageBase)
mp.vfo_add_buffer(l_0_3, "[VmAllocCall]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
