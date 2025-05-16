-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000083a8_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Trojan:Win64/Lazy.MBXI!MTB") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

