-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\870d_luac 

-- params : ...
-- function num : 0
if (pe.isdynamic_va)(pevars.sigaddr) then
  (pe.set_regval)(pe.REG_EAX, 0)
  ;
  (mp.set_mpattribute)("PEBMPAT:Simda:AntiEmuTimeStampCheck")
end
return mp.CLEAN

