-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a0b383ff4b23\1.luac 

-- params : ...
-- function num : 0
if IsAncestorTaintedScriptOrBin(true) then
  TrackPidAndTechniqueBM("BM", "T1552.003", "CredentialAccess")
  return mp.INFECTED
end
return mp.CLEAN

