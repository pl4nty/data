local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.CompanyName
  if L1_1 ~= "Sun Microsystems, Inc." then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = L0_1.ProductName
  if L1_1 ~= "Java(TM) Platform SE 6" then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = L0_1.InternalName
  L2_1 = L0_1.FileDescription
  if L1_1 ~= L2_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = L0_1.OriginalFilename
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = ".DLL"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
  L1_1 = L0_1.OriginalFilename
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = ".EXE"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
  L1_1 = L0_1.OriginalFilename
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = ".DAT"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
  L1_1 = L0_1.OriginalFilename
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = ".TMP"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
