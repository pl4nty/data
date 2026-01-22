-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxOneOrMoreSectionOverflow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = 1
local l_0_3 = 3
local l_0_4 = 62
local l_0_5 = 40
local l_0_6 = 183
local l_0_7 = elfhdr.ident
local l_0_8 = (string.byte)(l_0_7, 6)
if l_0_8 ~= l_0_2 or elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 and elfhdr.machine ~= l_0_5 and elfhdr.machine ~= l_0_6 then
  return mp.CLEAN
end
local l_0_9 = (mp.getfilesize)()
for l_0_13 = 1, elfhdr.shnum do
  local l_0_14 = esec[l_0_13]
  if l_0_14.type ~= l_0_0 and l_0_14.type ~= l_0_1 and (l_0_14.offset < 0 or l_0_14.size < 0 or l_0_9 < l_0_14.offset or l_0_9 < l_0_14.size or l_0_9 < l_0_14.offset + l_0_14.size) then
    return mp.INFECTED
  end
end
return mp.CLEAN

