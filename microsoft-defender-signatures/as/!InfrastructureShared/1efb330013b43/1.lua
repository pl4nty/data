local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L1_1 = 0
L2_1 = nil
L3_1 = {}
L4_1 = 0

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "(%.[^%.]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L2_2
  if L1_2 ~= nil and L1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = L1_2
    L4_2 = "/"
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if L2_2 == nil then
      L2_2 = GetExtensionClassEx
      L3_2 = L1_2
      L4_2 = true
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 == 0 then
        L2_2 = IsExtensionDatePattern
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        if L2_2 == false then
          L2_2 = L3_1
          L2_2 = L2_2[L1_2]
          if L2_2 ~= nil then
            L2_2 = IsStringInTable
            L3_2 = L3_1
            L3_2 = L3_2[L1_2]
            L4_2 = A0_2
            L2_2 = L2_2(L3_2, L4_2)
            if not L2_2 then
              L2_2 = table
              L2_2 = L2_2.insert
              L3_2 = L3_1
              L3_2 = L3_2[L1_2]
              L4_2 = A0_2
              L2_2(L3_2, L4_2)
            end
          else
            L2_2 = L3_1
            L3_2 = {}
            L4_2 = A0_2
            L3_2[1] = L4_2
            L2_2[L1_2] = L3_2
            L2_2 = L4_1
            L2_2 = L2_2 + 1
            L4_1 = L2_2
          end
        end
      end
    end
  end
end

addExtensionToList = L5_1
L5_1 = bm
L5_1 = L5_1.GetSignatureMatchDuration
L5_1 = L5_1()
if 100000000 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1 = L5_1()
L6_1 = L5_1
L5_1 = L5_1.lower
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = IsExcludedByImagePath
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[7]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[7]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[7]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[8]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[8]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[8]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[8]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[9]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[9]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[9]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[9]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[10]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[10]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[10]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[10]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[11]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[11]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[11]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[11]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[12]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[12]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[12]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[12]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[13]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[13]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[13]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[13]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[14]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[14]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[14]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[14]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[15]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[15]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[15]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[15]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[16]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[16]
  L6_1 = L6_1.wp1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[16]
    L6_1 = L6_1.wp2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[16]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
      L6_1 = addExtensionToList
      L7_1 = L2_1
      L6_1(L7_1)
      L2_1 = nil
    end
  end
end
if 3 < L4_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = pairs
L7_1 = L3_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  if L0_1 ~= nil then
    L11_1 = #L10_1
    if not (L1_1 < L11_1) then
      goto lbl_308
    end
  end
  L0_1 = L9_1
  L1_1 = #L10_1
  ::lbl_308::
end
if L1_1 < 8 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.get_current_process_startup_info
L6_1 = L6_1()
if L6_1 ~= nil then
  L6_1 = L6_1.ppid
else
  L6_1 = "-1"
end
L7_1 = IsExcludedByImagePathFileExtension
L8_1 = L5_1
L9_1 = L0_1
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = IsExcludedByImagePathFileExtensionRegEx
  L8_1 = L5_1
  L9_1 = L0_1
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = isParentPackageManager
    L8_1 = L6_1
    L9_1 = true
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      goto lbl_344
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_344::
L7_1 = bm
L7_1 = L7_1.add_related_string
L8_1 = "ransom_extension"
L9_1 = L0_1
L10_1 = bm
L10_1 = L10_1.RelatedStringBMReport
L7_1(L8_1, L9_1, L10_1)
L7_1 = "gene_linux_ransom_meta"
L8_1 = {}
L9_1 = AppendToRollingQueue
L10_1 = L7_1
L11_1 = "cur_image_path"
L12_1 = L5_1
L9_1(L10_1, L11_1, L12_1)
L9_1 = AppendToRollingQueue
L10_1 = L7_1
L11_1 = "proc_info"
L12_1 = L6_1
L9_1(L10_1, L11_1, L12_1)
L9_1 = AppendToRollingQueue
L10_1 = L7_1
L11_1 = "appended_ext"
L12_1 = L0_1
L9_1(L10_1, L11_1, L12_1)
L9_1 = pairs
L10_1 = L3_1[L0_1]
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = bm
  L14_1 = L14_1.add_related_file
  L15_1 = L13_1
  L14_1(L15_1)
  L14_1 = table
  L14_1 = L14_1.insert
  L15_1 = L8_1
  L16_1 = L13_1
  L14_1(L15_1, L16_1)
end
L9_1 = AppendToRollingQueue
L10_1 = L7_1
L11_1 = "renamed_file_path"
L12_1 = table
L12_1 = L12_1.concat
L13_1 = L8_1
L14_1 = ","
L12_1, L13_1, L14_1, L15_1, L16_1 = L12_1(L13_1, L14_1)
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L9_1 = addRelatedProcess
L9_1()
L9_1 = reportRelatedBmHits
L9_1()
L9_1 = bm
L9_1 = L9_1.trigger_sig
L10_1 = "GenericLinuxRansomware"
L11_1 = "Type6"
L9_1(L10_1, L11_1)
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
