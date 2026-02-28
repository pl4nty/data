local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = nil
L2_1 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe"
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L4_1 then
  L4_1 = mp
  L4_1 = L4_1.SCANREASON_UNKNOWN
  if L0_1 ~= L4_1 then
    goto lbl_58
  end
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  L1_1 = L5_1
else
  L5_1 = mp
  L5_1 = L5_1.IOAVGetProcessPath
  L5_1 = L5_1()
  if L5_1 then
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "([^\\]+)$"
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L2_1
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L6_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L1_1 = L7_1
    L7_1 = mp
    L7_1 = L7_1.IOAVGetDownloadUrl
    L7_1 = L7_1()
    L3_1 = L7_1
    goto lbl_80
    ::lbl_58::
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_HAS_MOTW_ADS
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.GetMOTWZone
      L4_1 = L4_1()
      L1_1 = L4_1 == 3 or L4_1 == 4
      if L1_1 then
        L5_1 = mp
        L5_1 = L5_1.GetMOTWHostUrl
        L5_1 = L5_1()
        L3_1 = L5_1
      end
    end
  end
end
::lbl_80::
if not L1_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1.SIG_CONTEXT = "SINGLE_SCRIPT"
L4_1.TAG = "INTERFLOW"
L5_1 = SafeGetUrlReputation
L6_1 = {}
L7_1 = L3_1
L6_1[1] = L7_1
L7_1 = L4_1
L8_1 = false
L9_1 = 2000
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L6_1 = L5_1.urls
  L6_1 = L6_1[L3_1]
  if L6_1 then
    L6_1 = L5_1.urls
    L6_1 = L6_1[L3_1]
    L6_1 = L6_1.determination
    if L6_1 == 1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
end
L6_1 = mp
L6_1 = L6_1.getfilename
L7_1 = mp
L7_1 = L7_1.bitor
L8_1 = mp
L8_1 = L8_1.FILEPATH_QUERY_FNAME
L9_1 = mp
L9_1 = L9_1.FILEPATH_QUERY_LOWERCASE
L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1(L8_1, L9_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.getfilename
L8_1 = mp
L8_1 = L8_1.bitor
L9_1 = mp
L9_1 = L9_1.FILEPATH_QUERY_FULL
L10_1 = mp
L10_1 = L10_1.FILEPATH_QUERY_LOWERCASE
L8_1, L9_1, L10_1, L11_1 = L8_1(L9_1, L10_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.lower
L9_1 = MpCommon
L9_1 = L9_1.PathToWin32Path
L10_1 = L7_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1 = L8_1
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L9_1 = L7_1
L8_1 = L7_1.find
L10_1 = "^:\\program files\\"
L11_1 = 2
L8_1 = L8_1(L9_1, L10_1, L11_1)
if not L8_1 then
  L9_1 = L7_1
  L8_1 = L7_1.find
  L10_1 = "^:\\program files %(x86%)\\"
  L11_1 = 2
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  if not L8_1 then
    L9_1 = L7_1
    L8_1 = L7_1.find
    L10_1 = "^:\\windows\\"
    L11_1 = 2
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if not L8_1 then
      L9_1 = L7_1
      L8_1 = L7_1.find
      L10_1 = "^:\\voyagerbackups\\"
      L11_1 = 2
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if not L8_1 then
        L9_1 = L7_1
        L8_1 = L7_1.find
        L10_1 = "^:\\backup hta-prod-ta\\"
        L11_1 = 2
        L8_1 = L8_1(L9_1, L10_1, L11_1)
        if not L8_1 then
          L9_1 = L7_1
          L8_1 = L7_1.find
          L10_1 = "^:programdata\\hp\\rs\\data\\backup\\"
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            goto lbl_196
          end
        end
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_196::
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "MpDisableCaching"
L8_1(L9_1)
L8_1 = MpCommon
L8_1 = L8_1.AppendPersistContext
L9_1 = L7_1
L10_1 = "Lua:LuaHighRiskJSinZipWebVector.A"
L11_1 = 0
L8_1(L9_1, L10_1, L11_1)
L8_1 = AppendToRollingQueue
L9_1 = "LuaHighRiskJSinZipWebVector"
L10_1 = L6_1
L11_1 = L7_1
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
