-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000507d_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() >= 133376 and (mp.getfilesize)() <= 135424 then
  return mp.INFECTED
end
return mp.CLEAN

