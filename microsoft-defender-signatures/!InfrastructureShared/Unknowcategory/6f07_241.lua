-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f07_241.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and (mp.get_mpattribute)("NID:Trojan:Win32/GhostSocks.G5") then
  return mp.INFECTED
end
return mp.CLEAN

