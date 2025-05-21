-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6a96_229.luac 

-- params : ...
-- function num : 0
if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

