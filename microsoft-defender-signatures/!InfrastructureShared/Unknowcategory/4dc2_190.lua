-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\4dc2_190.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("SIGATTR:Ransom:Win32/Sodin") then
  return mp.INFECTED
end
return mp.CLEAN

