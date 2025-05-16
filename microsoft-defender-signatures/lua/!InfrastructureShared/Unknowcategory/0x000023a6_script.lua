-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000023a6_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 31457280 then
  return mp.INFECTED
end
return mp.CLEAN

