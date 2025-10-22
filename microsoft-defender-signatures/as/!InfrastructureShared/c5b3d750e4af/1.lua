-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b3d750e4af\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 and (string.lower)(l_0_0) == "8a3d3271-36c5-4e53-942a-99bab70de223" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1133", "tooldrop_by_remote_access_tool")
return mp.INFECTED

