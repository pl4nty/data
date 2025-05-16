-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000011e9_luac 

-- params : ...
-- function num : 0
if 3 * 10000000 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
return mp.INFECTED

