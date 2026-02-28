local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 ~= nil and A1_2 ~= nil then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = A0_2
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = 0
    L10_2 = bm
    L10_2 = L10_2.get_process_relationships
    L11_2 = L2_2
    L10_2, L11_2 = L10_2(L11_2)
    L12_2 = ipairs
    L13_2 = L11_2
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2, L16_2 in L12_2, L13_2, L14_2 do
      L17_2 = mp
      L17_2 = L17_2.bitand
      L18_2 = L16_2.reason_ex
      L19_2 = 1
      L17_2 = L17_2(L18_2, L19_2)
      if L17_2 == 1 then
        L17_2 = string
        L17_2 = L17_2.sub
        L18_2 = L16_2.image_path
        L19_2 = string
        L19_2 = L19_2.len
        L20_2 = L8_2
        L19_2 = L19_2(L20_2)
        L19_2 = -L19_2
        L17_2 = L17_2(L18_2, L19_2)
        if L17_2 == L8_2 then
          L2_2 = L16_2.ppid
          L9_2 = L9_2 + 1
        end
      end
      if 1 < L9_2 then
        L17_2 = nil
        return L17_2
      end
    end
    if L9_2 == 0 then
      L12_2 = nil
      return L12_2
    end
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L3_2
    L14_2 = L2_2
    L12_2(L13_2, L14_2)
  end
  return L3_2
end

checkProcessTree = L0_1
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.ppid
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.ppid
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L1_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L0_1 = L2_1.ppid
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L1_1 = L2_1.utf8p2
      end
    end
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "cmd.exe"
L4_1 = "powershell.exe"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = checkProcessTree
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L1_1 ~= nil then
  L4_1 = {}
  L4_1[".xls"] = true
  L4_1[".doc"] = true
  L4_1[".ppt"] = true
  L4_1[".pps"] = true
  L4_1.docx = true
  L4_1.pptx = true
  L4_1.ppsx = true
  L4_1.xlsx = true
  L4_1[".rtf"] = true
  L4_1[".xml"] = true
  L4_1.dotx = true
  L4_1.dotm = true
  L4_1[".odt"] = true
  L4_1.xlsb = true
  L4_1.xltx = true
  L4_1.xltm = true
  L4_1.xlam = true
  L4_1[".xla"] = true
  L4_1.docm = true
  L4_1.xlsm = true
  L4_1.pptm = true
  L5_1 = bm_AddRelatedFileFromCommandLine
  L6_1 = L1_1
  L7_1 = L4_1
  L5_1(L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
