-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\617b_luac 

-- params : ...
-- function num : 0
if peattributes.no_security and (peattributes.isexe or peattributes.isdll) then
  return mp.INFECTED
end
return mp.CLEAN

