-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\87e8_313.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Trojan:Win64/Lotok.RW!MTB") and (mp.getfilesize)() < 250000 and (mp.getfilesize)() > 220000 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

