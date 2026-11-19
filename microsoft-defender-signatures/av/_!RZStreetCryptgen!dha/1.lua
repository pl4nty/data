-- Threat: \xac!RZStreetCrypt.gen!dha
-- Type: 13
-- MpAttributes: (BM_UNKNOWN_FILE | BM_TEXT_FILE)

if mp.HEADERPAGE_SZ < 4096 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 1)
local l_0_1 = mp.readu_u32(headerpage, 5)
if l_0_0 == 0 or l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = tostring(headerpage):find("\000", 1, true)
if l_0_2 == nil or l_0_2 < 9 or 256 < l_0_2 then
  return mp.CLEAN
end
if mp.bitxor(l_0_0, mp.readu_u32(headerpage, l_0_2 + 1)) ~= 15227469 then
  return mp.CLEAN
end
if mp.bitxor(l_0_1, mp.readu_u32(headerpage, l_0_2 + 5)) ~= 1526726656 then
  return mp.CLEAN
end
return mp.INFECTED
