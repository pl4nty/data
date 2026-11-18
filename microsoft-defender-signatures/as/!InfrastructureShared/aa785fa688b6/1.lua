-- Threat: !InfrastructureShared
-- Name: aa785fa688b6
-- Type: 21

if hstrlog[2].VA < hstrlog[1].VA and hstrlog[1].VA - hstrlog[2].VA < 1024 then
  local l_0_0 = 11
  local l_0_1 = 10
  local l_0_2 = mp.readu_u32(pe.mmap_va(hstrlog[2].VA + 4, 4), 1)
  local l_0_3 = pe.mmap_va(l_0_2, l_0_0 * 2 + 1)
  l_0_3 = mp.utf16to8(l_0_3)
  local l_0_4 = mp.readu_u32(pe.mmap_va(hstrlog[3].VA + 13, 4), 1)
  local l_0_5 = pe.mmap_va(l_0_4, l_0_1 * 4 + 2 + 2)
  local l_0_6 = mp.utf16to8(l_0_5)
  local l_0_7 = ""
  for l_0_8 = 3, l_0_1 * 2 + 2, 2 do
    local l_0_9 = tonumber(string.sub(l_0_6, l_0_8 - 2, l_0_8 - 1), 16)
    local l_0_10 = tonumber(string.sub(l_0_6, l_0_8, l_0_8 + 1), 16)
    local l_0_11 = string.byte(l_0_3, (l_0_8 - 1) / 2)
    local l_0_12 = mp.bitxor(l_0_10, l_0_11)
    if l_0_12 - l_0_9 < 0 then
      l_0_7 = l_0_7 .. string.char(l_0_12 - l_0_9 + 255)
    else
      l_0_7 = l_0_7 .. string.char(l_0_12 - l_0_9)
    end
  end
  if l_0_7 == "cmd /c tas" then
    return mp.INFECTED
  end
end
return mp.CLEAN
