-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Sirefef!cfg
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & (LUA:FileSizeLE1000.A | LUA:FileSizeLE800.A)

if mp.getfilesize() ~= 2048 then
  return mp.CLEAN
end
local l_0_0 = headerpage[8]
if l_0_0 ~= 63 then
  return mp.CLEAN
end
local l_0_1 = headerpage[6]
local l_0_2 = headerpage[7]
if l_0_0 == l_0_2 and l_0_2 == l_0_1 then
  return mp.CLEAN
end
for l_0_3 = 9, 2040, 8 do
  if l_0_0 ~= headerpage[l_0_3 + 7] or l_0_2 ~= headerpage[l_0_3 + 6] then
    return mp.CLEAN
  end
  if l_0_3 < 32 then
    if l_0_1 ~= headerpage[l_0_3 + 5] then
      return mp.CLEAN
    end
  elseif l_0_1 - headerpage[l_0_3 + 5] < -1 or l_0_1 - headerpage[l_0_3 + 5] > 1 then
    return mp.CLEAN
  end
end
if mp.readu_u32(headerpage, 5) <= mp.readu_u32(headerpage, 2045) then
  return mp.CLEAN
end
for l_0_4 = 1, 2016, 8 do
  if mp.readu_u32(headerpage, l_0_4) == mp.readu_u32(headerpage, l_0_4 + 8) or mp.readu_u32(headerpage, l_0_4) == mp.readu_u32(headerpage, l_0_4 + 16) or mp.readu_u32(headerpage, l_0_4 + 8) == mp.readu_u32(headerpage, l_0_4 + 16) then
    return mp.CLEAN
  end
end
return mp.INFECTED
