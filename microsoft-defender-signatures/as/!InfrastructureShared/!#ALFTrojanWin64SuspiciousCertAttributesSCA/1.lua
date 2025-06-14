-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64SuspiciousCertAttributesSCA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0.SIG_CONTEXT = "LUA"
l_0_0.CONTENT_SOURCE = "SC_CONFIG"
l_0_0.TAG = "INTERFLOW"
local l_0_1 = {}
l_0_1["screenconnect.com"] = true
l_0_1["digicert.com"] = true
l_0_1["symantec.com"] = true
l_0_1["symcb.com"] = true
local l_0_2 = "ScreenConnect_Cert_EmbeddedConfig"
local l_0_3 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.get_mpattributevalue)("RPF:MpCertStart")
local l_0_5 = (mp.get_mpattributevalue)("RPF:MpSeqCertSz")
if not l_0_4 or not l_0_5 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_6 = (mp.readfile)(l_0_4, l_0_5)
;
(mp.readprotection)(true)
if not l_0_6 then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)(l_0_6, "ScreenConnect_Cert", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
local l_0_7 = 0
for l_0_11 in (string.gmatch)(l_0_6, "(<configuration>.-ScreenConnect.ApplicationSettings.-<value>%?h=.-</configuration>)") do
  local l_0_12 = (string.lower)((string.match)(l_0_11, "<value>%?h=(.-)&"))
  local l_0_13 = (string.match)(l_0_12, "([^%.]+%.[^%.]+)$")
  local l_0_14, l_0_15 = (mp.CheckUrl)(l_0_12)
  if l_0_13 and not l_0_1[l_0_13] and not l_0_1[l_0_12] and (l_0_14 ~= 1 or l_0_15 ~= 1) then
    local l_0_16 = SafeGetUrlReputation
    local l_0_17 = {}
    -- DECOMPILER ERROR at PC100: No list found for R17 , SetList fails

    -- DECOMPILER ERROR at PC101: Overwrote pending register: R18 in 'AssignReg'

    l_0_16 = l_0_16(l_0_17, l_0_12, false, 3000)
    l_0_17 = l_0_16.urls
    l_0_17 = l_0_17[l_0_12]
    if l_0_17 then
      l_0_17 = l_0_16.urls
      l_0_17 = l_0_17[l_0_12]
      l_0_17 = l_0_17.determination
      if l_0_17 == 2 then
        l_0_17 = l_0_16.urls
        l_0_17 = l_0_17[l_0_12]
        l_0_17 = l_0_17.confidence
        if l_0_17 >= 60 then
          l_0_17 = mp
          l_0_17 = l_0_17.set_mpattribute
          l_0_17((string.format)("%s_C2=%s", l_0_2, l_0_12))
          l_0_17 = mp
          l_0_17 = l_0_17.vfo_add_buffer
          l_0_17(l_0_11, l_0_2, mp.ADD_VFO_TAKE_ACTION_ON_DAD)
          l_0_7 = l_0_7 + 1
        end
      end
    end
  end
end
if l_0_7 == 0 then
  local l_0_18, l_0_19, l_0_20 = (string.find)((string.gsub)(l_0_6, "([^%z])%z", "%1"), "(http[^%c]+)$", #l_0_6 - 1280)
  if l_0_20 then
    local l_0_21 = (string.match)(l_0_20, "http[s:/]+([^%.]+%.[^%./:]+)")
    if l_0_21 and not l_0_1[l_0_21] then
      local l_0_22 = (string.match)(l_0_21, "([^%.]+%.[^%.]+)$")
      if l_0_22 and not l_0_1[l_0_22] then
        (mp.set_mpattribute)((string.format)("%s_C2=%s", l_0_2, l_0_21))
        local l_0_23 = SafeGetUrlReputation
        local l_0_24 = {}
        -- DECOMPILER ERROR at PC186: No list found for R14 , SetList fails

        -- DECOMPILER ERROR at PC187: Overwrote pending register: R15 in 'AssignReg'

        l_0_23(l_0_24, l_0_20, false, 3000)
        l_0_23 = mp
        l_0_23 = l_0_23.INFECTED
        return l_0_23
      end
    end
  end
  do
    do
      do return mp.CLEAN end
      return mp.INFECTED
    end
  end
end

