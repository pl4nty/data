local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
    goto lbl_63
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
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
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
    L9_1, L10_1 = L9_1(L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L1_1 = L7_1
    L7_1 = mp
    L7_1 = L7_1.IOAVGetDownloadUrl
    L7_1 = L7_1()
    L3_1 = L7_1
    goto lbl_85
    ::lbl_63::
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
::lbl_85::
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
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "about:"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = mp
  L5_1 = L5_1.get_contextdata
  L6_1 = mp
  L6_1 = L6_1.CONTEXT_DATA_FILEPATH
  L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "\\downloads\\update"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L6_1 = L4_1
    L5_1 = L4_1.find
    L7_1 = "\\downloads\\download"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_137
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_137::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
