-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7f23_271.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 and (mp.getfilesize)() >= 9472 and (mp.getfilesize)() <= 20480 then
  return mp.INFECTED
end
return mp.CLEAN

