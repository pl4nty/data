local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = true
  L3_2 = 0
  if A1_2 == nil then
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if not (0 < L4_2) then
      goto lbl_21
    end
  end
  L2_2 = false
  L4_2 = string
  L4_2 = L4_2.len
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_21::
  L4_2 = bm
  L4_2 = L4_2.get_process_relationships
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  if L5_2 ~= nil then
    L6_2 = #L5_2
    if not (L6_2 < 1) then
      L6_2 = #L5_2
      if not (4 < L6_2) then
        goto lbl_35
      end
    end
  end
  L6_2 = nil
  do return L6_2 end
  ::lbl_35::
  L6_2 = nil
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = mp
    L12_2 = L12_2.bitand
    L13_2 = L11_2.reason_ex
    L14_2 = 1
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 == 1 then
      if L2_2 ~= true then
        L13_2 = string
        L13_2 = L13_2.len
        L14_2 = L11_2.image_path
        L13_2 = L13_2(L14_2)
        if not (L3_2 < L13_2) then
          goto lbl_64
        end
        L13_2 = string
        L13_2 = L13_2.sub
        L14_2 = L11_2.image_path
        L15_2 = -L3_2
        L13_2 = L13_2(L14_2, L15_2)
        if L13_2 ~= A1_2 then
          goto lbl_64
        end
      end
      L6_2 = L11_2.ppid
      break
    end
    ::lbl_64::
  end
  return L6_2
end

getFirstChildPpid = L0_1
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
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = getFirstChildPpid
L3_1 = L0_1
L4_1 = "\\cmd.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = getFirstChildPpid
L4_1 = L2_1
L5_1 = "\\bitsadmin.exe"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.ppid
if L3_1 ~= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L5_1[".xls"] = true
L5_1[".doc"] = true
L5_1[".ppt"] = true
L5_1[".pps"] = true
L5_1.docx = true
L5_1.pptx = true
L5_1.ppsx = true
L5_1.xlsx = true
L5_1[".rtf"] = true
L5_1[".xml"] = true
L5_1.dotx = true
L5_1.dotm = true
L5_1[".odt"] = true
L5_1.xlsb = true
L5_1.xltx = true
L5_1.xltm = true
L5_1.xlam = true
L5_1[".xla"] = true
L5_1.docm = true
L5_1.xlsm = true
L5_1.pptm = true
L6_1 = bm_AddRelatedFileFromCommandLine
L7_1 = L1_1
L8_1 = L5_1
L6_1(L7_1, L8_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
