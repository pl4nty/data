-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a0f9_425.luac 

-- params : ...
-- function num : 0
if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if elfhdr.phnum ~= 3 or elfhdr.shnum ~= 0 then
  return mp.CLEAN
end
local l_0_0 = 1
local l_0_1 = 62
local l_0_2 = 3
local l_0_3 = elfhdr.ident
if (string.byte)(l_0_3, 6) ~= l_0_0 or elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED

