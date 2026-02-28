local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 5) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsExcludedByImagePathMacOS
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = machoLC
L1_1 = L1_1.__TEXT
L1_1 = L1_1.__cstring
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = machoLC
L2_1 = L2_1.__TEXT
L2_1 = L2_1.__cstring
L2_1 = L2_1.Size
L3_1 = machoLC
L3_1 = L3_1.__TEXT
L3_1 = L3_1.__cstring
L3_1 = L3_1.Offset
if L2_1 == nil or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if 512 <= L2_1 then
  L4_1 = mp
  L4_1 = L4_1.readprotection
  L5_1 = false
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.readfile
  L5_1 = L3_1
  L6_1 = 512
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "z/rt/g"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "yv66vg"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_100
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "AAF9fVEVYVA"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
::lbl_100::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
