local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[15]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[15]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[15]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = false
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "^/usr/local/"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = isTainted
  L5_1 = L1_1
  L6_1 = "upx_file_created_taint"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "BM_ELFUPX"
    L6_1 = L1_1
    L4_1(L5_1, L6_1)
    L2_1 = true
  end
  L4_1 = isTainted
  L5_1 = L1_1
  L6_1 = "masqueraded_file_extension_taint"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "BM_MasqueradedFileExtension"
    L6_1 = L1_1
    L4_1(L5_1, L6_1)
    L2_1 = true
  end
  L4_1 = isTainted
  L5_1 = L1_1
  L6_1 = "stripped_elf_created_taint"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "BM_ELFStrippedTrigger"
    L6_1 = L1_1
    L4_1(L5_1, L6_1)
    L2_1 = true
  end
  L4_1 = isTainted
  L5_1 = L1_1
  L6_1 = "new_elf_file_created_hint"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "BM_NewElfCreated"
    L6_1 = L1_1
    L4_1(L5_1, L6_1)
    L2_1 = true
  end
end
L4_1 = IsKeyInRollingQueue
L5_1 = "enum_hstr_attributes"
L6_1 = L1_1
L7_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = GetRollingQueueAsHashTable
  L5_1 = "enum_hstr_attributes"
  L4_1 = L4_1(L5_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = StringSplit
  L6_1 = L4_1[L1_1]
  L7_1 = "|"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == nil then
    L6_1 = #L5_1
    if not (0 < L6_1) then
      goto lbl_142
    end
  end
  L6_1 = 1
  L7_1 = #L5_1
  L8_1 = 1
  for L9_1 = L6_1, L7_1, L8_1 do
    L10_1 = "BM_ContentAttribs:"
    L11_1 = L5_1[L9_1]
    L10_1 = L10_1 .. L11_1
    L11_1 = bm
    L11_1 = L11_1.trigger_sig
    L12_1 = L10_1
    L13_1 = L1_1
    L11_1(L12_1, L13_1)
  end
  L2_1 = true
end
::lbl_142::
L4_1 = IsKeyInRollingQueue
L5_1 = "enum_bm_attributes"
L6_1 = L1_1
L7_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = GetRollingQueueAsHashTable
  L5_1 = "enum_bm_attributes"
  L4_1 = L4_1(L5_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = StringSplit
  L6_1 = L4_1[L1_1]
  L7_1 = "|"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == nil then
    L6_1 = #L5_1
    if not (0 < L6_1) then
      goto lbl_180
    end
  end
  L6_1 = 1
  L7_1 = #L5_1
  L8_1 = 1
  for L9_1 = L6_1, L7_1, L8_1 do
    L10_1 = "BM_ContentAttribs:"
    L11_1 = L5_1[L9_1]
    L10_1 = L10_1 .. L11_1
    L11_1 = bm
    L11_1 = L11_1.trigger_sig
    L12_1 = L10_1
    L13_1 = L1_1
    L11_1(L12_1, L13_1)
  end
  L2_1 = true
end
::lbl_180::
if L2_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
