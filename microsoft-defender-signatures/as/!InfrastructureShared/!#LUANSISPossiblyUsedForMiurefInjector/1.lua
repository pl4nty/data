local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= false then
  L0_1 = peattributes
  L0_1 = L0_1.isdamaged
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.arm_image
    if not L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.hasappendeddata
      if L0_1 ~= false then
        goto lbl_20
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_20::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:NSIS_Installer"
L0_1 = L0_1(L1_1)
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "HSTR:NSIS.gen!A"
  L0_1 = L0_1(L1_1)
  if L0_1 == false then
    goto lbl_38
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PEPCODE:HasDigitalSignature"
L0_1 = L0_1(L1_1)
::lbl_38::
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 < 1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pesecs
L1_1 = L1_1[L0_1]
L1_1 = L1_1.PointerToRawData
L2_1 = pesecs
L2_1 = L2_1[L0_1]
L2_1 = L2_1.SizeOfRawData
L1_1 = L1_1 + L2_1
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L1_1 > L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1 - L1_1
if L3_1 < 94208 or 143360 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
