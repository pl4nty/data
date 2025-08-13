-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b341604528\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_0["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
if not l_0_0[(string.lower)((versioning.GetOrgID)() or "")] then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 and l_0_1.ppid then
  local l_0_2 = TrackPidAndMultipleTechniquesBM
  local l_0_3 = l_0_1.ppid
  local l_0_4 = {}
  l_0_4.T1030 = "exfil_xmpp"
  l_0_4.T1041 = "exfil_xmpp"
  l_0_2(l_0_3, l_0_4)
end
do
  return mp.INFECTED
end

