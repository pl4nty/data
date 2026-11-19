-- Threat: !InfrastructureShared
-- Name: !#TEL:LuaZipBombHeur.A
-- Type: 13

if mp.HEADERPAGE_SZ < 128 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
local l_0_0 = 10
local l_0_1 = 1
local l_0_2 = 1
while l_0_0 > l_0_2 and l_0_1 + 30 < mp.HEADERPAGE_SZ do
  if mp.readu_u32(headerpage, l_0_1) ~= 67324752 then
    return mp.CLEAN
  end
  local l_0_3 = mp.readu_u32(headerpage, l_0_1 + 18)
  local l_0_4 = mp.readu_u32(headerpage, l_0_1 + 22)
  local l_0_5 = mp.readu_u16(headerpage, l_0_1 + 26)
  local l_0_6 = mp.readu_u16(headerpage, l_0_1 + 28)
  if 0 < l_0_3 and l_0_3 < l_0_4 and 10485760 < l_0_4 then
    local l_0_7 = l_0_4 / l_0_3
    if 11000 < l_0_7 then
      return mp.INFECTED
    end
  end
  l_0_1 = l_0_1 + 30 + l_0_5 + l_0_3 + l_0_6
  l_0_2 = l_0_2 + 1
end
return mp.CLEAN
