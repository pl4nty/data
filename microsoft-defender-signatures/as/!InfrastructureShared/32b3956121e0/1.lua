-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3956121e0\1.luac 

-- params : ...
-- function num : 0
if verify_memory_features_coverage_orgs() then
  return mp.INFECTED
end
return mp.CLEAN

