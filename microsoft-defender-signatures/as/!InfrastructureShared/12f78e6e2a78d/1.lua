-- Threat: !InfrastructureShared
-- Name: 12f78e6e2a78d
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[8].matched then
  local l_0_1 = hstrlog[8].VA + 4
  local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
  local l_0_3 = pe.mmap_va(l_0_2, 11)
  if l_0_3 == "~backup.dat" then
    return mp.INFECTED
  end
  l_0_0 = 3
end
if mp.HSTR_WEIGHT - l_0_0 >= 6 then
  return mp.INFECTED
elseif 4 <= mp.HSTR_WEIGHT - l_0_0 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
