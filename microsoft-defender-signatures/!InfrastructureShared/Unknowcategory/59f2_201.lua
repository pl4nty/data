-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\59f2_201.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 6 and (mp.getfilesize)() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN

