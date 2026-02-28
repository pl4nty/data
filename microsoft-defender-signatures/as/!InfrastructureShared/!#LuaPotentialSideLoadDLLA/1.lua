local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\windows\\system32"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\windows\\syswow64"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "program files"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\windows\\winsxs"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "\\windows defender\\platform"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_64
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_64::
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if not L2_1 or L2_1 < 256 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pehdr
L3_1 = L3_1.DataDirectory
L4_1 = pe
L4_1 = L4_1.IMAGE_DIRECTORY_ENTRY_EXPORT
L3_1 = L3_1[L4_1]
L3_1 = L3_1.RVA
L4_1 = pehdr
L4_1 = L4_1.DataDirectory
L5_1 = pe
L5_1 = L5_1.IMAGE_DIRECTORY_ENTRY_EXPORT
L4_1 = L4_1[L5_1]
L4_1 = L4_1.Size
L5_1 = L3_1 + L4_1
L6_1 = pe
L6_1 = L6_1.get_exports
L6_1, L7_1 = L6_1()
if L6_1 == 0 or L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = {}
L9_1 = {}
L10_1 = 1
L11_1 = L6_1
L12_1 = 1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = pe
  L14_1 = L14_1.mmap_string_rva
  L15_1 = L7_1[L13_1]
  L15_1 = L15_1.namerva
  L16_1 = 64
  L14_1 = L14_1(L15_1, L16_1)
  if L14_1 then
    L15_1 = L7_1[L13_1]
    L15_1 = L15_1.rva
    if L3_1 <= L15_1 then
      L15_1 = L7_1[L13_1]
      L15_1 = L15_1.rva
      if L5_1 >= L15_1 then
        L15_1 = table
        L15_1 = L15_1.insert
        L16_1 = L8_1
        L17_1 = L14_1
        L15_1(L16_1, L17_1)
    end
  end
  elseif L14_1 then
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L9_1
    L17_1 = L14_1
    L15_1(L16_1, L17_1)
  end
end
L10_1 = #L8_1
if L10_1 == 0 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = nil
L11_1 = mp
L11_1 = L11_1.get_mpattributevalue
L12_1 = "MpPureForwardedExportsAll"
L11_1 = L11_1(L12_1)
if L11_1 then
  L10_1 = "MpPureForwardedExportsAll"
else
  L11_1 = mp
  L11_1 = L11_1.get_mpattributevalue
  L12_1 = "MpPureForwardedExportsPresent"
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L10_1 = "MpPureForwardedExportsPresent"
  else
    L11_1 = mp
    L11_1 = L11_1.get_mpattributevalue
    L12_1 = "MpForwardedExportsPresent"
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L10_1 = "MpForwardedExportsPresent"
    else
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
end
L11_1 = nil
L12_1 = mp
L12_1 = L12_1.enum_mpattributesubstring
L13_1 = "MpPureForwardedExportsTarget"
L12_1 = L12_1(L13_1)
L12_1 = #L12_1
if 0 < L12_1 then
  L12_1 = mp
  L12_1 = L12_1.enum_mpattributesubstring
  L13_1 = "MpPureForwardedExportsTarget"
  L12_1 = L12_1(L13_1)
  L11_1 = L12_1[1]
else
  L12_1 = mp
  L12_1 = L12_1.enum_mpattributesubstring
  L13_1 = "MpPureForwardedExportsMissingTarget"
  L12_1 = L12_1(L13_1)
  L12_1 = #L12_1
  if 0 < L12_1 then
    L12_1 = mp
    L12_1 = L12_1.enum_mpattributesubstring
    L13_1 = "MpPureForwardedExportsMissingTarget"
    L12_1 = L12_1(L13_1)
    L11_1 = L12_1[1]
  else
    L11_1 = "ForwardedExportsTarget=FailedExtraction"
  end
end
L12_1 = string
L12_1 = L12_1.match
L13_1 = L11_1
L14_1 = "ForwardedExports(.+)"
L12_1 = L12_1(L13_1, L14_1)
L11_1 = L12_1
L12_1 = "PotentialSideLoadExports"
L13_1 = string
L13_1 = L13_1.format
L14_1 = "ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s__Size=%d"
L15_1 = L6_1
L16_1 = #L8_1
L17_1 = #L9_1
L18_1 = L10_1
L19_1 = L11_1
L20_1 = table
L20_1 = L20_1.concat
L21_1 = L8_1
L22_1 = ","
L20_1 = L20_1(L21_1, L22_1)
L21_1 = table
L21_1 = L21_1.concat
L22_1 = L9_1
L23_1 = ","
L21_1 = L21_1(L22_1, L23_1)
L22_1 = L2_1
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
L14_1 = AppendToRollingQueue
L15_1 = L12_1
L16_1 = L1_1
L17_1 = L13_1
L14_1(L15_1, L16_1, L17_1)
L14_1 = mp
L14_1 = L14_1.set_mpattribute
L15_1 = string
L15_1 = L15_1.format
L16_1 = "%s=%s"
L17_1 = L12_1
L18_1 = L13_1
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L15_1(L16_1, L17_1, L18_1)
L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
L14_1 = MpCommon
L14_1 = L14_1.SetOriginalFileName
L15_1 = L0_1
L16_1 = string
L16_1 = L16_1.format
L17_1 = "BM_%s"
L18_1 = L12_1
L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L16_1(L17_1, L18_1)
L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
L14_1 = MpCommon
L14_1 = L14_1.PathToWin32Path
L15_1 = string
L15_1 = L15_1.match
L16_1 = L11_1
L17_1 = "=(.+)"
L15_1 = L15_1(L16_1, L17_1)
if not L15_1 then
  L15_1 = ""
end
L14_1 = L14_1(L15_1)
if L14_1 then
  L15_1 = MpCommon
  L15_1 = L15_1.SetOriginalFileName
  L16_1 = L14_1
  L17_1 = string
  L17_1 = L17_1.format
  L18_1 = "BM_%s_Target"
  L19_1 = L12_1
  L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L17_1(L18_1, L19_1)
  L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
end
L15_1 = mp
L15_1 = L15_1.INFECTED
return L15_1
