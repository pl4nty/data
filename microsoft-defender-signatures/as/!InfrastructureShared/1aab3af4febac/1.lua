-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1aab3af4febac\1.luac 

-- params : ...
-- function num : 0
if IsAncestorTaintedScriptOrBin(true) then
  TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
  return mp.INFECTED
end
return mp.CLEAN

