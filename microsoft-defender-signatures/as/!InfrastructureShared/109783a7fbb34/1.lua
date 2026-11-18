-- Threat: !InfrastructureShared
-- Name: 109783a7fbb34
-- Type: 21
-- Flags: 1

if hstrlog[3].matched then
  local l_0_0 = hstrlog[3].VA + 15
  local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
  local l_0_2 = pe.mmap_va(l_0_1, 10)
  if string.sub(l_0_2, 1, 7) == "Alina v" and string.sub(l_0_2, 9, 9) == "." then
    return mp.INFECTED
  end
end
return mp.LOWFI
