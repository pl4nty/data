-- Threat: !InfrastructureShared
-- Name: 328b3343a0af0
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = false
local r0_1 = this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2
  or this_sigattrlog[16].matched and this_sigattrlog[16].utf8p2
  or this_sigattrlog[17].matched and this_sigattrlog[17].utf8p2
  or this_sigattrlog[18].matched and this_sigattrlog[18].utf8p2
if r0_1 then
  local r0_2 = string.match(r0_1, "Uri=([^;]+)")
  if not r0_2 then
    local r0_3 = string.match(r0_1, "DestIp=([^;]*);")
    if not (r0_3 and isPublicIP(r0_3)) then
      return mp.CLEAN
    end
    r0_0 = true
  end
  local r0_4 = {}
  r0_4.SIG_CONTEXT = "DLL_LOAD_1"
  r0_4.CONTENT_SOURCE = "BM"
  r0_4.TAG = "INTERFLOW"
  if not r0_0 then
    if not string.find(r0_2, "%.") then
      return mp.CLEAN
    end
    local r0_5, r0_6 = mp.CheckUrl(r0_2)
    if r0_5 == 1 and r0_6 == 1 then
      return mp.CLEAN
    end
  end
  local r0_7 = SafeGetUrlReputation({ r0_2 }, r0_4, false, 2000)
  if r0_7.urls[r0_2] and r0_7.urls[r0_2].determination == 2 and r0_7.urls[r0_2].confidence >= 60 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
