local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L2_1 = 1
L3_1 = 10
L4_1 = 20
L5_1 = 100
L6_1 = "Scan_"
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = nil
L14_1 = this_sigattrlog
L14_1 = L14_1[1]
L1_1 = L14_1.utf8p2
L14_1 = string
L14_1 = L14_1.match
L15_1 = L1_1
L16_1 = "DestIp=([^;]*);"
L14_1 = L14_1(L15_1, L16_1)
L8_1 = L14_1
L14_1 = string
L14_1 = L14_1.match
L15_1 = L1_1
L16_1 = "DestPort=([^;]*);"
L14_1 = L14_1(L15_1, L16_1)
L9_1 = L14_1
if L8_1 == nil or L8_1 == "" or L9_1 == nil or L9_1 == "" then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = bm
L14_1 = L14_1.get_current_process_startup_info
L14_1 = L14_1()
if L14_1 then
  L15_1 = L14_1.ppid
  if L15_1 then
    L0_1 = L14_1.ppid
end
else
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L15_1 = L6_1
L16_1 = L0_1
L7_1 = L15_1 .. L16_1
L15_1 = pcall
L16_1 = MpCommon
L16_1 = L16_1.RollingQueueCreate
L17_1 = L7_1
L18_1 = L5_1
L19_1 = L2_1
L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
L11_1 = L16_1
L10_1 = L15_1
if not L10_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L15_1 = pcall
L16_1 = MpCommon
L16_1 = L16_1.RollingQueueQueryMultiKey
L17_1 = L7_1
L18_1 = L8_1
L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1)
L11_1 = L16_1
L10_1 = L15_1
if not L10_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
if L11_1 then
  L15_1 = type
  L16_1 = L11_1
  L15_1 = L15_1(L16_1)
  if L15_1 == "table" then
    L15_1 = pairs
    L16_1 = L11_1
    L15_1, L16_1, L17_1 = L15_1(L16_1)
    for L18_1, L19_1 in L15_1, L16_1, L17_1 do
      if L19_1 then
        L20_1 = L19_1.value
        if L20_1 == L9_1 then
          L20_1 = mp
          L20_1 = L20_1.CLEAN
          return L20_1
        end
      end
    end
  end
end
L15_1 = pcall
L16_1 = MpCommon
L16_1 = L16_1.RollingQueueAppend
L17_1 = L7_1
L18_1 = L8_1
L19_1 = L9_1
L20_1 = L2_1
L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
L11_1 = L16_1
L10_1 = L15_1
if not L10_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L15_1 = pcall
L16_1 = MpCommon
L16_1 = L16_1.RollingQueueCountOfUniqueKeys
L17_1 = L7_1
L15_1, L16_1 = L15_1(L16_1, L17_1)
L11_1 = L16_1
L10_1 = L15_1
if not L10_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L12_1 = L11_1
L15_1 = pcall
L16_1 = MpCommon
L16_1 = L16_1.RollingQueueCount
L17_1 = L7_1
L15_1, L16_1 = L15_1(L16_1, L17_1)
L11_1 = L16_1
L10_1 = L15_1
if not L10_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L13_1 = L11_1 / L12_1
if L3_1 < L12_1 or L4_1 < L13_1 then
  L15_1 = TrackPidAndTechniqueBM
  L16_1 = L0_1
  L17_1 = "T1046"
  L18_1 = "Discovery_NetworkScanning"
  L15_1(L16_1, L17_1, L18_1)
  L15_1 = pcall
  L16_1 = MpCommon
  L16_1 = L16_1.RollingQueueErase
  L17_1 = L7_1
  L15_1, L16_1 = L15_1(L16_1, L17_1)
  L11_1 = L16_1
  L10_1 = L15_1
  L15_1 = mp
  L15_1 = L15_1.INFECTED
  return L15_1
end
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
