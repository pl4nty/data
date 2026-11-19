-- Threat: !InfrastructureShared
-- Name: f1b3863fc6e7
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = false
local r0_1 = this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2
  or this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2
  or this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  or this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2
if r0_1 then
  local r0_2 = string.match(r0_1, "Uri=([^;]+)")
  if not r0_2 then
    r0_2 = string.match(r0_1, "DestIp=([^;]*);")
    if not (r0_2 and isPublicIP(r0_2)) then
      return mp.CLEAN
    end
    r0_0 = true
  end
  if not r0_0 then
    local r0_3 = ExtractPartsFromUri(r0_2)
    if next(r0_3) ~= nil and r0_3.host ~= nil then
      local r0_4 = string.lower(tostring(r0_3.host))
      r0_4 = string.gsub(r0_4, "%.$", "")
      if r0_4 == "localhost" or r0_4 == "127.0.0.1" or r0_4 == "::1" then
        return mp.CLEAN
      end
    end
  end
  local r0_5 = {
    "core.microsoft", "adobedtm.com", "npmjs.org", "mce-sys.com", "adobess.com", "anthropic.com",
    "cloud.microsoft", "npmmirror.com", "preyproject.com", "adobelogin.com", "adobe.com", "adobe.io",
    "adobesc.com", "playwright.dev", "githubcopilot.com", "nuget.org", "http://192.168.",
    "http://10."
  }
  if contains(r0_2, r0_5) then
    return mp.CLEAN
  end
  local r0_6 = nil
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
    r0_6 = this_sigattrlog[1].utf8p2
  end
  if isnull(r0_6) then
    return mp.CLEAN
  end
  local r0_7 = r0_6:lower()
  r0_7 = r0_7:match('node%.exe"?%s+"?([^"]+%.js)"?')
  if r0_7 then
    bm.add_related_file(r0_7)
  end
  local r0_8 = {}
  r0_8.SIG_CONTEXT = "NODE_JS"
  r0_8.CONTENT_SOURCE = "BM"
  r0_8.TAG = "INTERFLOW"
  if not r0_0 then
    if not string.find(r0_2, "%.") then
      return mp.CLEAN
    end
    local r0_9, r0_10 = mp.CheckUrl(r0_2)
    if r0_9 == 1 and r0_10 == 1 then
      return mp.CLEAN
    end
  end
  local r0_11 = SafeGetUrlReputation
  local r0_12 = {}
  local r0_13 = r0_2
  r0_12[1] = r0_13
  r0_13 = r0_8
  r0_11 = r0_11(r0_12, r0_13, false, 2000)
  r0_12 = r0_11.urls
  if r0_12[r0_2] and r0_11.urls[r0_2].determination == 2 and r0_11.urls[r0_2].confidence >= 60 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
