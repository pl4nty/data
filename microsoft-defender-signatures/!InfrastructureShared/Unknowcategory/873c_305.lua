-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\873c_305.luac 

-- params : ...
-- function num : 0
if (peattributes.isvbpcode or peattributes.isvbnative) and (mp.getfilesize)() < 65536 then
  if mp.HSTR_WEIGHT >= 12 then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN

