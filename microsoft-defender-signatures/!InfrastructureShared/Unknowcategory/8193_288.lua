-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8193_288.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("LUA:FileSizeLE1M.A") and pehdr.NumberOfSections == 3 and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN

