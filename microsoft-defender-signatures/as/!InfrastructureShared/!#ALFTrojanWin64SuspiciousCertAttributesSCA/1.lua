local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = {}
L0_1.SIG_CONTEXT = "LUA"
L0_1.CONTENT_SOURCE = "SC_CONFIG"
L0_1.TAG = "INTERFLOW"
L1_1 = {}
L1_1["screenconnect.com"] = true
L1_1["digicert.com"] = true
L1_1["symantec.com"] = true
L1_1["symcb.com"] = true
L2_1 = "ScreenConnect_Cert_EmbeddedConfig"
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_mpattributevalue
L5_1 = "RPF:MpCertStart"
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.get_mpattributevalue
L6_1 = "RPF:MpSeqCertSz"
L5_1 = L5_1(L6_1)
if not L4_1 or not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = true
L7_1(L8_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.vfo_add_buffer
L8_1 = L6_1
L9_1 = "ScreenConnect_Cert"
L10_1 = mp
L10_1 = L10_1.ADD_VFO_TAKE_ACTION_ON_DAD
L7_1(L8_1, L9_1, L10_1)
L7_1 = 0
L8_1 = string
L8_1 = L8_1.gmatch
L9_1 = L6_1
L10_1 = "(<configuration>.-ScreenConnect.ApplicationSettings.-<value>%?h=.-</configuration>)"
L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
for L11_1 in L8_1, L9_1, L10_1 do
  L12_1 = string
  L12_1 = L12_1.lower
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L11_1
  L15_1 = "<value>%?h=(.-)&"
  L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L13_1(L14_1, L15_1)
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L12_1
  L15_1 = "([^%.]+%.[^%.]+)$"
  L13_1 = L13_1(L14_1, L15_1)
  L14_1 = string
  L14_1 = L14_1.find
  L15_1 = L12_1
  L16_1 = "^http"
  L14_1 = L14_1(L15_1, L16_1)
  L14_1 = L12_1 or L14_1
  if not L14_1 or not L12_1 then
    L14_1 = string
    L14_1 = L14_1.format
    L15_1 = "http://%s"
    L16_1 = L12_1
    L14_1 = L14_1(L15_1, L16_1)
  end
  L15_1 = mp
  L15_1 = L15_1.CheckUrl
  L16_1 = L12_1
  L15_1, L16_1 = L15_1(L16_1)
  if L13_1 then
    L17_1 = L1_1[L13_1]
    if not L17_1 then
      L17_1 = L1_1[L12_1]
      if not L17_1 and (L15_1 ~= 1 or L16_1 ~= 1) then
        L17_1 = SafeGetUrlReputation
        L18_1 = {}
        L19_1 = L14_1
        L18_1[1] = L19_1
        L19_1 = L0_1
        L20_1 = false
        L21_1 = 3000
        L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
        L18_1 = L17_1.urls
        L18_1 = L18_1[L14_1]
        if L18_1 then
          L18_1 = L17_1.urls
          L18_1 = L18_1[L14_1]
          L18_1 = L18_1.determination
          if L18_1 == 2 then
            L18_1 = L17_1.urls
            L18_1 = L18_1[L14_1]
            L18_1 = L18_1.confidence
            if 60 <= L18_1 then
              L18_1 = mp
              L18_1 = L18_1.set_mpattribute
              L19_1 = string
              L19_1 = L19_1.format
              L20_1 = "%s_C2=%s"
              L21_1 = L2_1
              L22_1 = L12_1
              L19_1, L20_1, L21_1, L22_1 = L19_1(L20_1, L21_1, L22_1)
              L18_1(L19_1, L20_1, L21_1, L22_1)
              L18_1 = mp
              L18_1 = L18_1.vfo_add_buffer
              L19_1 = L11_1
              L20_1 = L2_1
              L21_1 = mp
              L21_1 = L21_1.ADD_VFO_TAKE_ACTION_ON_DAD
              L18_1(L19_1, L20_1, L21_1)
              L7_1 = L7_1 + 1
            end
          end
        end
      end
    end
  end
end
if L7_1 == 0 then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = string
  L9_1 = L9_1.gsub
  L10_1 = L6_1
  L11_1 = "([^%z])%z"
  L12_1 = "%1"
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = "(http[^%c]+)$"
  L11_1 = #L6_1
  L11_1 = L11_1 - 1280
  L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1, L11_1)
  if L10_1 then
    L11_1 = string
    L11_1 = L11_1.match
    L12_1 = L10_1
    L13_1 = "http[s:/]+([^%.]+%.[^%./:]+)"
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 then
      L12_1 = L1_1[L11_1]
      if not L12_1 then
        L12_1 = string
        L12_1 = L12_1.match
        L13_1 = L11_1
        L14_1 = "([^%.]+%.[^%.]+)$"
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 then
          L13_1 = L1_1[L12_1]
          if not L13_1 then
            L13_1 = mp
            L13_1 = L13_1.set_mpattribute
            L14_1 = string
            L14_1 = L14_1.format
            L15_1 = "%s_C2=%s"
            L16_1 = L2_1
            L17_1 = L11_1
            L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L14_1(L15_1, L16_1, L17_1)
            L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
            L13_1 = SafeGetUrlReputation
            L14_1 = {}
            L15_1 = L10_1
            L14_1[1] = L15_1
            L15_1 = L0_1
            L16_1 = false
            L17_1 = 3000
            L13_1(L14_1, L15_1, L16_1, L17_1)
            L13_1 = mp
            L13_1 = L13_1.INFECTED
            return L13_1
          end
        end
      end
    end
  end
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
