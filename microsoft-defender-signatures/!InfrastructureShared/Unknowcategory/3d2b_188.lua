-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3d2b_188.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() == 88064 or (mp.getfilesize)() == 90624 then
  return mp.INFECTED
end
return mp.CLEAN

