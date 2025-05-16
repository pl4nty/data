-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19cb3d1faa372\0x000002cc_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched or (this_sigattrlog[5]).matched then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion")
end
TrackPidAndTechniqueBM("BM", "T1070.003", "DefenseEvasion_IndicatorRemoval_ClearCmdHistory")
;
(mp.set_mpattribute)("BM_ClearCmdHistory")
return mp.INFECTED

