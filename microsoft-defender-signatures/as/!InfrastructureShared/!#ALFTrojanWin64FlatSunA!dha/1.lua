local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:FnameAttr!radcui.dll"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:FirstFolder1!windows"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 7 then
  L0_1 = pe
  L0_1 = L0_1.foffset_rva
  L1_1 = 4096
  L0_1 = L0_1(L1_1)
  if L0_1 == 1024 then
    goto lbl_32
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_32::
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FNAME
L0_1 = L0_1(L1_1)
if L0_1 ~= "radcui.dll" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pe
L0_1 = L0_1.get_imports
L0_1, L1_1 = L0_1()
if 110 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
