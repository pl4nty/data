local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L1_1 = false
L2_1 = false
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L0_1 = L3_1.utf8p2
    L1_1 = true
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L0_1 = L3_1.utf8p2
      L2_1 = true
    end
  end
end
if not L0_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = safeJsonDeserialize
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.appended_ext
if not L4_1 then
  L4_1 = nil
end
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = StringStartsWith
L6_1 = L4_1
L7_1 = "."
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not (L5_1 < 4) then
  L5_1 = IsExtensionDatePattern
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 ~= true then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L4_1
    L7_1 = "%d+.%d+.%d+"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = L4_1
      L7_1 = "%.%w+%.%w+$"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        goto lbl_96
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_96::
L5_1 = mp
L5_1 = L5_1.bitand
L6_1 = mp
L6_1 = L6_1.GetExtensionClass
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L7_1 = 3
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.SIGATTR_LOG_SZ
L6_1 = {}
L7_1 = {}
L8_1 = 1
L9_1 = L5_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  if L2_1 then
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    if L12_1 then
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.attribute
      if L12_1 == 16385 then
        L12_1 = sigattr_tail
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.utf8p1
        L13_1 = L12_1
        L12_1 = L12_1.lower
        L12_1 = L12_1(L13_1)
        L13_1 = StringEndsWith
        L14_1 = L12_1
        L15_1 = L4_1
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 then
          L13_1 = table
          L13_1 = L13_1.insert
          L14_1 = L6_1
          L15_1 = L12_1
          L13_1(L14_1, L15_1)
        end
      end
    end
    L12_1 = sigattr_head
    L12_1 = L12_1[L11_1]
    if L12_1 then
      L12_1 = sigattr_head
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.attribute
      if L12_1 == 16385 then
        L12_1 = sigattr_head
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.utf8p1
        L13_1 = L12_1
        L12_1 = L12_1.lower
        L12_1 = L12_1(L13_1)
        L13_1 = StringEndsWith
        L14_1 = L12_1
        L15_1 = L4_1
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 then
          L13_1 = table
          L13_1 = L13_1.insert
          L14_1 = L6_1
          L15_1 = L12_1
          L13_1(L14_1, L15_1)
        end
      end
    end
  end
  if L1_1 then
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    if L12_1 then
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.attribute
    end
    if L12_1 == 16389 then
      L13_1 = sigattr_tail
      L13_1 = L13_1[L11_1]
      L13_1 = L13_1.utf8p2
      if L13_1 == "ATTR_c09458eb" then
        L13_1 = sigattr_tail
        L13_1 = L13_1[L11_1]
        L13_1 = L13_1.utf8p1
        L14_1 = L13_1
        L13_1 = L13_1.lower
        L13_1 = L13_1(L14_1)
        L14_1 = StringEndsWith
        L15_1 = L13_1
        L16_1 = L4_1
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 then
          L14_1 = table
          L14_1 = L14_1.insert
          L15_1 = L6_1
          L16_1 = L13_1
          L14_1(L15_1, L16_1)
        end
      end
    end
    L13_1 = sigattr_head
    L13_1 = L13_1[L11_1]
    if L13_1 then
      L13_1 = sigattr_head
      L13_1 = L13_1[L11_1]
      L13_1 = L13_1.attribute
    end
    if L13_1 == 16389 then
      L14_1 = sigattr_head
      L14_1 = L14_1[L11_1]
      L14_1 = L14_1.utf8p2
      if L14_1 == "ATTR_c09458eb" then
        L14_1 = sigattr_head
        L14_1 = L14_1[L11_1]
        L14_1 = L14_1.utf8p1
        L15_1 = L14_1
        L14_1 = L14_1.lower
        L14_1 = L14_1(L15_1)
        L15_1 = StringEndsWith
        L16_1 = L14_1
        L17_1 = L4_1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 then
          L15_1 = table
          L15_1 = L15_1.insert
          L16_1 = L6_1
          L17_1 = L14_1
          L15_1(L16_1, L17_1)
        end
      end
    end
  end
  L12_1 = next
  L13_1 = L6_1
  L12_1 = L12_1(L13_1)
  if L12_1 == nil then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  L12_1 = table_dedup
  L13_1 = L6_1
  L12_1 = L12_1(L13_1)
  L6_1 = L12_1
  L12_1 = #L6_1
  if 30 < L12_1 then
    L12_1 = ipairs
    L13_1 = L6_1
    L12_1, L13_1, L14_1 = L12_1(L13_1)
    for L15_1, L16_1 in L12_1, L13_1, L14_1 do
      L18_1 = L16_1
      L17_1 = L16_1.match
      L19_1 = "([^\\]+)$"
      L17_1 = L17_1(L18_1, L19_1)
      L19_1 = L16_1
      L18_1 = L16_1.match
      L20_1 = "(.*)\\[^\\]+$"
      L18_1 = L18_1(L19_1, L20_1)
      L19_1 = isnull
      L20_1 = L17_1
      L19_1 = L19_1(L20_1)
      if L19_1 then
        L19_1 = isnull
        L20_1 = L18_1
        L19_1 = L19_1(L20_1)
        if L19_1 then
          L19_1 = mp
          L19_1 = L19_1.CLEAN
          return L19_1
        end
      end
      L19_1 = table
      L19_1 = L19_1.insert
      L20_1 = L7_1
      L21_1 = L18_1
      L19_1(L20_1, L21_1)
    end
    L12_1 = next
    L13_1 = L7_1
    L12_1 = L12_1(L13_1)
    if L12_1 == nil then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
    L12_1 = table_dedup
    L13_1 = L7_1
    L12_1 = L12_1(L13_1)
    L7_1 = L12_1
    L12_1 = #L7_1
    if 3 < L12_1 then
      L12_1 = bm
      L12_1 = L12_1.add_related_string
      L13_1 = "encryptedFiles_count"
      L14_1 = tostring
      L15_1 = #L6_1
      L14_1 = L14_1(L15_1)
      L15_1 = bm
      L15_1 = L15_1.RelatedStringBMReport
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = bm
      L12_1 = L12_1.add_related_string
      L13_1 = "ransom_meta"
      L14_1 = L0_1
      L15_1 = bm
      L15_1 = L15_1.RelatedStringBMReport
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = "RanAggrCount"
      L13_1 = 0
      L14_1 = bm
      L14_1 = L14_1.get_current_process_startup_info
      L14_1 = L14_1()
      if L14_1 then
        L15_1 = L14_1.ppid
        if L15_1 then
          L13_1 = L14_1.ppid
        end
      end
      L15_1 = MpCommon
      L15_1 = L15_1.DoesProcessHaveAttribute
      L16_1 = L13_1
      L17_1 = L12_1
      L15_1 = L15_1(L16_1, L17_1)
      if not L15_1 then
        L15_1 = MpCommon
        L15_1 = L15_1.DoesProcessHaveAttribute
        L16_1 = L13_1
        L17_1 = "inherit:"
        L18_1 = L12_1
        L17_1 = L17_1 .. L18_1
        L15_1 = L15_1(L16_1, L17_1)
        if not L15_1 then
          L15_1 = MpCommon
          L15_1 = L15_1.AddProcessAttribute
          L16_1 = L13_1
          L17_1 = L12_1
          L18_1 = L0_1
          L19_1 = false
          L15_1(L16_1, L17_1, L18_1, L19_1)
        end
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
