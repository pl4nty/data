-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\70aa_251.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN

