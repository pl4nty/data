-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b3476d024e\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[3]).utf8p2
  l_0_0 = l_0_0:match("=(https?://.-);")
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "RunMRU"
  l_0_1.FILELESS = "false"
  l_0_1.CMDLINE_URL = "false"
  if ExtractUrlGetReputation(l_0_0, l_0_1, true, 2, 60, false, 3000) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

