-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fda_274.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and (pesecs[2]).Name == ".rodata" and (pesecs[2]).Characteristics == 1610612768 then
  return mp.INFECTED
end
return mp.CLEAN

