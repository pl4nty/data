-- Threat: !InfrastructureShared
-- Name: 1c3b31e1e5ea2
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_0 and l_0_1 then
  local l_0_2 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  if l_0_2 then
    local l_0_3 = string.match(l_0_2, "Uri=([^;]+)")
    if isnull(l_0_3) then
      return mp.CLEAN
    end
    local l_0_4 = {}
    l_0_4.SIG_CONTEXT = "BM"
    l_0_4.CONTENT_SOURCE = "MAPVIEW_TAINT"
    if string.match(l_0_3, "^https?://") then
      local l_0_5, l_0_6 = mp.CheckUrl(l_0_3)
      if l_0_5 == 1 and l_0_6 == 1 then
        return mp.CLEAN
      end
      local l_0_7 = SafeGetUrlReputation({l_0_3}, l_0_4, false, 3000)
      if l_0_7.urls[l_0_3] and l_0_7.urls[l_0_3].determination == 2 and l_0_7.urls[l_0_3].confidence >= 60 then
        local l_0_8, l_0_9 = pcall(string.match, l_0_0, "regionsize:(%d+)")
        if not l_0_8 or isnull(l_0_9) then
          return mp.CLEAN
        end
        bm.add_related_string("SHELLCODE BYTES: ", l_0_9, bm.RelatedStringBMReport)
        bm.add_related_string("MALCIOUS PATH: ", l_0_1, bm.RelatedStringBMReport)
        bm.add_related_string("MALICIOUS URL: ", l_0_3, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
