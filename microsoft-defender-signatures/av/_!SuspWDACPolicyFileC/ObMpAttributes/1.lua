local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = ""
  L4_2 = A1_2 + 4
  if A2_2 > L4_2 then
    L4_2 = mp
    L4_2 = L4_2.readu_u32
    L5_2 = mp
    L5_2 = L5_2.readfile
    L6_2 = A1_2
    L7_2 = 4
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = 1
    L4_2 = L4_2(L5_2, L6_2)
    A1_2 = A1_2 + 4
    if not (0 < L4_2) then
      L5_2 = ""
      L6_2 = A1_2
      return L5_2, L6_2
    end
    L5_2 = mp
    L5_2 = L5_2.bitand
    L6_2 = L4_2 % 4
    L6_2 = 4 - L6_2
    L7_2 = 3
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = A1_2 + L4_2
    if A2_2 > L6_2 then
      if A0_2 then
        L6_2 = mp
        L6_2 = L6_2.readfile
        L7_2 = A1_2
        L8_2 = L4_2
        L6_2 = L6_2(L7_2, L8_2)
        L3_2 = L6_2
        if L3_2 == nil then
          L3_2 = ""
        end
      end
      L6_2 = A1_2 + L4_2
      A1_2 = L6_2 + L5_2
    end
  end
  L4_2 = L3_2
  L5_2 = A1_2
  return L4_2, L5_2
end

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ""
  L3_2 = A0_2 + 4
  if A1_2 > L3_2 then
    L3_2 = mp
    L3_2 = L3_2.readu_u32
    L4_2 = mp
    L4_2 = L4_2.readfile
    L5_2 = A0_2
    L6_2 = 4
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = 1
    L3_2 = L3_2(L4_2, L5_2)
    A0_2 = A0_2 + 4
    if not (0 < L3_2) then
      A0_2 = A0_2 + 4
      L4_2 = ""
      L5_2 = A0_2
      return L4_2, L5_2
    end
    L4_2 = mp
    L4_2 = L4_2.bitand
    L5_2 = L3_2 % 4
    L5_2 = 4 - L5_2
    L6_2 = 3
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = A0_2 + L3_2
    if A1_2 > L5_2 then
      L5_2 = mp
      L5_2 = L5_2.readfile
      L6_2 = A0_2
      L7_2 = L3_2
      L5_2 = L5_2(L6_2, L7_2)
      L2_2 = L5_2
      A0_2 = A0_2 + L3_2
      if L2_2 ~= nil then
        L5_2 = string
        L5_2 = L5_2.gsub
        L6_2 = L2_2
        L7_2 = "%z"
        L8_2 = ""
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        L2_2 = L5_2
      end
    end
    L5_2 = A0_2 + L4_2
    A0_2 = L5_2 + 4
  end
  L3_2 = L2_2
  L4_2 = A0_2
  return L3_2, L4_2
end

L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L2_1 ~= L3_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 68 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if 1048576 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = headerpage
L5_1 = 1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = headerpage
L6_1 = 41
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = headerpage
L7_1 = 45
L5_1 = L5_1(L6_1, L7_1)
if L5_1 <= 0 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if 300 < L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = 68
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
if 0 < L4_1 then
  L7_1 = 1
  L8_1 = L4_1
  L9_1 = 1
  for L10_1 = L7_1, L8_1, L9_1 do
    L11_1 = L0_1
    L12_1 = false
    L13_1 = L6_1
    L14_1 = L2_1
    L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
    L6_1 = L12_1
    L10_1 = L11_1
  end
end
L7_1 = {}
L7_1["mssense.exe"] = true
L7_1["msmpeng.exe"] = true
L7_1["wdfilter.sys"] = true
L7_1["wdnisdrv.sys"] = true
L7_1["mssecflt.sys"] = true
L7_1["msseccore.sys"] = true
L7_1["mssecwfp.sys"] = true
L7_1["mpcoredefenderservice.exe"] = true
L7_1["senseir.exe"] = true
L8_1 = false
L9_1 = {}
L10_1 = 1
L11_1 = L5_1
L12_1 = 1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = L6_1 + 4
  if L2_1 >= L14_1 then
    L14_1 = mp
    L14_1 = L14_1.readu_u32
    L15_1 = mp
    L15_1 = L15_1.readfile
    L16_1 = L6_1
    L17_1 = 4
    L15_1 = L15_1(L16_1, L17_1)
    L16_1 = 1
    L14_1 = L14_1(L15_1, L16_1)
    L6_1 = L6_1 + 4
    L15_1 = ""
    L16_1 = L1_1
    L17_1 = L6_1
    L18_1 = L2_1
    L16_1, L17_1 = L16_1(L17_1, L18_1)
    L6_1 = L17_1
    L15_1 = L16_1
    if L14_1 == 0 then
      L16_1 = string
      L16_1 = L16_1.lower
      L17_1 = L15_1
      L16_1 = L16_1(L17_1)
      L16_1 = L7_1[L16_1]
      if L16_1 then
        L16_1 = mp
        L16_1 = L16_1.set_mpattribute
        L17_1 = string
        L17_1 = L17_1.format
        L18_1 = "MpInternal_researchdata=MDEFileDenied=%s"
        L19_1 = MpCommon
        L19_1 = L19_1.Base64Encode
        L20_1 = L15_1
        L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L19_1(L20_1)
        L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
        L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
        L16_1 = mp
        L16_1 = L16_1.INFECTED
        return L16_1
      end
    end
    L6_1 = L6_1 + 8
    L16_1 = ""
    L17_1 = L0_1
    L18_1 = true
    L19_1 = L6_1
    L20_1 = L2_1
    L17_1, L18_1 = L17_1(L18_1, L19_1, L20_1)
    L6_1 = L18_1
    L16_1 = L17_1
    if L14_1 == 0 and L15_1 == "" and L16_1 == "" then
      L8_1 = true
      L9_1[L13_1] = true
    end
  end
end
if L8_1 == false or L3_1 ~= 7 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = 0
L6_1 = 68
L11_1 = L2_1 - 68
if L11_1 < 4000 then
  L10_1 = L2_1 - 68
else
  L10_1 = 4000
  L6_1 = L2_1 - 4000
end
L11_1 = mp
L11_1 = L11_1.readfile
L12_1 = L6_1
L13_1 = L10_1
L11_1 = L11_1(L12_1, L13_1)
if L11_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = "\006%z%z%z"
L13_1 = "."
L14_1 = L13_1
L13_1 = L13_1.rep
L15_1 = 36
L13_1 = L13_1(L14_1, L15_1)
L14_1 = "\a%z%z%z"
L12_1 = L12_1 .. L13_1 .. L14_1
L14_1 = L11_1
L13_1 = L11_1.find
L15_1 = L12_1
L13_1 = L13_1(L14_1, L15_1)
if L13_1 == nil then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = {}
L14_1["c:\\programdata\\microsoft\\windows defender"] = true
L14_1["c:\\programdata\\microsoft\\windows defender advanced threat protection"] = true
L14_1["c:\\program files\\windows defender advanced threat protection"] = true
L14_1["c:\\program files (x86)\\windows defender advanced threat protection"] = true
L14_1["c:\\program files\\windows defender"] = true
L14_1["c:\\program files (x86)\\windows defender"] = true
L14_1["c:\\windows\\*"] = true
L14_1["c:\\program files\\*"] = true
L14_1["c:\\program files (x86)\\*"] = true
L15_1 = 1
L16_1 = L13_1 + 44
while true do
  L17_1 = L16_1 + 4
  if not (L2_1 >= L17_1 and L5_1 >= L15_1) then
    break
  end
  L17_1 = mp
  L17_1 = L17_1.readu_u32
  L18_1 = L11_1
  L19_1 = L16_1
  L17_1 = L17_1(L18_1, L19_1)
  L16_1 = L16_1 + 4
  L18_1 = ""
  L19_1 = mp
  L19_1 = L19_1.bitand
  L20_1 = L17_1 % 4
  L20_1 = 4 - L20_1
  L21_1 = 3
  L19_1 = L19_1(L20_1, L21_1)
  L20_1 = L16_1
  L21_1 = L20_1 + L17_1
  if L2_1 >= L21_1 then
    L21_1 = L16_1
    L22_1 = L20_1 + L17_1
    L23_1 = 2
    for L24_1 = L21_1, L22_1, L23_1 do
      L25_1 = mp
      L25_1 = L25_1.readu_u16
      L26_1 = L11_1
      L27_1 = L24_1
      L25_1 = L25_1(L26_1, L27_1)
      if L25_1 ~= 0 then
        L26_1 = L18_1
        L27_1 = string
        L27_1 = L27_1.char
        L28_1 = L25_1
        L27_1 = L27_1(L28_1)
        L18_1 = L26_1 .. L27_1
        L16_1 = L16_1 + 2
      end
    end
    L21_1 = L16_1 + L19_1
    L16_1 = L21_1 + 4
    L21_1 = string
    L21_1 = L21_1.lower
    L22_1 = L18_1
    L21_1 = L21_1(L22_1)
    L21_1 = L14_1[L21_1]
    if L21_1 then
      L21_1 = L9_1[L15_1]
      if L21_1 then
        L21_1 = MpCommon
        L21_1 = L21_1.NormalizeString
        L22_1 = L18_1
        L23_1 = "CmdLineNormalizationStandard"
        L21_1 = L21_1(L22_1, L23_1)
        L22_1 = mp
        L22_1 = L22_1.set_mpattribute
        L23_1 = string
        L23_1 = L23_1.format
        L24_1 = "MpInternal_researchdata=MDEPathDenied=%s"
        L25_1 = MpCommon
        L25_1 = L25_1.Base64Encode
        L26_1 = L21_1
        L25_1, L26_1, L27_1, L28_1 = L25_1(L26_1)
        L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L23_1(L24_1, L25_1, L26_1, L27_1, L28_1)
        L22_1(L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
        L22_1 = mp
        L22_1 = L22_1.changedetectionname
        L23_1 = 805306763
        L22_1(L23_1)
        L22_1 = mp
        L22_1 = L22_1.INFECTED
        return L22_1
      end
    end
  end
  L15_1 = L15_1 + 1
end
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
