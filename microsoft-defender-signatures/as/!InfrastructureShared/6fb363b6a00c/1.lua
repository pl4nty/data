-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fb363b6a00c\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  l_0_0 = l_0_0:match("=(https?://.-);")
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "SmsScan"
  l_0_1.FILELESS = "true"
  l_0_1.CMDLINE_URL = "false"
  local l_0_2, l_0_3 = ExtractUrlGetReputation(l_0_0, l_0_1, true, 2, 60, false, 3000)
  if l_0_2 then
    (bm.add_related_string)("UrlReputation", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

