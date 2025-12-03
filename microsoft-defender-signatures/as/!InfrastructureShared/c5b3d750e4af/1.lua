-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b3d750e4af\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
l_0_0 = (string.lower)(l_0_0)
if l_0_0 == "8a3d3271-36c5-4e53-942a-99bab70de223" or l_0_0 == "0a78c000-0352-4e17-9017-de92ad94ca06" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1133", "tooldrop_by_remote_access_tool")
return mp.INFECTED

