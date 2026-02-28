local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1

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
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = {}
L4_1 = "SecurityPackStartup.exe"
L5_1 = "pg_basebackup.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "Windows\\System32\\CodeIntegrity\\SiPolicy.p7b"
L4_1[1] = L5_1
L5_1 = mp
L5_1 = L5_1.getfilename
L5_1 = L5_1()
if L5_1 then
  L6_1 = contains
  L7_1 = L5_1
  L8_1 = L4_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.getfilesize
L6_1 = L6_1()
if L6_1 < 68 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if 1048576 < L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = headerpage
L9_1 = 1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = headerpage
L10_1 = 41
L8_1 = L8_1(L9_1, L10_1)
L9_1 = mp
L9_1 = L9_1.readu_u32
L10_1 = headerpage
L11_1 = 45
L9_1 = L9_1(L10_1, L11_1)
if L9_1 <= 0 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if 300 < L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = 68
L11_1 = mp
L11_1 = L11_1.readprotection
L12_1 = false
L11_1(L12_1)
if 0 < L8_1 then
  L11_1 = 1
  L12_1 = L8_1
  L13_1 = 1
  for L14_1 = L11_1, L12_1, L13_1 do
    L15_1 = L0_1
    L16_1 = false
    L17_1 = L10_1
    L18_1 = L6_1
    L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1)
    L10_1 = L16_1
    L14_1 = L15_1
  end
end
L11_1 = {}
L11_1["mssense.exe"] = true
L11_1["msmpeng.exe"] = true
L11_1["wdfilter.sys"] = true
L11_1["wdnisdrv.sys"] = true
L11_1["mssecflt.sys"] = true
L11_1["msseccore.sys"] = true
L11_1["mssecwfp.sys"] = true
L11_1["mpcoredefenderservice.exe"] = true
L11_1["senseir.exe"] = true
L12_1 = false
L13_1 = {}
L14_1 = 1
L15_1 = L9_1
L16_1 = 1
for L17_1 = L14_1, L15_1, L16_1 do
  L18_1 = L10_1 + 4
  if L6_1 >= L18_1 then
    L18_1 = mp
    L18_1 = L18_1.readu_u32
    L19_1 = mp
    L19_1 = L19_1.readfile
    L20_1 = L10_1
    L21_1 = 4
    L19_1 = L19_1(L20_1, L21_1)
    L20_1 = 1
    L18_1 = L18_1(L19_1, L20_1)
    L10_1 = L10_1 + 4
    L19_1 = ""
    L20_1 = L1_1
    L21_1 = L10_1
    L22_1 = L6_1
    L20_1, L21_1 = L20_1(L21_1, L22_1)
    L10_1 = L21_1
    L19_1 = L20_1
    if L18_1 == 0 then
      L20_1 = string
      L20_1 = L20_1.lower
      L21_1 = L19_1
      L20_1 = L20_1(L21_1)
      L20_1 = L11_1[L20_1]
      if L20_1 then
        L20_1 = mp
        L20_1 = L20_1.set_mpattribute
        L21_1 = string
        L21_1 = L21_1.format
        L22_1 = "MpInternal_researchdata=MDEFileDenied=%s"
        L23_1 = MpCommon
        L23_1 = L23_1.Base64Encode
        L24_1 = L19_1
        L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1 = L23_1(L24_1)
        L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1 = L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1)
        L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1)
        L20_1 = mp
        L20_1 = L20_1.INFECTED
        return L20_1
      end
    end
    L10_1 = L10_1 + 8
    L20_1 = ""
    L21_1 = L0_1
    L22_1 = true
    L23_1 = L10_1
    L24_1 = L6_1
    L21_1, L22_1 = L21_1(L22_1, L23_1, L24_1)
    L10_1 = L22_1
    L20_1 = L21_1
    if L18_1 == 0 and L19_1 == "" and L20_1 == "" then
      L12_1 = true
      L13_1[L17_1] = true
    end
  end
end
if L12_1 == false or L7_1 ~= 7 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = 0
L10_1 = 68
L15_1 = L6_1 - 68
if L15_1 < 4000 then
  L14_1 = L6_1 - 68
else
  L14_1 = 4000
  L10_1 = L6_1 - 4000
end
L15_1 = mp
L15_1 = L15_1.readfile
L16_1 = L10_1
L17_1 = L14_1
L15_1 = L15_1(L16_1, L17_1)
if L15_1 == nil then
  L16_1 = mp
  L16_1 = L16_1.CLEAN
  return L16_1
end
L16_1 = "\006%z%z%z"
L17_1 = "."
L18_1 = L17_1
L17_1 = L17_1.rep
L19_1 = 36
L17_1 = L17_1(L18_1, L19_1)
L18_1 = "\a%z%z%z"
L16_1 = L16_1 .. L17_1 .. L18_1
L18_1 = L15_1
L17_1 = L15_1.find
L19_1 = L16_1
L17_1 = L17_1(L18_1, L19_1)
if L17_1 == nil then
  L18_1 = mp
  L18_1 = L18_1.CLEAN
  return L18_1
end
L18_1 = {}
L18_1["c:\\programdata\\microsoft\\windows defender"] = true
L18_1["c:\\programdata\\microsoft\\windows defender advanced threat protection"] = true
L18_1["c:\\program files\\windows defender advanced threat protection"] = true
L18_1["c:\\program files (x86)\\windows defender advanced threat protection"] = true
L18_1["c:\\program files\\windows defender"] = true
L18_1["c:\\program files (x86)\\windows defender"] = true
L18_1["c:\\windows\\*"] = true
L18_1["c:\\program files\\*"] = true
L18_1["c:\\program files (x86)\\*"] = true
L19_1 = 1
L20_1 = L17_1 + 44
while true do
  L21_1 = L20_1 + 4
  if not (L6_1 >= L21_1 and L9_1 >= L19_1) then
    break
  end
  L21_1 = mp
  L21_1 = L21_1.readu_u32
  L22_1 = L15_1
  L23_1 = L20_1
  L21_1 = L21_1(L22_1, L23_1)
  L20_1 = L20_1 + 4
  L22_1 = ""
  L23_1 = mp
  L23_1 = L23_1.bitand
  L24_1 = L21_1 % 4
  L24_1 = 4 - L24_1
  L25_1 = 3
  L23_1 = L23_1(L24_1, L25_1)
  L24_1 = L20_1
  L25_1 = L24_1 + L21_1
  if L6_1 >= L25_1 then
    L25_1 = L20_1
    L26_1 = L24_1 + L21_1
    L27_1 = 2
    for L28_1 = L25_1, L26_1, L27_1 do
      L29_1 = mp
      L29_1 = L29_1.readu_u16
      L30_1 = L15_1
      L31_1 = L28_1
      L29_1 = L29_1(L30_1, L31_1)
      if L29_1 ~= 0 then
        L30_1 = L22_1
        L31_1 = string
        L31_1 = L31_1.char
        L32_1 = L29_1
        L31_1 = L31_1(L32_1)
        L22_1 = L30_1 .. L31_1
        L20_1 = L20_1 + 2
      end
    end
    L25_1 = L20_1 + L23_1
    L20_1 = L25_1 + 4
    L25_1 = string
    L25_1 = L25_1.lower
    L26_1 = L22_1
    L25_1 = L25_1(L26_1)
    L25_1 = L18_1[L25_1]
    if L25_1 then
      L25_1 = L13_1[L19_1]
      if L25_1 then
        L25_1 = MpCommon
        L25_1 = L25_1.NormalizeString
        L26_1 = L22_1
        L27_1 = "CmdLineNormalizationStandard"
        L25_1 = L25_1(L26_1, L27_1)
        L26_1 = mp
        L26_1 = L26_1.set_mpattribute
        L27_1 = string
        L27_1 = L27_1.format
        L28_1 = "MpInternal_researchdata=MDEPathDenied=%s"
        L29_1 = MpCommon
        L29_1 = L29_1.Base64Encode
        L30_1 = L25_1
        L29_1, L30_1, L31_1, L32_1 = L29_1(L30_1)
        L27_1, L28_1, L29_1, L30_1, L31_1, L32_1 = L27_1(L28_1, L29_1, L30_1, L31_1, L32_1)
        L26_1(L27_1, L28_1, L29_1, L30_1, L31_1, L32_1)
        L26_1 = mp
        L26_1 = L26_1.changedetectionname
        L27_1 = 805306763
        L26_1(L27_1)
        L26_1 = mp
        L26_1 = L26_1.INFECTED
        return L26_1
      end
    end
  end
  L19_1 = L19_1 + 1
end
L21_1 = mp
L21_1 = L21_1.CLEAN
return L21_1
