local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 == nil then
    L1_1 = string
    L1_1 = L1_1.len
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 <= 4 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 == nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 <= 4 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
  L2_1 = {}
  L2_1["winword.exe"] = true
  L2_1["excel.exe"] = true
  L2_1["powerpnt.exe"] = true
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L0_1
  L6_1 = "([^\\]-[^\\%.]+)$"
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  if L3_1 == nil then
    L4_1 = string
    L4_1 = L4_1.len
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 <= 4 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  L4_1 = L2_1[L3_1]
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.ppid
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.ppid
    if L4_1 ~= L5_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = bm
    L6_1 = L6_1.get_process_relationships
    L7_1 = L4_1
    L6_1, L7_1 = L6_1(L7_1)
    L8_1 = #L7_1
    if L8_1 ~= 3 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = false
    L9_1 = false
    L10_1 = false
    L11_1 = {}
    L11_1["\\wscript.exe"] = true
    L11_1["\\cscript.exe"] = true
    L12_1 = ipairs
    L13_1 = L7_1
    L12_1, L13_1, L14_1 = L12_1(L13_1)
    for L15_1, L16_1 in L12_1, L13_1, L14_1 do
      L17_1 = L16_1.image_path
      L18_1 = mp
      L18_1 = L18_1.bitand
      L19_1 = L16_1.reason_ex
      L20_1 = 1
      L18_1 = L18_1(L19_1, L20_1)
      L19_1 = string
      L19_1 = L19_1.len
      L20_1 = L17_1
      L19_1 = L19_1(L20_1)
      if 8 < L19_1 then
        L19_1 = string
        L19_1 = L19_1.sub
        L20_1 = L17_1
        L21_1 = -8
        L19_1 = L19_1(L20_1, L21_1)
        if L19_1 == "\\cmd.exe" and L18_1 == 1 then
          L8_1 = true
        end
      end
      L19_1 = string
      L19_1 = L19_1.len
      L20_1 = L17_1
      L19_1 = L19_1(L20_1)
      if 12 < L19_1 then
        L19_1 = string
        L19_1 = L19_1.sub
        L20_1 = L17_1
        L21_1 = -12
        L19_1 = L19_1(L20_1, L21_1)
        L19_1 = L11_1[L19_1]
        if L19_1 and L18_1 ~= 1 then
          L9_1 = true
        end
      end
      L19_1 = string
      L19_1 = L19_1.len
      L20_1 = L17_1
      L19_1 = L19_1(L20_1)
      if 15 < L19_1 then
        L19_1 = string
        L19_1 = L19_1.sub
        L20_1 = L17_1
        L21_1 = -15
        L19_1 = L19_1(L20_1, L21_1)
        if L19_1 == "\\powershell.exe" and L18_1 ~= 1 then
          L10_1 = true
        end
      end
    end
    if L8_1 == false or L9_1 == false or L10_1 == false then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
    L12_1 = this_sigattrlog
    L12_1 = L12_1[4]
    L12_1 = L12_1.ppid
    L13_1 = this_sigattrlog
    L13_1 = L13_1[5]
    L13_1 = L13_1.ppid
    L14_1 = bm
    L14_1 = L14_1.get_process_relationships
    L15_1 = L12_1
    L14_1, L15_1 = L14_1(L15_1)
    L16_1 = #L15_1
    if L16_1 ~= 1 then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = L15_1[1]
    L16_1 = L16_1.ppid
    if L16_1 ~= L13_1 then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = {}
    L16_1[".xls"] = true
    L16_1[".doc"] = true
    L16_1[".ppt"] = true
    L16_1[".pps"] = true
    L16_1.docx = true
    L16_1.pptx = true
    L16_1.ppsx = true
    L16_1.xlsx = true
    L16_1[".rtf"] = true
    L16_1[".xml"] = true
    L16_1.dotx = true
    L16_1.dotm = true
    L16_1[".odt"] = true
    L16_1.xlsb = true
    L16_1.xltx = true
    L16_1.xltm = true
    L16_1.xlam = true
    L16_1[".xla"] = true
    L16_1.docm = true
    L16_1.xlsm = true
    L16_1.pptm = true
    L17_1 = bm_AddRelatedFileFromCommandLine
    L18_1 = L1_1
    L19_1 = L16_1
    L17_1(L18_1, L19_1)
    L17_1 = {}
    L17_1[".js"] = true
    L17_1.vbs = true
    L17_1.wsf = true
    L17_1.jse = true
    L17_1.vbe = true
    L18_1 = this_sigattrlog
    L18_1 = L18_1[3]
    L18_1 = L18_1.utf8p2
    L19_1 = bm_AddRelatedFileFromCommandLine
    L20_1 = L18_1
    L21_1 = L17_1
    L22_1 = 3
    L19_1(L20_1, L21_1, L22_1)
    L19_1 = mp
    L19_1 = L19_1.INFECTED
    return L19_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
