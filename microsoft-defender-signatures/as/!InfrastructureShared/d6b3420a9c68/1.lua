-- Threat: !InfrastructureShared
-- Name: d6b3420a9c68
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local r0_0 = this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2
  or this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2
  or this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  or this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2
if r0_0 then
  local r0_1 = string.match(r0_0, "Uri=([^;]+)")
  if isnull(r0_1) then
    return mp.CLEAN
  end
  if not isValidLocalDomain(r0_1) then
    local r0_2, r0_3 = mp.CheckUrl(r0_1)
    if r0_2 == 1 and r0_3 == 1 then
      return mp.CLEAN
    end
    local r0_4 = {}
    r0_4.SIG_CONTEXT = "BM"
    r0_4.CONTENT_SOURCE = "ZERODAY-OBVIOUSLY"
    r0_4.PROCESS_CONTEXT = "PE"
    r0_4.FILELESS = "true"
    r0_4.CMDLINE_URL = "true"
    if string.match(r0_1, "^https?://") then
      local r0_5 = SafeGetUrlReputation({ r0_1 }, r0_4, false, 3000)
      if r0_5.urls[r0_1] and r0_5.urls[r0_1].determination == 2 and r0_5.urls[r0_1].confidence >= 60 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
