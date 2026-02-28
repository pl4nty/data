local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = MpCommon
L2_1 = L2_1.DecodeAsn1
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 2
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = #L1_2
    L6_2 = L6_2 + 1
    L7_2 = string
    L7_2 = L7_2.char
    L8_2 = tonumber
    L10_2 = A0_2
    L9_2 = A0_2.sub
    L11_2 = L5_2
    L12_2 = L5_2 + 1
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = 16
    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L1_2[L6_2] = L7_2
  end
  L2_2 = table
  L2_2 = L2_2.concat
  L3_2 = L1_2
  return L2_2(L3_2)
end

function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = ""
  L5_2 = A2_2 + 8
  if A3_2 > L5_2 then
    L5_2 = A2_2 + 1
    L6_2 = L3_1
    L7_2 = string
    L7_2 = L7_2.sub
    L8_2 = A0_2
    L9_2 = L5_2
    L10_2 = L5_2 + 8
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L7_2 = mp
    L7_2 = L7_2.readu_u32
    L8_2 = L6_2
    L9_2 = 1
    L7_2 = L7_2(L8_2, L9_2)
    A2_2 = A2_2 + 8
    if not (0 < L7_2) then
      L8_2 = ""
      L9_2 = A2_2
      return L8_2, L9_2
    end
    L8_2 = mp
    L8_2 = L8_2.bitand
    L9_2 = L7_2 % 4
    L9_2 = 4 - L9_2
    L10_2 = 3
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = L7_2 * 2
    L9_2 = A2_2 + L9_2
    if A3_2 > L9_2 then
      if A1_2 then
        L5_2 = A2_2 + 1
        L9_2 = L3_1
        L10_2 = string
        L10_2 = L10_2.sub
        L11_2 = A0_2
        L12_2 = L5_2
        L13_2 = L7_2 * 2
        L13_2 = L5_2 + L13_2
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L4_2 = L9_2
        if L4_2 == nil then
          L4_2 = ""
        end
      end
      L9_2 = L7_2 + L8_2
      L9_2 = L9_2 * 2
      A2_2 = A2_2 + L9_2
    end
  end
  L5_2 = L4_2
  L6_2 = A2_2
  return L5_2, L6_2
end

function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = ""
  L4_2 = A1_2 + 8
  if A2_2 > L4_2 then
    L4_2 = A1_2 + 1
    L5_2 = L3_1
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = L4_2
    L9_2 = L4_2 + 8
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = mp
    L6_2 = L6_2.readu_u32
    L7_2 = L5_2
    L8_2 = 1
    L6_2 = L6_2(L7_2, L8_2)
    A1_2 = A1_2 + 8
    if not (0 < L6_2) then
      A1_2 = A1_2 + 8
      L7_2 = ""
      L8_2 = A1_2
      return L7_2, L8_2
    end
    L7_2 = mp
    L7_2 = L7_2.bitand
    L8_2 = L6_2 % 4
    L8_2 = 4 - L8_2
    L9_2 = 3
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = L6_2 * 2
    L8_2 = A1_2 + L8_2
    if A2_2 > L8_2 then
      L4_2 = A1_2 + 1
      L8_2 = L3_1
      L9_2 = string
      L9_2 = L9_2.sub
      L10_2 = A0_2
      L11_2 = L4_2
      L12_2 = L6_2 * 2
      L12_2 = L4_2 + L12_2
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      L3_2 = L8_2
      L8_2 = L6_2 * 2
      A1_2 = A1_2 + L8_2
      if L3_2 ~= nil then
        L8_2 = string
        L8_2 = L8_2.gsub
        L9_2 = L3_2
        L10_2 = "%z"
        L11_2 = ""
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L3_2 = L8_2
      end
    end
    L8_2 = L7_2 + 4
    L8_2 = L8_2 * 2
    A1_2 = A1_2 + L8_2
  end
  L4_2 = L3_2
  L5_2 = A1_2
  return L4_2, L5_2
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L1_2 = string
  L1_2 = L1_2.len
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L3_1
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = A0_2
  L5_2 = 1
  L6_2 = 9
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L3_2 = mp
  L3_2 = L3_2.readu_u32
  L4_2 = L2_2
  L5_2 = 1
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 81
  L5_2 = L3_1
  L6_2 = string
  L6_2 = L6_2.sub
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = L4_2 + 8
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L6_2 = mp
  L6_2 = L6_2.readu_u32
  L7_2 = L5_2
  L8_2 = 1
  L6_2 = L6_2(L7_2, L8_2)
  L4_2 = 89
  L7_2 = L3_1
  L8_2 = string
  L8_2 = L8_2.sub
  L9_2 = A0_2
  L10_2 = L4_2
  L11_2 = L4_2 + 8
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L5_2 = L7_2
  L7_2 = mp
  L7_2 = L7_2.readu_u32
  L8_2 = L5_2
  L9_2 = 1
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 == 0 then
    L8_2 = false
    return L8_2
  end
  if 300 < L7_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = 136
  if 0 < L6_2 then
    L9_2 = 1
    L10_2 = L6_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = pcall
      L14_2 = L4_1
      L15_2 = A0_2
      L16_2 = false
      L17_2 = L8_2
      L18_2 = L1_2
      L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
      L8_2 = L15_2
      L12_2 = L14_2
      L12_2 = L13_2
    end
  end
  L9_2 = {}
  L9_2["mssense.exe"] = true
  L9_2["msmpeng.exe"] = true
  L9_2["wdfilter.sys"] = true
  L9_2["wdnisdrv.sys"] = true
  L9_2["mssecflt.sys"] = true
  L9_2["msseccore.sys"] = true
  L9_2["mssecwfp.sys"] = true
  L9_2["mpcoredefenderservice.exe"] = true
  L9_2["senseir.exe"] = true
  L10_2 = {}
  L11_2 = 1
  L12_2 = L7_2
  L13_2 = 1
  for L14_2 = L11_2, L12_2, L13_2 do
    L15_2 = L8_2 + 8
    if L1_2 >= L15_2 then
      L4_2 = L8_2 + 1
      L15_2 = L3_1
      L16_2 = string
      L16_2 = L16_2.sub
      L17_2 = A0_2
      L18_2 = L4_2
      L19_2 = L4_2 + 8
      L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L16_2(L17_2, L18_2, L19_2)
      L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L5_2 = L15_2
      L15_2 = mp
      L15_2 = L15_2.readu_u32
      L16_2 = L5_2
      L17_2 = 1
      L15_2 = L15_2(L16_2, L17_2)
      L8_2 = L8_2 + 8
      L16_2 = ""
      L17_2 = pcall
      L18_2 = L5_1
      L19_2 = A0_2
      L20_2 = L8_2
      L21_2 = L1_2
      L17_2, L18_2, L19_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
      L8_2 = L19_2
      L16_2 = L18_2
      _ = L17_2
      if L15_2 == 0 then
        L17_2 = string
        L17_2 = L17_2.lower
        L18_2 = L16_2
        L17_2 = L17_2(L18_2)
        L17_2 = L9_2[L17_2]
        if L17_2 then
          L17_2 = mp
          L17_2 = L17_2.set_mpattribute
          L18_2 = string
          L18_2 = L18_2.format
          L19_2 = "MpInternal_researchdata=MDEFileDenied=%s"
          L20_2 = MpCommon
          L20_2 = L20_2.Base64Encode
          L21_2 = L16_2
          L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L20_2(L21_2)
          L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
          L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
          L17_2 = true
          L18_2 = "file"
          return L17_2, L18_2
        end
      end
      L8_2 = L8_2 + 16
      L17_2 = ""
      L18_2 = pcall
      L19_2 = L4_1
      L20_2 = A0_2
      L21_2 = true
      L22_2 = L8_2
      L23_2 = L1_2
      L18_2, L19_2, L20_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
      L8_2 = L20_2
      L17_2 = L19_2
      _ = L18_2
      L18_2 = #L17_2
      if 0 < L18_2 then
        L18_2 = ""
        L19_2 = 1
        L20_2 = #L17_2
        L21_2 = 1
        for L22_2 = L19_2, L20_2, L21_2 do
          L23_2 = string
          L23_2 = L23_2.byte
          L24_2 = L17_2
          L25_2 = L22_2
          L23_2 = L23_2(L24_2, L25_2)
          L24_2 = L18_2
          L25_2 = string
          L25_2 = L25_2.format
          L26_2 = "%02X "
          L27_2 = L23_2
          L25_2 = L25_2(L26_2, L27_2)
          L18_2 = L24_2 .. L25_2
        end
      end
      if L15_2 == 0 and L16_2 == "" and L17_2 == "" then
        L10_2[L14_2] = true
      end
    end
  end
  if L3_2 == 7 then
    L11_2 = next
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      goto lbl_190
    end
  end
  L11_2 = false
  do return L11_2 end
  ::lbl_190::
  L11_2 = 0
  L8_2 = 136
  L12_2 = L1_2 - 136
  if L12_2 < 8000 then
    L11_2 = L1_2 - 136
  else
    L11_2 = 8000
    L8_2 = L1_2 - 8000
  end
  L4_2 = L8_2 + 1
  L12_2 = L3_1
  L13_2 = string
  L13_2 = L13_2.sub
  L14_2 = A0_2
  L15_2 = L4_2
  L16_2 = L4_2 + L11_2
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L13_2(L14_2, L15_2, L16_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  if L12_2 == nil then
    L13_2 = mp
    L13_2 = L13_2.CLEAN
    return L13_2
  end
  L13_2 = "\006%z%z%z"
  L14_2 = "."
  L15_2 = L14_2
  L14_2 = L14_2.rep
  L16_2 = 36
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = "\a%z%z%z"
  L13_2 = L13_2 .. L14_2 .. L15_2
  L15_2 = L12_2
  L14_2 = L12_2.find
  L16_2 = L13_2
  L14_2 = L14_2(L15_2, L16_2)
  if L14_2 == nil then
    L15_2 = false
    return L15_2
  end
  L15_2 = {}
  L15_2["c:\\programdata\\microsoft\\windows defender"] = true
  L15_2["c:\\programdata\\microsoft\\windows defender advanced threat protection"] = true
  L15_2["c:\\program files\\windows defender advanced threat protection"] = true
  L15_2["c:\\program files (x86)\\windows defender advanced threat protection"] = true
  L15_2["c:\\program files\\windows defender"] = true
  L15_2["c:\\program files (x86)\\windows defender"] = true
  L15_2["c:\\windows\\*"] = true
  L15_2["c:\\program files\\*"] = true
  L15_2["c:\\program files (x86)\\*"] = true
  L16_2 = 1
  L17_2 = L14_2 + 44
  while true do
    L18_2 = L17_2 + 4
    if not (L1_2 >= L18_2 and L7_2 >= L16_2) then
      break
    end
    L18_2 = mp
    L18_2 = L18_2.readu_u32
    L19_2 = L12_2
    L20_2 = L17_2
    L18_2 = L18_2(L19_2, L20_2)
    L17_2 = L17_2 + 4
    L19_2 = ""
    L20_2 = mp
    L20_2 = L20_2.bitand
    L21_2 = L18_2 % 4
    L21_2 = 4 - L21_2
    L22_2 = 3
    L20_2 = L20_2(L21_2, L22_2)
    L21_2 = L17_2
    L22_2 = L21_2 + L18_2
    if L1_2 >= L22_2 then
      L22_2 = L17_2
      L23_2 = L21_2 + L18_2
      L24_2 = 2
      for L25_2 = L22_2, L23_2, L24_2 do
        L26_2 = mp
        L26_2 = L26_2.readu_u16
        L27_2 = L12_2
        L28_2 = L25_2
        L26_2 = L26_2(L27_2, L28_2)
        if L26_2 ~= 0 then
          L27_2 = L19_2
          L28_2 = string
          L28_2 = L28_2.char
          L29_2 = L26_2
          L28_2 = L28_2(L29_2)
          L19_2 = L27_2 .. L28_2
          L17_2 = L17_2 + 2
        end
      end
      L22_2 = L17_2 + L20_2
      L17_2 = L22_2 + 4
      L22_2 = string
      L22_2 = L22_2.lower
      L23_2 = L19_2
      L22_2 = L22_2(L23_2)
      L22_2 = L15_2[L22_2]
      if L22_2 then
        L22_2 = L10_2[L16_2]
        if L22_2 then
          L22_2 = MpCommon
          L22_2 = L22_2.NormalizeString
          L23_2 = L19_2
          L24_2 = "CmdLineNormalizationStandard"
          L22_2 = L22_2(L23_2, L24_2)
          L23_2 = mp
          L23_2 = L23_2.set_mpattribute
          L24_2 = string
          L24_2 = L24_2.format
          L25_2 = "MpInternal_researchdata=MDEPathDenied=%s"
          L26_2 = MpCommon
          L26_2 = L26_2.Base64Encode
          L27_2 = L22_2
          L26_2, L27_2, L28_2, L29_2 = L26_2(L27_2)
          L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L24_2(L25_2, L26_2, L27_2, L28_2, L29_2)
          L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
          L23_2 = true
          L24_2 = "path"
          return L23_2, L24_2
        end
      end
    end
    L16_2 = L16_2 + 1
  end
  L18_2 = false
  return L18_2
end

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2.Type
  if L1_2 == "OCTET STRING" then
    L1_2 = string
    L1_2 = L1_2.sub
    L2_2 = A0_2.Value
    L3_2 = 1
    L4_2 = 8
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    if L1_2 == "07000000" or L1_2 == "06000000" or L1_2 == "05000000" or L1_2 == "04000000" or L1_2 == "03000000" or L1_2 == "02000000" or L1_2 == "01000000" then
      L2_2 = L6_1
      L3_2 = A0_2.Value
      return L2_2(L3_2)
    end
  end
  L1_2 = A0_2.Children
  if L1_2 then
    L1_2 = ipairs
    L2_2 = A0_2.Children
    L1_2, L2_2, L3_2 = L1_2(L2_2)
    for L4_2, L5_2 in L1_2, L2_2, L3_2 do
      L6_2 = L7_1
      L7_2 = L5_2
      L6_2, L7_2 = L6_2(L7_2)
      if L6_2 then
        L8_2 = true
        L9_2 = L7_2
        return L8_2, L9_2
      end
    end
  end
  L1_2 = false
  return L1_2
end

L8_1 = ipairs
L9_1 = L2_1.Children
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = L7_1
  L14_1 = L12_1
  L13_1, L14_1 = L13_1(L14_1)
  if L13_1 then
    if L14_1 and L14_1 == "file" then
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    else
      L15_1 = mp
      L15_1 = L15_1.changedetectionname
      L16_1 = 805306764
      L15_1(L16_1)
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
