-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__VenomA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1 = 500
local l_0_2 = 7
local l_0_3 = 62
local l_0_4 = 3
local l_0_5 = 1
local l_0_6 = 1
local l_0_7 = elfhdr.ident
local l_0_8 = (string.byte)(l_0_7, 6)
if l_0_8 ~= l_0_6 or elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 then
  return mp.CLEAN
end
if l_0_1 < l_0_0 then
  return mp.CLEAN
end
if elfhdr.phnum ~= 1 then
  return mp.CLEAN
end
local l_0_9 = ephdrs[1]
if l_0_9.type ~= l_0_5 or l_0_9.offset ~= 0 or l_0_9.flags ~= l_0_2 or l_0_9.align ~= 4096 then
  return mp.CLEAN
end
return mp.INFECTED

