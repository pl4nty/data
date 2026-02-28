local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = nri
L0_1 = L0_1.GetRawRequestBlob
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "\r\n\r\n(.*)"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = #L1_1
  if L2_1 ~= 0 then
    goto lbl_18
  end
end
L1_1 = L0_1
::lbl_18::
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "__VIEWSTATE=([^&]+)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = "%%2[Bb]"
L6_1 = "+"
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = "%%2[Ff]"
L6_1 = "/"
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = "%%3[Dd]"
L6_1 = "="
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = " "
L6_1 = "+"
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = 1200
L4_1 = #L2_1
if L3_1 > L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.gsub
L6_1 = "%s+"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "^[A-Za-z0-9%+/%=]+$"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = #L4_1
L5_1 = L5_1 % 4
if L5_1 ~= 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "=.+"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
