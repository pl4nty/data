-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8682_300.luac 

-- params : ...
-- function num : 0
if (pesecs[pehdr.NumberOfSections]).NameDW == 1163217994 and peattributes.epscn_islast == true then
  return mp.INFECTED
end
;
(mp.changedetectionname)(805306404)
return mp.INFECTED

