-- Threat: !InfrastructureShared
-- Name: 125b3fb3d674f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local r0_0 = this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  or this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2
  or this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2
  or this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2
if r0_0 then
  local r0_1 = string.match(r0_0, "Uri=([^;]+)")
  if isnull(r0_1) then
    return mp.CLEAN
  end
  local r0_2, r0_3 = mp.CheckUrl(r0_1)
  if r0_2 == 1 and r0_3 == 1 then
    return mp.CLEAN
  end
  local r0_4 = {}
  r0_4.SIG_CONTEXT = "BM"
  r0_4.CONTENT_SOURCE = "SUSPBITSCREATE-A"
  if string.match(r0_1, "^https?://") then
    local r0_5 = SafeGetUrlReputation({ r0_1 }, r0_4, false, 3000)
    if r0_5.urls[r0_1] and r0_5.urls[r0_1].determination == 2 and r0_5.urls[r0_1].confidence >= 60 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
