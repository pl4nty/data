-- Threat: !InfrastructureShared
-- Name: 12d412284aa46
-- Type: 21
-- Includes: LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = {}
local r0_1 = nri.GetRawRequestBlob()
local r0_2 = nri.GetRawResponseBlob()
if r0_1 then
  local r0_3 = string.lower(r0_1)
  local r0_4, r0_5 = r0_1:match("^(%u+)%s+([^%s]+)%s+HTTP/")
  r0_4 = r0_4 or ""
  r0_5 = r0_5 or ""
  local r0_6 = string.lower(r0_5)
  local r0_7 = string.find(r0_6, "/login/?login_only=1", 1, true)
  r0_7 = r0_7 ~= nil
  local r0_8 = string.find(r0_3, "%0a", 1, true)
  r0_8 = r0_8 ~= nil or string.find(r0_3, "\n", 1, true) ~= nil
  local r0_9 = r0_1.match
  r0_9 = r0_9(r0_1, "[Aa]uthorization:%s*[Bb]asic%s+([A-Za-z0-9+/=]+)")
  local r0_10 = {
    "dXNlcj1yb290", "aGFzcm9vdD0x", "dGZhX3ZlcmlmaWVkPTE",
    "c3VjY2Vzc2Z1bF9pbnRlcm5hbF9hdXRoX3dpdGhfdGltZXN0YW1w"
  }
  local r0_11 = 0
  if r0_9 then
    local r0_12, r0_13, r0_14 = ipairs(r0_10)
    for r0_15, r0_16 in r0_12, r0_13, r0_14 do
      local r0_17 = string.find(r0_9, r0_16, 1, true)
      if r0_17 ~= nil then
        r0_11 = r0_11 + 1
      end
    end
  end
  local r0_18 = r0_8 and r0_7 or r0_11 >= 2
  local r0_19 = string.find(r0_6, "/scripts2/", 1, true)
  r0_19 = r0_19 ~= nil
  local r0_20 = string.find(r0_6, "/json-api/", 1, true)
  r0_20 = r0_20 ~= nil or string.find(r0_6, "/cpsess", 1, true) ~= nil
  local r0_21 = 0
  if r0_2 then
    local r0_22 = string.lower(r0_2)
    local r0_23 = string.find(r0_22, " 200", 1, true)
    if r0_23 ~= nil
      or string.find(r0_22, " 302", 1, true) ~= nil
      or string.find(r0_22, " 307", 1, true) ~= nil then
      r0_21 = 1
    end
  end
  if r0_18 or r0_19 or r0_20 then
    r0_0.stage1_login_only = r0_7 and "1" or "0"
    r0_0.stage2_inject = r0_18 and "1" or "0"
    r0_0.stage3_scripts2 = r0_19 and "1" or "0"
    r0_0.stage4_api = r0_20 and "1" or "0"
    r0_0.bad_cookie = "1"
    local r0_24 = tostring(r0_21)
    r0_0.resp_ok_or_30x = r0_24
    r0_0.method = r0_4
    r0_24 = r0_5.sub
    r0_24 = r0_24(r0_5, 1, 120)
    r0_0.path = r0_24
    r0_24 = nri
    r0_24 = r0_24.GetHttpRequestHeader
    r0_24 = r0_24("User-Agent") or ""
    r0_0.useragent = r0_24
    r0_24 = nri
    r0_24 = r0_24.GetHttpRequestHeader
    r0_24 = r0_24("Cookie") or ""
    r0_0.cookie = r0_24
    r0_24 = tostring
    r0_24 = r0_24(r0_11)
    r0_0.auth_hits = r0_24
    if r0_9 then
      local r0_25 = r0_9:sub(1, 120)
      r0_0.auth_b64_prefix = r0_25
    end
    local r0_26 = tohex(r0_1)
    r0_0.NRI_RequestBlob = r0_26
    if r0_2 then
      local r0_27 = tohex(r0_2)
      r0_0.NRI_ResponseBlob = r0_27
    end
    local r0_28 = nri.AddTelemetry
    local r0_29 = mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY)
    r0_28(r0_29, r0_0)
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
