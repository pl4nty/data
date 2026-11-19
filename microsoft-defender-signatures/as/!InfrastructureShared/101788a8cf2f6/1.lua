-- Threat: !InfrastructureShared
-- Name: 101788a8cf2f6
-- Type: 21

if hstrlog[4].matched then
  mp.readprotection(false)
  local l_0_0 = pe.mmap_va(hstrlog[4].VA - 27, 80)
  local l_0_1 = mp.readu_u32(l_0_0, 2)
  local l_0_2 = pe.mmap_va(l_0_1, 16)
  for l_0_3 = 1, 16 do
    local l_0_4 = string.byte(l_0_2, l_0_3)
    if l_0_4 < 48 or 90 < l_0_4 or l_0_4 == 64 then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
