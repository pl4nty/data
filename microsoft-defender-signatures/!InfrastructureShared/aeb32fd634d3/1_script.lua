-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\aeb32fd634d3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
TrackPidAndTechniqueBM(l_0_0.ppid, "T1562.001", "mptamper-titokensteal")
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).p1
  l_0_2 = (this_sigattrlog[1]).p2
end
;
(bm.add_related_string)("OldName", l_0_1, bm.RelatedStringBMReport)
;
(bm.add_related_string)("NewName", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED

