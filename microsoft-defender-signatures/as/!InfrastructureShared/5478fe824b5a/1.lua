-- Threat: !InfrastructureShared
-- Name: 5478fe824b5a
-- Type: 21
-- Flags: 1

local l_0_0 = mp.readu_u32(pe.mmap_va(hstrlog[1].VA + 11, 4), 1)
local l_0_1 = pe.mmap_va(l_0_0, 12)
if string.find(l_0_1, "%w%z%w%z%w%z%w%z%w%z%z%z") >= 0 then
  l_0_0 = mp.readu_u32(pe.mmap_va(hstrlog[3].VA + 15, 4), 1)
  local l_0_2 = pe.mmap_va(l_0_0, 12)
  if string.find(l_0_2, "%w%z%w%z%w%z%w%z%w%z%z%z") >= 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
