-- Threat: !InfrastructureShared
-- Name: 7778e0ff00e1
-- Type: 21
-- Flags: 1

if hstrlog[2].matched then
  local l_0_0 = hstrlog[2].VA + 11
  local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
  local l_0_2 = pe.mmap_va(l_0_1, 10)
  if string.sub(l_0_2, 1, 7) == "Alina v" and string.sub(l_0_2, 9, 9) == "." then
    return mp.INFECTED
  end
end
return mp.CLEAN
