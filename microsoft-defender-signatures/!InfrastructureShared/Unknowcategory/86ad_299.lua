-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\86ad_299.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 6 and (mp.getfilesize)() >= 210000 and (mp.getfilesize)() <= 213000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

