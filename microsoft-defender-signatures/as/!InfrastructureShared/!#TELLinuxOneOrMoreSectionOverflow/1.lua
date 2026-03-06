-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxOneOrMoreSectionOverflow\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 8
local l_0_1 = 0
local l_0_2 = (mp.getfilesize)()
for l_0_6 = 1, elfhdr.shnum do
  local l_0_7 = esec[l_0_6]
  if l_0_7.type ~= l_0_0 and l_0_7.type ~= l_0_1 and (l_0_7.offset < 0 or l_0_7.size < 0 or l_0_2 < l_0_7.offset or l_0_2 < l_0_7.size or l_0_2 < l_0_7.offset + l_0_7.size) then
    return mp.INFECTED
  end
end
return mp.CLEAN

