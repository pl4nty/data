local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "%.([^%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1.xlsx = true
L3_1.xls = true
L3_1.xlsm = true
L3_1.xlsb = true
L3_1.xlt = true
L3_1.xltx = true
L3_1.xltm = true
L3_1.xlam = true
L3_1.xla = true
L3_1.docx = true
L3_1.doc = true
L3_1.docm = true
L3_1.dotm = true
L3_1.dotx = true
L3_1.ppam = true
L3_1.pptm = true
L3_1.ppsm = true
L3_1.potm = true
L3_1.ppt = true
L3_1.pptx = true
L3_1.rtf = true
L3_1.one = true
L3_1[".onetoc2"] = true
L4_1 = {}
L4_1.iso = true
L4_1.vhd = true
L4_1.vhdx = true
L4_1.ppkg = true
L4_1.sppkg = true
L4_1.img = true
L5_1 = nil
L6_1 = L4_1[L2_1]
if L6_1 then
  L5_1 = "iso|"
else
  L6_1 = L3_1[L2_1]
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.get_mpattribute
    L7_1 = "MHSTR:MacroInside"
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L5_1 = "office|HasMacros|"
    end
  else
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESSDEVICEPATH
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_PROCESS_PPID
L7_1 = L7_1(L8_1)
L8_1 = MpCommon
L8_1 = L8_1.PathToWin32Path
L9_1 = L6_1
L8_1 = L8_1(L9_1)
L6_1 = L8_1
if L6_1 == nil or L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L9_1 = L6_1
L8_1 = L6_1.lower
L8_1 = L8_1(L9_1)
L6_1 = L8_1
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = ";"
L12_1 = 0
while L12_1 <= 5 do
  L13_1 = pcall
  L14_1 = mp
  L14_1 = L14_1.GetParentProcInfo
  L15_1 = L7_1
  L13_1, L14_1 = L13_1(L14_1, L15_1)
  L9_1 = L14_1
  L8_1 = L13_1
  if L8_1 ~= true or L9_1 == nil then
    break
  end
  L13_1 = L9_1.ppid
  if L13_1 == nil then
    break
  end
  L13_1 = L9_1.image_path
  if L13_1 == nil then
    break
  end
  L7_1 = L9_1.ppid
  L13_1 = string
  L13_1 = L13_1.lower
  L14_1 = L9_1.image_path
  L13_1 = L13_1(L14_1)
  L10_1 = L13_1
  L13_1 = L11_1
  L14_1 = "Parent_"
  L15_1 = L12_1
  L16_1 = "Path="
  L17_1 = L10_1
  L18_1 = ";pid="
  L19_1 = L7_1
  L20_1 = ";"
  L11_1 = L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1
  L12_1 = L12_1 + 1
end
L13_1 = MpCommon
L13_1 = L13_1.GetCurrentTimeT
L13_1 = L13_1()
L14_1 = 31536000
L15_1 = L0_1
L16_1 = "\\"
L17_1 = L1_1
L15_1 = L15_1 .. L16_1 .. L17_1
L16_1 = "OFFAR::ProcessImagePath="
L17_1 = L6_1
L18_1 = ";pid="
L19_1 = L7_1
L20_1 = ";timestamp="
L21_1 = L13_1
L22_1 = L11_1
L16_1 = L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1
if L5_1 ~= nil then
  L17_1 = L16_1
  L18_1 = ";extra="
  L19_1 = L5_1
  L16_1 = L17_1 .. L18_1 .. L19_1
end
L17_1 = IsKeyInRollingQueue
L18_1 = "CC_filelist"
L19_1 = L15_1
L17_1 = L17_1(L18_1, L19_1)
if not L17_1 then
  L17_1 = AppendToRollingQueue
  L18_1 = "CC_filelist"
  L19_1 = L15_1
  L20_1 = L16_1
  L21_1 = L14_1
  L22_1 = 32
  L17_1(L18_1, L19_1, L20_1, L21_1, L22_1)
  L17_1 = mp
  L17_1 = L17_1.set_mpattribute
  L18_1 = string
  L18_1 = L18_1.format
  L19_1 = "MpInternal_researchdata=CC_Research=%s"
  L20_1 = L16_1
  L18_1, L19_1, L20_1, L21_1, L22_1 = L18_1(L19_1, L20_1)
  L17_1(L18_1, L19_1, L20_1, L21_1, L22_1)
end
L17_1 = mp
L17_1 = L17_1.INFECTED
return L17_1
