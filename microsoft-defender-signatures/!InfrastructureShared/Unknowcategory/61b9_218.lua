-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\61b9_218.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 6 then
  (mp.set_mpattribute)("PUA:Block:SkypeCap.B")
  return mp.INFECTED
end
return mp.LOWFI

