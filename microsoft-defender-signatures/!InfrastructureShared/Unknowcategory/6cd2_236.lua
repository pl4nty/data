-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6cd2_236.luac 

-- params : ...
-- function num : 0
if peattributes.dt_error_not_enough_memory then
  (mp.set_mpattribute)("do_vmmgrow_rescan")
  return mp.LOWFI
end
return mp.CLEAN

