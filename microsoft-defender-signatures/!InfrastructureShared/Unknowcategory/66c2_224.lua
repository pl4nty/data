-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\66c2_224.luac 

-- params : ...
-- function num : 0
if (string.match)((string.lower)((mp.getfilename)()), "%.xz$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

