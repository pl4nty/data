-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3f62d1155\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p2
if type(l_0_0) == "string" and l_0_0 ~= "" then
  set_research_data("SshBruteForceIncoming", l_0_0, true)
end
TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_SshBruteForceIn")
return mp.INFECTED

