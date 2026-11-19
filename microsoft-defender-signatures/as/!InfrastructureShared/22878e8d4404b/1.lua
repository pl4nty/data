-- Threat: !InfrastructureShared
-- Name: 22878e8d4404b
-- Type: 21

local l_0_0 = mp.HSTR_WEIGHT
local l_0_1 = 0
local l_0_2, l_0_3, l_0_4, l_0_5
local l_0_6 = 0
local l_0_7, l_0_8
local l_0_9 = 0
if hstrlog[5].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[5].match_offsets_count
  l_0_3 = hstrlog[5].match_offsets
  l_0_4 = hstrlog[5].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[6].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[6].match_offsets_count
  l_0_3 = hstrlog[6].match_offsets
  l_0_4 = hstrlog[6].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[7].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[7].match_offsets_count
  l_0_3 = hstrlog[7].match_offsets
  l_0_4 = hstrlog[7].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[8].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[8].match_offsets_count
  l_0_3 = hstrlog[8].match_offsets
  l_0_4 = hstrlog[8].VA
  l_0_6 = 2
  l_0_7 = 1
  l_0_8 = 2
end
if hstrlog[9].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[9].match_offsets_count
  l_0_3 = hstrlog[9].match_offsets
  l_0_4 = hstrlog[9].VA
  l_0_6 = 2
  l_0_7 = 1
  l_0_8 = 2
end
if hstrlog[10].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[10].match_offsets_count
  l_0_3 = hstrlog[10].match_offsets
  l_0_4 = hstrlog[10].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[11].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[11].match_offsets_count
  l_0_3 = hstrlog[11].match_offsets
  l_0_4 = hstrlog[11].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[12].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[12].match_offsets_count
  l_0_3 = hstrlog[12].match_offsets
  l_0_4 = hstrlog[12].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[13].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[13].match_offsets_count
  l_0_3 = hstrlog[13].match_offsets
  l_0_4 = hstrlog[13].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[14].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[14].match_offsets_count
  l_0_3 = hstrlog[14].match_offsets
  l_0_4 = hstrlog[14].VA
  l_0_6 = 1
  l_0_7 = 2
  l_0_8 = 3
end
if hstrlog[15].matched then
  l_0_1 = 3
  l_0_0 = l_0_0 - l_0_1
  l_0_2 = hstrlog[15].match_offsets_count
  l_0_3 = hstrlog[15].match_offsets
  l_0_4 = hstrlog[15].VA
  l_0_6 = 6
  l_0_7 = 1
  l_0_8 = 3
  l_0_9 = 2
end
if l_0_6 ~= 0 and 3 <= l_0_2 then
  local l_0_10 = pe.mmap_va(l_0_4, l_0_3[l_0_8] + 5)
  local l_0_11 = mp.readu_u32(l_0_10, l_0_3[l_0_7] + 1)
  local l_0_12 = mp.readu_u32(l_0_10, l_0_3[l_0_8] + 1)
  local l_0_13
  if l_0_9 ~= 0 then
    l_0_13 = mp.readu_u32(l_0_10, l_0_3[l_0_9] + 1)
  end
  if l_0_6 == 2 then
    l_0_5 = mp.bitand(l_0_11 + l_0_12, 65535)
  elseif l_0_6 == 1 then
    l_0_5 = mp.bitxor(l_0_11, l_0_12)
  elseif l_0_6 == 6 then
    l_0_5 = mp.bitand(mp.bitxor(l_0_12, l_0_13) + l_0_11, 65535)
  end
  if l_0_5 == 23117 then
    l_0_0 = l_0_0 + l_0_1
  end
end
if 10 <= l_0_0 then
  return mp.INFECTED
elseif 4 <= l_0_0 then
  mp.set_mpattribute("HSTR:Rogue:Win32/Trapwot_Lowfi")
end
return mp.CLEAN
