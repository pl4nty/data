-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000091be_luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT == 1 then
  (mp.set_mpattribute)("HSTR:Win32.Fauppod.S100")
  return mp.LOWFI
end
return mp.CLEAN

