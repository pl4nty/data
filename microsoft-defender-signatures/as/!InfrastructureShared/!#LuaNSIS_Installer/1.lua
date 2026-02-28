local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -13
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= "uninstall.exe" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -15
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= "uninstaller.exe" then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -10
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= "uninst.exe" then
      goto lbl_31
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_31::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 104857600 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = peattributes
L1_1 = L1_1.isexe
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
