-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\598d_198.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("CERT:Trojan:Win32/Mansabo.RPX1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

