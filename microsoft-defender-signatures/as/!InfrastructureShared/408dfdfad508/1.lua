local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
L1_1 = #L0_1
if 0 < L1_1 and L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_30
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_30::
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsExcludedByImagePathMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = machoLC
if L2_1 ~= nil then
  L2_1 = machoLC
  L2_1 = L2_1.__DATA
  if L2_1 ~= nil then
    L2_1 = machoLC
    L2_1 = L2_1.__DATA
    L2_1 = L2_1.__data
    if L2_1 ~= "" then
      L2_1 = machoLC
      L2_1 = L2_1.__DATA
      L2_1 = L2_1.__data
      if L2_1 ~= "" then
        goto lbl_65
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_65::
L2_1 = machoLC
L2_1 = L2_1.__DATA
L2_1 = L2_1.__data
L2_1 = L2_1.Size
L3_1 = machoLC
L3_1 = L3_1.__DATA
L3_1 = L3_1.__data
L3_1 = L3_1.Offset
if L2_1 == nil or L3_1 == nil or L2_1 == "" or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if 64 <= L2_1 then
  L4_1 = mp
  L4_1 = L4_1.readprotection
  L5_1 = false
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.readfile
  L5_1 = L3_1
  L6_1 = 64
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "\206\250\237\254"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "\207\250\237\254"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_125
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "__TEXT"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
::lbl_125::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
