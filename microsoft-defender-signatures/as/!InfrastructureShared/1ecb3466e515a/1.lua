-- Threat: !InfrastructureShared
-- Name: 1ecb3466e515a
-- Type: 21
-- Includes: LuaFuncHelper

local r0_0 = this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2
  or this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2
  or this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2
  or this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2
if r0_0 then
  local r0_1 = string.match(r0_0, "Uri=([^;]+)")
  if not r0_1 then
    return mp.CLEAN
  end
  local r0_2 = {}
  r0_2.SIG_CONTEXT = "BM"
  r0_2.CONTENT_SOURCE = "SUSPCOLORPL-C"
  if string.match(r0_1, "^https?://") then
    local r0_3 = SafeGetUrlReputation({ r0_1 }, r0_2, false, 3000)
    if r0_3.urls[r0_1] and r0_3.urls[r0_1].determination == 2 and r0_3.urls[r0_1].confidence >= 60 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
