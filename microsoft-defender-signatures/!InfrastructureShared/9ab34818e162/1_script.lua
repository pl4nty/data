-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9ab34818e162\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = l_0_0:match("RemoteIp:([^;]+)")
  if l_0_1 ~= nil and l_0_1 ~= "" then
    l_0_1 = (string.lower)(l_0_1)
    TrackAttackerServer(l_0_1)
    AddResearchData("BM", true)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

