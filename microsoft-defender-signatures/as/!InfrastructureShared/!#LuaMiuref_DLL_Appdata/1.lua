local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasexports
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 6 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L1_1 = L1_1 - 1
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Characteristics
if L0_1 ~= 3758096448 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[1]
L0_1 = L0_1.RVA
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L1_1 = L1_1[2]
L1_1 = L1_1.Size
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if 1324032 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 1142784 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.contains_rva
L3_1 = 5
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 ~= 149 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONOPEN
if L2_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L2_1 ~= L3_1 then
    goto lbl_116
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "\\appdata\\local\\%w+$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L3_1
  L6_1 = "\\local settings\\application data\\%w+$"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_116
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:Miuref_DLL_Appdata"
L4_1(L5_1)
::lbl_116::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
