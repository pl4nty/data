-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b3c157424c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 and l_0_0.ppid then
  local l_0_1 = TrackPidAndMultipleTechniquesBM
  local l_0_2 = l_0_0.ppid
  local l_0_3 = {}
  l_0_3.T1030 = "exfil_bgp"
  l_0_3.T1041 = "exfil_bgp"
  l_0_1(l_0_2, l_0_3)
end
do
  return mp.INFECTED
end

