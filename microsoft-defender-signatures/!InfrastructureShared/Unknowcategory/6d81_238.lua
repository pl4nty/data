-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6d81_238.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("HSTR:Trojan:Win32/ChineseKeyboardCheck!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

