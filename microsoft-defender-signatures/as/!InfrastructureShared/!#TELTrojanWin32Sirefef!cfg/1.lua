-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Sirefef!cfg
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & (LUA:FileSizeLE1000.A | LUA:FileSizeLE800.A)

if mp.getfilesize() ~= 2048 then
  return mp.CLEAN
end
if headerpage[8] ~= 63 then
  return mp.CLEAN
end
local l_0_0 = {}
for l_0_1 = 1, 2040, 8 do
  local l_0_2 = mp.readu_u32(headerpage, l_0_1)
  local l_0_3 = mp.readu_u32(headerpage, l_0_1 + 4)
  if l_0_2 == 0 or mp.bitand(l_0_2, 4278190080) == 4278190080 or mp.bitand(l_0_2, 16711680) == 16711680 or mp.bitand(l_0_2, 65280) == 65280 or mp.bitand(l_0_2, 255) == 255 or 4278059008 <= l_0_2 then
    return mp.CLEAN
  end
  if l_0_3 <= 1056964608 or 1072562176 <= l_0_3 then
    return mp.CLEAN
  end
  table.insert(l_0_0, l_0_2)
end
table.sort(l_0_0)
local l_0_4 = 0
for l_0_5, l_0_6 in ipairs(l_0_0) do
  if l_0_6 == l_0_4 then
    return mp.CLEAN
  end
  l_0_4 = l_0_6
end
return mp.INFECTED
