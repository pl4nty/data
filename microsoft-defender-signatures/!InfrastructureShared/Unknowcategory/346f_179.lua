-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\346f_179.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("elfa_isharedlib") then
  return mp.INFECTED
end
return mp.CLEAN

