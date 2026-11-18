-- Threat: !InfrastructureShared
-- Name: !#Lua:ELFOverlayPayload
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ELF_FILE & elfa_hasoverlay & !elfa_hasnosectionsheader

local l_0_0 = mp.getfilesize()
if l_0_0 < 256 or 15728640 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = headerpage[5] == 2
local l_0_4 = headerpage[6] == 2
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
if l_0_2 then
  l_0_5 = mp.readu_u64(headerpage, 41)
  l_0_6 = mp.readu_u16(headerpage, 59)
  l_0_7 = mp.readu_u16(headerpage, 61)
else
  l_0_5 = mp.readu_u32(headerpage, 33)
  l_0_6 = mp.readu_u16(headerpage, 47)
  l_0_7 = mp.readu_u16(headerpage, 49)
end
if l_0_4 then
  if l_0_2 then
    l_0_5 = mp.bswap64(l_0_5)
  else
    l_0_5 = mp.bswap32(l_0_5)
  end
  l_0_6 = mp.bswap16(l_0_6)
  l_0_7 = mp.bswap16(l_0_7)
end
local l_0_8 = l_0_5 + l_0_6 * l_0_7
if l_0_0 < l_0_8 + 128 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_9 = mp.readfile(l_0_8, l_0_0 - l_0_8)
mp.readprotection(true)
local l_0_10 = false
local l_0_11 = 0
local l_0_12 = {
  {"\127ELF", "ELF"},
  {"PK\003\004", "ZIP1"},
  {"PK\a\b", "ZIP2"},
  {"7z\188\175", "7Z"},
  {"\031\139", "GZIP"},
  {"BZh", "BZIP"}
}
for l_0_13, l_0_14 in ipairs(l_0_12) do
  l_0_11 = l_0_9:find(l_0_14[1], 1, 4096)
  if l_0_11 and 1 <= l_0_11 then
    mp.vfo_add_buffer(l_0_9:sub(l_0_11), "[ELFOverlay_" .. l_0_14[2] .. "]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    l_0_10 = true
  end
end
if l_0_10 then
  return mp.INFECTED
end
return mp.CLEAN
