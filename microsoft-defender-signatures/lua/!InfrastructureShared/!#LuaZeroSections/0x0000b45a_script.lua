-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaZeroSections\0x0000b45a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 5242880 then
  return mp.CLEAN
end
for l_0_4 = 1, elfhdr.shnum do
  local l_0_5 = esec[l_0_4]
  if l_0_5.offset ~= 0 or l_0_5.size ~= 0 then
    return mp.CLEAN
  end
end
return mp.INFECTED

