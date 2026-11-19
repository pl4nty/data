-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:VirTool:Win32/XoredPEword
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE

if 60 >= mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
if 0 == mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 <= mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
if 0 == headerpage[63] or 0 == headerpage[64] then
  return mp.CLEAN
end
if headerpage[63] == headerpage[64] then
  return mp.CLEAN
end
local l_0_1 = headerpage[63]
local l_0_2 = headerpage[64]
if 77 ~= mp.bitxor(headerpage[1], l_0_1) then
  return mp.CLEAN
end
if 90 ~= mp.bitxor(headerpage[2], l_0_2) then
  return mp.CLEAN
end
local l_0_3 = 1 + mp.bitxor(headerpage[61], l_0_1) + mp.bitxor(headerpage[62], l_0_2) * 256
if l_0_3 <= mp.HEADERPAGE_SZ - 4 then
  if 80 ~= mp.bitxor(headerpage[l_0_3], l_0_1) then
    return mp.CLEAN
  end
  if 69 ~= mp.bitxor(headerpage[l_0_3 + 1], l_0_2) then
    return mp.CLEAN
  end
  if l_0_1 ~= headerpage[l_0_3 + 2] then
    return mp.CLEAN
  end
  if l_0_2 ~= headerpage[l_0_3 + 3] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
