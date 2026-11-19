-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/SuspiciousCertAttributes.SC.A
-- Type: 10
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpTrustCheck_ValidlySigned & TEL:Trojan:Win64/ScreenConnect.A & RPF:MpCertStart & RPF:MpSeqCertSz

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = { SIG_CONTEXT = "LUA", CONTENT_SOURCE = "SC_CONFIG", TAG = "INTERFLOW" }
local r0_1 = {
  ["screenconnect.com"] = true, ["digicert.com"] = true, ["symantec.com"] = true,
  ["symcb.com"] = true
}
local r0_2 = "ScreenConnect_Cert_EmbeddedConfig"
local r0_3 = MpCommon.PathToWin32Path(mp.getfilename())
if r0_3 then
  local r0_4 = mp.get_mpattributevalue("RPF:MpCertStart")
  local r0_5 = mp.get_mpattributevalue("RPF:MpSeqCertSz")
  if r0_4 and r0_5 then
    mp.readprotection(false)
    local r0_6 = mp.readfile(r0_4, r0_5)
    mp.readprotection(true)
    if r0_6 then
      mp.vfo_add_buffer(r0_6, "ScreenConnect_Cert", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      local r0_7 = 0
      for r0_8 in string.gmatch(r0_6,
        "(<configuration>.-ScreenConnect.ApplicationSettings.-<value>%?h=.-</configuration>)") do
        local r0_9 = string.lower(string.match(r0_8, "<value>%?h=(.-)&"))
        local r0_10 = string.match(r0_9, "([^%.]+%.[^%.]+)$")
        local r0_11 = string.find(r0_9, "^http") and r0_9 or string.format("http://%s", r0_9)
        local r0_12, r0_13 = mp.CheckUrl(r0_9)
        if r0_10 and not r0_1[r0_10] and not r0_1[r0_9] and (r0_12 ~= 1 or r0_13 ~= 1) then
          local r0_14 = SafeGetUrlReputation({ r0_11 }, r0_0, false, 3000)
          if r0_14.urls[r0_11]
            and r0_14.urls[r0_11].determination == 2
            and r0_14.urls[r0_11].confidence >= 60 then
            mp.set_mpattribute(string.format("%s_C2=%s", r0_2, r0_9))
            mp.vfo_add_buffer(r0_8, r0_2, mp.ADD_VFO_TAKE_ACTION_ON_DAD)
            r0_7 = r0_7 + 1
          end
        end
      end
      if r0_7 == 0 then
        local r0_15, r0_16, r0_17 = string.find(string.gsub(r0_6, "([^%z])%z", "%1"),
          "(http[^%c]+)$", #r0_6 - 1280)
        if r0_17 then
          local r0_18 = string.match(r0_17, "http[s:/]+([^%.]+%.[^%./:]+)")
          if r0_18 and not r0_1[r0_18] then
            local r0_19 = string.match(r0_18, "([^%.]+%.[^%.]+)$")
            if r0_19 and not r0_1[r0_19] then
              mp.set_mpattribute(string.format("%s_C2=%s", r0_2, r0_18))
              SafeGetUrlReputation({ r0_17 }, r0_0, false, 3000)
              return mp.INFECTED
            end
          end
        end
        return mp.CLEAN
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
