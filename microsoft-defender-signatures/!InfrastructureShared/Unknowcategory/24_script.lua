-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\24_luac 

-- params : ...
-- function num : 0
if 1800000000 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
return mp.INFECTED

