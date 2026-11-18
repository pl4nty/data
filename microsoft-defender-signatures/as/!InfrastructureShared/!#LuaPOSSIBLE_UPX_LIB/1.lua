-- Threat: !InfrastructureShared
-- Name: !#Lua:POSSIBLE_UPX_LIB
-- Type: 35
-- MpAttributes: BM_ELF_DYN_FILE & RPF:TopLevelFile

local l_0_0 = 0
local l_0_1 = 1
local l_0_2 = 2
local l_0_3 = 3
local l_0_4 = 4096
local l_0_5 = 3
local l_0_6 = 62
local l_0_7 = 40
local l_0_8 = 183
local l_0_9 = 1
local l_0_10 = string.byte(elfhdr.ident, 6)
if l_0_10 ~= l_0_9 then
  return mp.CLEAN
end
if elfhdr.machine ~= l_0_5 and elfhdr.machine ~= l_0_6 and elfhdr.machine ~= l_0_7 and elfhdr.machine ~= l_0_8 then
  return mp.CLEAN
end
if 3 > elfhdr.phnum then
  return mp.CLEAN
end
if 0 > elfhdr.phoff or 0 > elfhdr.phnum or 0 >= elfhdr.phentsize or elfhdr.phoff > mp.HEADERPAGE_SZ or elfhdr.phnum > (mp.HEADERPAGE_SZ - elfhdr.phoff) / elfhdr.phentsize then
  return mp.CLEAN
end
local l_0_11 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize
local l_0_12 = false
local l_0_13 = false
local l_0_14 = false
local l_0_15 = false
for l_0_16 = 1, elfhdr.phnum do
  local l_0_17 = ephdrs[l_0_16]
  if l_0_17.type == l_0_1 and l_0_17.offset == 0 then
    l_0_12 = true
  elseif l_0_17.type == l_0_2 then
    l_0_13 = true
  elseif l_0_17.type == l_0_3 then
    l_0_15 = true
  elseif l_0_17.type == l_0_0 and 0 < l_0_17.filesz and 0 < l_0_17.memsz and l_0_11 <= l_0_17.offset and l_0_17.offset % l_0_4 == 0 then
    l_0_14 = true
  end
end
if l_0_15 then
  return mp.CLEAN
end
if l_0_12 and l_0_13 and l_0_14 then
  return mp.INFECTED
end
return mp.CLEAN
