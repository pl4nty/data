-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaARM_LE\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 40
local l_0_1 = 183
local l_0_2 = 1
local l_0_3 = elfhdr.ident
if (string.byte)(l_0_3, 6) ~= l_0_2 or elfhdr.machine ~= l_0_0 and elfhdr.machine ~= l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED

