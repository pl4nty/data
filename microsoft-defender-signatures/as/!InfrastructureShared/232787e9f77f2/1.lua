-- Threat: !InfrastructureShared
-- Name: 232787e9f77f2
-- Type: 21

local l_0_0 = mp.HSTR_WEIGHT
local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = 1
local l_0_10 = 1
if hstrlog[5].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[5].match_offsets_count
  l_0_4 = hstrlog[5].match_offsets
  l_0_1 = hstrlog[5].VA
  l_0_7 = 2
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[6].match_offsets_count
  l_0_4 = hstrlog[6].match_offsets
  l_0_1 = hstrlog[6].VA
  l_0_7 = 1
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[7].match_offsets_count
  l_0_4 = hstrlog[7].match_offsets
  l_0_1 = hstrlog[7].VA
  l_0_7 = 2
end
if hstrlog[8].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[8].match_offsets_count
  l_0_4 = hstrlog[8].match_offsets
  l_0_1 = hstrlog[8].VA
  l_0_7 = 1
end
if hstrlog[9].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[9].match_offsets_count
  l_0_4 = hstrlog[9].match_offsets
  l_0_1 = hstrlog[9].VA
  l_0_7 = 3
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[10].match_offsets_count
  l_0_4 = hstrlog[10].match_offsets
  l_0_1 = hstrlog[10].VA
  l_0_7 = 4
  l_0_9 = 2
end
if hstrlog[11].matched then
  l_0_0 = l_0_0 - 1
  l_0_3 = hstrlog[11].match_offsets_count
  l_0_4 = hstrlog[11].match_offsets
  l_0_1 = hstrlog[11].VA
  l_0_7 = 5
  l_0_9 = 2
end
if hstrlog[12].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[12].match_offsets_count
  l_0_6 = hstrlog[12].match_offsets
  l_0_2 = hstrlog[12].VA
  l_0_8 = 2
end
if hstrlog[13].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[13].match_offsets_count
  l_0_6 = hstrlog[13].match_offsets
  l_0_2 = hstrlog[13].VA
  l_0_8 = 1
end
if hstrlog[14].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[14].match_offsets_count
  l_0_6 = hstrlog[14].match_offsets
  l_0_2 = hstrlog[14].VA
  l_0_8 = 3
end
if hstrlog[15].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[15].match_offsets_count
  l_0_6 = hstrlog[15].match_offsets
  l_0_2 = hstrlog[15].VA
  l_0_8 = 2
end
if hstrlog[16].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[16].match_offsets_count
  l_0_6 = hstrlog[16].match_offsets
  l_0_2 = hstrlog[16].VA
  l_0_8 = 2
end
if hstrlog[17].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[17].match_offsets_count
  l_0_6 = hstrlog[17].match_offsets
  l_0_2 = hstrlog[17].VA
  l_0_8 = 4
  l_0_10 = 2
end
if hstrlog[18].matched then
  l_0_0 = l_0_0 - 2
  l_0_5 = hstrlog[18].match_offsets_count
  l_0_6 = hstrlog[18].match_offsets
  l_0_2 = hstrlog[18].VA
  l_0_8 = 5
  l_0_10 = 2
end
if l_0_7 ~= 0 and l_0_8 ~= 0 and l_0_3 >= l_0_9 + 1 and l_0_5 >= l_0_10 + 1 then
  local l_0_11 = 0
  local l_0_12 = 0
  local l_0_13 = pe.mmap_va(l_0_1, l_0_4[l_0_9 + 1] + 1)
  local l_0_14 = string.byte(l_0_13, l_0_4[1] + 1)
  local l_0_15
  if 1 < l_0_9 then
    l_0_15 = string.byte(l_0_13, l_0_4[2] + 1)
  end
  local l_0_16 = string.byte(l_0_13, l_0_4[l_0_9 + 1] + 1)
  if l_0_7 == 2 then
    l_0_11 = mp.bitand(l_0_14 + l_0_16, 255)
  elseif l_0_7 == 1 then
    l_0_11 = mp.bitxor(l_0_14, l_0_16)
  elseif l_0_7 == 3 then
    l_0_11 = l_0_16 - l_0_14
  elseif l_0_7 == 4 then
    l_0_11 = mp.bitxor(mp.bitand(l_0_16 + l_0_15, 255), l_0_14)
  elseif l_0_7 == 5 then
    l_0_11 = mp.bitxor(l_0_16 - l_0_15, l_0_14)
  end
  local l_0_17 = pe.mmap_va(l_0_2, l_0_6[l_0_10 + 1] + 1)
  local l_0_18 = string.byte(l_0_17, l_0_6[1] + 1)
  local l_0_19
  if 1 < l_0_10 then
    l_0_19 = string.byte(l_0_17, l_0_6[2] + 1)
  end
  local l_0_20 = string.byte(l_0_17, l_0_6[l_0_10 + 1] + 1)
  if l_0_8 == 2 then
    l_0_12 = mp.bitand(l_0_18 + l_0_20, 255)
  elseif l_0_8 == 1 then
    l_0_12 = mp.bitxor(l_0_18, l_0_20)
  elseif l_0_8 == 3 then
    l_0_12 = l_0_20 - l_0_18
  elseif l_0_8 == 4 then
    l_0_12 = mp.bitxor(mp.bitand(l_0_20 + l_0_19, 255), l_0_18)
  elseif l_0_8 == 5 then
    l_0_12 = mp.bitxor(l_0_20 - l_0_19, l_0_18)
  end
  if l_0_11 == 77 and l_0_12 == 90 then
    l_0_0 = l_0_0 + 3
  end
end
if 10 <= l_0_0 then
  return mp.INFECTED
elseif 4 <= l_0_0 then
  mp.set_mpattribute("HSTR:Rogue:Win32/Trapwot_Lowfi")
end
return mp.CLEAN
