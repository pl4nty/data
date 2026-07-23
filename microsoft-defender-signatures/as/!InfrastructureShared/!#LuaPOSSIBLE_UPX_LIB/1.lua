-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPOSSIBLE_UPX_LIB\1.luac 

-- params : ...
-- function num : 0
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
local l_0_10 = (string.byte)(elfhdr.ident, 6)
if l_0_10 ~= l_0_9 then
  return mp.CLEAN
end
if elfhdr.machine ~= l_0_5 and elfhdr.machine ~= l_0_6 and elfhdr.machine ~= l_0_7 and elfhdr.machine ~= l_0_8 then
  return mp.CLEAN
end
if elfhdr.phnum < 3 then
  return mp.CLEAN
end
local l_0_11 = elfhdr.phoff + elfhdr.phnum * elfhdr.phentsize
local l_0_12 = false
local l_0_13 = false
local l_0_14 = false
local l_0_15 = false
for l_0_19 = 1, elfhdr.phnum do
  local l_0_20 = ephdrs[l_0_19]
  if l_0_20.type == l_0_1 and l_0_20.offset == 0 then
    l_0_12 = true
  else
    if l_0_20.type == l_0_2 then
      l_0_13 = true
    else
      if l_0_20.type == l_0_3 then
        l_0_15 = true
      else
        if l_0_20.type == l_0_0 and l_0_20.filesz > 0 and l_0_20.memsz > 0 and l_0_11 <= l_0_20.offset and l_0_20.offset % l_0_4 == 0 then
          l_0_14 = true
        end
      end
    end
  end
end
if l_0_15 then
  return mp.CLEAN
end
if l_0_12 and l_0_13 and l_0_14 then
  return mp.INFECTED
end
return mp.CLEAN

