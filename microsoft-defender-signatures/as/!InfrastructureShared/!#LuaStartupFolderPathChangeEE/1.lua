local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetPersistContextNoPath
L2_1 = "BMLua:StartupFolderPathChange.EE"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = next
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L2_1 = L1_1[1]
    if L2_1 ~= nil then
      goto lbl_30
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_30::
L2_1 = L1_1[1]
L3_1 = #L2_1
if L3_1 <= 3 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = normalize_path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = normalize_path
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L2_1 = L4_1
if L3_1 ~= nil then
  L4_1 = #L3_1
  if not (L4_1 <= 3) and L2_1 ~= nil then
    L4_1 = #L2_1
    if not (L4_1 <= 4) then
      goto lbl_68
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_68::
if L3_1 == L2_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:FileInStartupFolder"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
