-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\808b_282.luac 

-- params : ...
-- function num : 0
if (hstrlog[9]).hitcount >= 7 and pehdr.NumberOfSections == 3 and (mp.getfilesize)() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN

