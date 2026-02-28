local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 24 or 255 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1 = L1_1()
L2_1 = L1_1
L1_1 = L1_1.find
L3_1 = "\\start menu\\programs\\startup\\%a+%.lnk"
L4_1 = 1
L5_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = tostring
  L2_1 = headerpage
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "\\all users\\ob%w+%.exe"
  L6_1 = 1
  L7_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "\\programdata\\ob%w+%.exe"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "\\application data\\ob%w+%.exe"
      L6_1 = 1
      L7_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "\\appdata\\roaming\\ob%w+%.exe"
        L6_1 = 1
        L7_1 = false
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          goto lbl_59
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_59::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
