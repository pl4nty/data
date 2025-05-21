-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\663e_223.luac 

-- params : ...
-- function num : 0
if (string.match)((string.lower)((mp.getfilename)()), "%.c$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

