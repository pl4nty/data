-- Threat: !InfrastructureShared
-- Name: 4d8b3328a18cd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local r0_0 = this_sigattrlog[25].matched and this_sigattrlog[25].utf8p2
  or this_sigattrlog[26].matched and this_sigattrlog[26].utf8p2
  or this_sigattrlog[27].matched and this_sigattrlog[27].utf8p2
  or this_sigattrlog[28].matched and this_sigattrlog[28].utf8p2
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
    r0_4.CONTENT_SOURCE = "SUSPBITSCREATE-F"
    r0_4.PROCESS_CONTEXT = "bitsadmin.exe"
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
