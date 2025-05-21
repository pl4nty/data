-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6379_219.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 4 then
  (mp.set_mpattribute)("PUA:Block:Coinminer.E")
  return mp.INFECTED
end
return mp.LOWFI

