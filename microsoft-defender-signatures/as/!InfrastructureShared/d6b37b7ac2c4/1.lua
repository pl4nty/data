local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 20
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
L2_1 = L0_1 * 10000000
if L1_1 > L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p1
  end
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\program files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\system32\\driverstore\\filerepository"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = StringEndsWith
    L3_1 = L1_1
    L4_1 = "u3boostsvr.exe"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = StringEndsWith
      L3_1 = L1_1
      L4_1 = "u3boostsvr64.exe"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        goto lbl_68
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_68::
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L2_1 = L3_1.utf8p1
  end
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "^(.*)%.exe$"
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "^(.*)loc%.dll$"
L4_1 = L4_1(L5_1, L6_1)
if L3_1 ~= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.GetFileSize
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if L5_1 <= 20000 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = tostring
L7_1 = sysio
L7_1 = L7_1.ReadFile
L8_1 = L1_1
L9_1 = L5_1 - 5376
L10_1 = L5_1
L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1(L8_1, L9_1, L10_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "ASUSTeK Computer"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = bm
  L7_1 = L7_1.add_related_file
  L8_1 = L1_1
  L7_1(L8_1)
  L7_1 = bm
  L7_1 = L7_1.add_related_file
  L8_1 = L2_1
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
