local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 ~= nil then
    L3_2 = #A1_2
    if not (L3_2 <= 1) then
      goto lbl_8
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_8::
  L3_2 = 0
  if A2_2 ~= nil and 0 < A2_2 then
    L3_2 = A2_2
  end
  L4_2 = mp
  L4_2 = L4_2.ispackedwith
  L5_2 = A1_2
  L6_2 = "+"
  L5_2 = L5_2 .. L6_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = MpCommon
    L4_2 = L4_2.QueryPersistContext
    L5_2 = A0_2
    L6_2 = "FileIsPackedWith"
    L7_2 = A1_2
    L6_2 = L6_2 .. L7_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      L4_2 = MpCommon
      L4_2 = L4_2.AppendPersistContext
      L5_2 = A0_2
      L6_2 = "FileIsPackedWith"
      L7_2 = A1_2
      L6_2 = L6_2 .. L7_2
      L7_2 = L3_2
      L4_2(L5_2, L6_2, L7_2)
    end
    L4_2 = true
    return L4_2
  else
    L4_2 = clearPersistContext
    L5_2 = A0_2
    L6_2 = "FileIsPackedWith"
    L7_2 = A1_2
    L6_2 = L6_2 .. L7_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = false
  return L4_2
end

checkPackerPersistContext = L0_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = false
L2_1 = peattributes
L2_1 = L2_1.packersigmatched
if L2_1 then
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "UPX"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "Aspack"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "ASProtect"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "FSG"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "PECompact"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "Petite"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "EZip"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "Exe32Pack"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "AutoIt"
  L2_1(L3_1, L4_1)
  L2_1 = checkPackerPersistContext
  L3_1 = L0_1
  L4_1 = "AutoHotKey"
  L2_1(L3_1, L4_1)
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "PackerSigMatched"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L0_1
    L4_1 = "PackerSigMatched"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
  L1_1 = true
end
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L0_1
L4_1 = "FileIsPackedWithUPX"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "BM_UPX_PACKED"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "Lua:FileIsPackedWithUPX"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "HSTR:UpxDecryption"
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        goto lbl_99
      end
    end
  end
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContext
  L3_1 = L0_1
  L4_1 = "FileIsPackedWithUPX"
  L5_1 = 0
  L2_1(L3_1, L4_1, L5_1)
  L1_1 = true
end
::lbl_99::
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.IsTrustedFile
  L3_1 = false
  L2_1 = L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.IsKnownFriendlyFile
  L3_1 = L0_1
  L4_1 = false
  L5_1 = false
  L2_1 = L2_1 == true or L2_1
  if L2_1 == true then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_MT1027.002"
  L2_1(L3_1)
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "T1027.002"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L0_1
    L4_1 = "T1027.002"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "SoftwarePacking"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L0_1
    L4_1 = "SoftwarePacking"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
