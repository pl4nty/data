local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1 = L1_1()
if L1_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = pcall
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  L1_1 = L3_1
  _ = L2_1
end
L2_1 = L1_1 or L2_1
if not L1_1 then
  L2_1 = ""
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = ""
end
L4_1 = nil
if 1024 < L0_1 then
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = false
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.readfile
  L6_1 = 0
  L7_1 = L0_1
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
else
  L5_1 = tostring
  L6_1 = headerpage
  L5_1 = L5_1(L6_1)
  L6_1 = tostring
  L7_1 = footerpage
  L6_1 = L6_1(L7_1)
  L4_1 = L5_1 .. L6_1
end
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "<StringTables>(.-)</StringTable>"
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "<String ID=.->({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})</String"
L7_1 = L4_1
L6_1 = L4_1.match
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L7_1 = L6_1
  L8_1 = ";"
  L9_1 = L2_1
  L10_1 = ";"
  L11_1 = L3_1
  L7_1 = L7_1 .. L8_1 .. L9_1 .. L10_1 .. L11_1
  L8_1 = AppendToRollingQueue
  L9_1 = "MMC_SnapInCLSID"
  L10_1 = "SnapInCLSID"
  L11_1 = string
  L11_1 = L11_1.lower
  L12_1 = L7_1
  L11_1 = L11_1(L12_1)
  L12_1 = 1800
  L13_1 = 100
  L14_1 = 0
  L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L8_1 = set_research_data
  L9_1 = "CLSID"
  L10_1 = MpCommon
  L10_1 = L10_1.Base64Encode
  L11_1 = L7_1
  L10_1 = L10_1(L11_1)
  L11_1 = false
  L8_1(L9_1, L10_1, L11_1)
end
L7_1 = "<String ID=.->(http.-)</String"
L9_1 = L4_1
L8_1 = L4_1.match
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L9_1 = L8_1
  L10_1 = ";"
  L11_1 = L2_1
  L12_1 = ";"
  L13_1 = L3_1
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
  L10_1 = UrlGrader
  L11_1 = L8_1
  L12_1 = "Trojan:Win32/SuspMMCFile.A"
  L13_1 = false
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 ~= 0 then
    L12_1 = safeJsonSerialize
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    L13_1 = set_research_data
    L14_1 = "URL_info"
    L15_1 = MpCommon
    L15_1 = L15_1.Base64Encode
    L16_1 = L12_1
    L15_1 = L15_1(L16_1)
    L16_1 = false
    L13_1(L14_1, L15_1, L16_1)
    L13_1 = L9_1
    L14_1 = ";URL_Grading_Info="
    L15_1 = L12_1
    L9_1 = L13_1 .. L14_1 .. L15_1
  end
  L12_1 = AppendToRollingQueue
  L13_1 = "MMC_SnapInUrls"
  L14_1 = "SnapInUrls"
  L15_1 = string
  L15_1 = L15_1.lower
  L16_1 = L9_1
  L15_1 = L15_1(L16_1)
  L16_1 = 1800
  L17_1 = 100
  L18_1 = 0
  L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
  L12_1 = set_research_data
  L13_1 = "URL"
  L14_1 = MpCommon
  L14_1 = L14_1.Base64Encode
  L15_1 = L8_1
  L14_1 = L14_1(L15_1)
  L15_1 = false
  L12_1(L13_1, L14_1, L15_1)
end
if L6_1 or L8_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
