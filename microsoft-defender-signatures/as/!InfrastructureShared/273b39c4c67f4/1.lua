-- Threat: !InfrastructureShared
-- Name: 273b39c4c67f4
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "Uri=([^;]+)")
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = {}
  l_0_2.SIG_CONTEXT = "BM"
  l_0_2.CONTENT_SOURCE = "QUE_SET_RE"
  if string.match(l_0_1, "^https?://") then
    local l_0_3, l_0_4 = mp.CheckUrl(l_0_1)
    if l_0_3 == 1 and l_0_4 == 1 then
      return mp.CLEAN
    end
    local l_0_5 = SafeGetUrlReputation({l_0_1}, l_0_2, false, 3000)
    if l_0_5.urls[l_0_1] and l_0_5.urls[l_0_1].determination == 2 and l_0_5.urls[l_0_1].confidence >= 60 then
      bm.add_related_string("MALICIOUS URL: ", l_0_1, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
