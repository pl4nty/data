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
  do
    if not (string.find)(l_0_12, "^http") or not l_0_12 then
      local l_0_15, l_0_16 = (string.format)("http://%s", l_0_12)
    end
    local l_0_17, l_0_18 = , (mp.CheckUrl)(l_0_12)
    if l_0_13 and not l_0_1[l_0_13] and not l_0_1[l_0_12] and (l_0_18 ~= 1 or l_0_12 ~= 1) then
      local l_0_19 = nil
      local l_0_20 = SafeGetUrlReputation
      l_0_20 = l_0_20({l_0_17}, l_0_0, false, 3000)
      if (l_0_20.urls)[l_0_17] and ((l_0_20.urls)[l_0_17]).determination == 2 and ((l_0_20.urls)[l_0_17]).confidence >= 60 then
        (mp.set_mpattribute)((string.format)("%s_C2=%s", l_0_2, l_0_12))
        ;
        (mp.vfo_add_buffer)(l_0_11, l_0_2, mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        l_0_7 = l_0_7 + 1
      end
    end
    do
      -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
if l_0_7 == 0 then
  local l_0_21, l_0_22, l_0_23 = (string.find)((string.gsub)(l_0_6, "([^%z])%z", "%1"), "(http[^%c]+)$", #l_0_6 - 1280)
  if l_0_23 then
    local l_0_24 = (string.match)(l_0_23, "http[s:/]+([^%.]+%.[^%./:]+)")
    if l_0_24 and not l_0_1[l_0_24] then
      local l_0_25 = (string.match)(l_0_24, "([^%.]+%.[^%.]+)$")
      if l_0_25 and not l_0_1[l_0_25] then
        (mp.set_mpattribute)((string.format)("%s_C2=%s", l_0_2, l_0_24))
        local l_0_26 = SafeGetUrlReputation
        local l_0_27 = {}
        -- DECOMPILER ERROR at PC200: No list found for R14 , SetList fails

        -- DECOMPILER ERROR at PC201: Overwrote pending register: R15 in 'AssignReg'

        l_0_26(l_0_27, l_0_23, false, 3000)
        l_0_26 = mp
        l_0_26 = l_0_26.INFECTED
        return l_0_26
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

