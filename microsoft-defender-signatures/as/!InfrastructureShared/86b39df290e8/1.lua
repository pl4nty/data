-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\86b39df290e8\1.luac 

-- params : ...
-- function num : 0
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1134.001", "AccessTokenManipulation")
return mp.INFECTED

