-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\941e_325.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 3 and (pesecs[2]).VirtualSize > 336 and (pesecs[2]).VirtualSize < 432 and (pesecs[3]).VirtualSize >= 13354 and (pesecs[3]).VirtualSize <= 13356 then
  return mp.INFECTED
end
return mp.CLEAN

