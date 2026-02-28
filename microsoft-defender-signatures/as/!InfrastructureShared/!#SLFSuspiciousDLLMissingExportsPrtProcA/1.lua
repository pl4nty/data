local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = "SuspiciousDLL.PrtProc.Exports"
L1_1 = 6
L2_1 = {}
L2_1.ClosePrintProcessor = true
L2_1.ControlPrintProcessor = true
L2_1.EnumPrintProcessorDatatypes = true
L2_1.GetPrintProcessorCapabilities = true
L2_1.OpenPrintProcessor = true
L2_1.PrintDocumentOnPrintProcessor = true
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L4_1 = pe
L4_1 = L4_1.get_exports
L4_1, L5_1 = L4_1()
if not (L3_1 and L5_1) or L4_1 == 0 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = 0
L7_1 = {}
L8_1 = 1
L9_1 = L4_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = pe
  L12_1 = L12_1.mmap_string_rva
  L13_1 = L5_1[L11_1]
  L13_1 = L13_1.namerva
  L14_1 = 64
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 ~= nil then
    L13_1 = L2_1[L12_1]
    if L13_1 then
      L13_1 = 1
      if L13_1 then
        goto lbl_49
      end
    end
    L13_1 = 0
    ::lbl_49::
    L6_1 = L6_1 + L13_1
    L13_1 = table
    L13_1 = L13_1.insert
    L14_1 = L7_1
    L15_1 = L12_1
    L13_1(L14_1, L15_1)
  end
end
L8_1 = AppendToRollingQueue
L9_1 = L0_1
L10_1 = string
L10_1 = L10_1.lower
L11_1 = L3_1
L10_1 = L10_1(L11_1)
L11_1 = string
L11_1 = L11_1.format
L12_1 = "Count=%d_List=%s_MissingReq=%d/%d"
L13_1 = L4_1
L14_1 = table
L14_1 = L14_1.concat
L15_1 = L7_1
L16_1 = ","
L14_1 = L14_1(L15_1, L16_1)
L15_1 = L1_1 - L6_1
L16_1 = L1_1
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L1_1 == L6_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
