local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = nil
L2_1 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe"
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_UNKNOWN
  if L0_1 ~= L3_1 then
    goto lbl_65
  end
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  L1_1 = L4_1
else
  L4_1 = mp
  L4_1 = L4_1.IOAVGetProcessPath
  L4_1 = L4_1()
  if L4_1 then
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L2_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    L1_1 = L6_1
  end
end
if L1_1 then
  L4_1 = mp
  L4_1 = L4_1.UfsSetMetadataBool
  L5_1 = "LUA:ZipWithMotwAll"
  L6_1 = true
  L4_1(L5_1, L6_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  do return L4_1 end
  goto lbl_87
  ::lbl_65::
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_HAS_MOTW_ADS
  L3_1 = L3_1(L4_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.GetMOTWZone
    L3_1 = L3_1()
    if L3_1 and 3 <= L3_1 then
      L4_1 = mp
      L4_1 = L4_1.UfsSetMetadataBool
      L5_1 = "LUA:ZipWithMotwAll"
      L6_1 = true
      L4_1(L5_1, L6_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
::lbl_87::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
