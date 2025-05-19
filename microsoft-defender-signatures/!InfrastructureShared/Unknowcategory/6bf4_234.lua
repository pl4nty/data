-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6bf4_234.luac 

-- params : ...
-- function num : 0
if peattributes.isdamaged == true and (mp.get_mpattribute)("SLF:Win64/CobPipe.A") then
  return mp.INFECTED
end
return mp.CLEAN

