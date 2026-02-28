local L0_1, L1_1, L2_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasappendeddata
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3953
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2180161454 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3957
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2941643785 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3961
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1532046289 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3965
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3147297591 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3969
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2014732855 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3973
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1064667058 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3977
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3775910057 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3981
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 4166935470 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3985
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2870896119 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3989
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3278197780 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3993
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2887294831 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 3997
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1130297941 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 4001
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1839838502 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 4005
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 744854410 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 4009
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2696452061 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = footerpage
L2_1 = 4013
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1628586320 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
