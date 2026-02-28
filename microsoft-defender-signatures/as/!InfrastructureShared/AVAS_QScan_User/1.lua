local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = MpDetection
L1_1 = L1_1.ScanResource
L2_1 = "rootcertuser://"
L1_1(L2_1)
L1_1 = pcall
L2_1 = Infrastructure_ScanBedep
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 then
  L0_1.ScanBedep = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_RetliftenScan
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.RetliftenScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_AsrLinkScan
L5_1 = "qscanuser"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.RetliftenScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanEFISystemPartitions
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanEFISystemPartitions = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = MpCommon
L3_1 = L3_1.IsSampled
L4_1 = 100
L5_1 = true
L6_1 = true
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = pcall
  L4_1 = Infrastructure_ReportUEFIData
  L3_1, L4_1 = L3_1(L4_1)
  L2_1 = L4_1
  L1_1 = L3_1
  if not L1_1 then
    L0_1.ReportUEFIData = L2_1
    if L2_1 == "Scanning aborted by the user!" then
      L3_1 = error
      L4_1 = MpCommon
      L4_1 = L4_1.JsonSerialize
      L5_1 = L0_1
      L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
      L3_1(L4_1, L5_1, L6_1, L7_1)
    end
  end
end
L3_1 = next
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L3_1 = error
  L4_1 = MpCommon
  L4_1 = L4_1.JsonSerialize
  L5_1 = L0_1
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
  L3_1(L4_1, L5_1, L6_1, L7_1)
end
