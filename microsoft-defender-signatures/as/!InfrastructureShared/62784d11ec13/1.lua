-- Threat: !InfrastructureShared
-- Name: 62784d11ec13
-- Type: 21

if peattributes.isdll and hstrlog[3].matched then
  local l_0_0 = hstrlog[3].VA + 6
  local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0 + 1, 4), 1)
  local l_0_2 = pe.mmap_va(l_0_1, 95)
  if string.sub(l_0_2, 1, 95) == "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CLSID\\{871C5380-42A0-1069-A2EA-08002B30309D}" then
    return mp.INFECTED
  end
end
return mp.LOWFI
