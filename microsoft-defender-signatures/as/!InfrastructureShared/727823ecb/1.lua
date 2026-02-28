local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = peattributes
L1_1 = L1_1.isdll
if L1_1 then
  L1_1 = peattributes
  L1_1 = L1_1.amd64_image
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "pea_no_security"
    L1_1 = L1_1(L2_1)
    if L1_1 and 5242880 < L0_1 and L0_1 < 7340032 then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "do_exhaustivehstr_64bit_rescan"
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "do_exhaustivehstr_64bit_rescan"
        L1_1(L2_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
