local L0_1, L1_1, L2_1, L3_1
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if 1640995200 < L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.TimeDateStamp
  if L0_1 < 1767139200 then
    L0_1 = pe
    L0_1 = L0_1.get_versioninfo
    L0_1 = L0_1()
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = L0_1.CompanyName
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = L0_1.CompanyName
    if L1_1 == "J.C. Kessels" then
      L1_1 = pe
      L1_1 = L1_1.get_fixedversioninfo
      L1_1 = L1_1()
      if not L1_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = L1_1.FileVersion
      if not L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = Version_to_str
      L3_1 = L1_1.FileVersion
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      if L2_1 == "3.36.0.2" then
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
