-- Threat: !InfrastructureShared
-- Name: 61785fe46de6
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 3 and hstrlog[4].matched then
  local l_0_0 = hstrlog[4].VA + 18
  local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
  local l_0_2 = pe.mmap_va(l_0_1, 6)
  if string.sub(l_0_2, 1, 5) == "MyApp" then
    return mp.INFECTED
  end
end
return mp.CLEAN
