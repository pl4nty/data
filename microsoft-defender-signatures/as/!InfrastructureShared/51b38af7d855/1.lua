local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

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
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 8) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "([^\\]+)$"
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = {}
L2_1["winword.exe"] = true
L2_1["excel.exe"] = true
L2_1["powerpnt.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = L3_1.ppid
  if L4_1 ~= nil then
    goto lbl_46
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_46::
L4_1 = L3_1.ppid
L5_1 = L3_1.command_line
L6_1 = {}
L7_1 = "cmd.exe"
L8_1 = "cmd.exe"
L9_1 = "powershell.exe"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L7_1 = checkProcessTree
L8_1 = L4_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L5_1 ~= nil then
  L8_1 = {}
  L8_1[".xls"] = true
  L8_1[".doc"] = true
  L8_1[".ppt"] = true
  L8_1[".pps"] = true
  L8_1.docx = true
  L8_1.pptx = true
  L8_1.ppsx = true
  L8_1.xlsx = true
  L8_1[".rtf"] = true
  L8_1[".xml"] = true
  L8_1.dotx = true
  L8_1.dotm = true
  L8_1[".odt"] = true
  L8_1.xlsb = true
  L8_1.xltx = true
  L8_1.xltm = true
  L8_1.xlam = true
  L8_1[".xla"] = true
  L8_1.docm = true
  L8_1.xlsm = true
  L8_1.pptm = true
  L9_1 = bm_AddRelatedFileFromCommandLine
  L10_1 = L5_1
  L11_1 = L8_1
  L9_1(L10_1, L11_1)
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
