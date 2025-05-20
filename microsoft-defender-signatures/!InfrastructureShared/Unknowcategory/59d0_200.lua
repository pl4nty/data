-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\59d0_200.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:ALF:INTL:Trojan:Win32/Multiverze") then
  return mp.INFECTED
end
return mp.CLEAN

