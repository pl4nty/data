-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6118_217.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 6 and (mp.getfilesize)() >= 5868504 then
  return mp.INFECTED
end
return mp.CLEAN

