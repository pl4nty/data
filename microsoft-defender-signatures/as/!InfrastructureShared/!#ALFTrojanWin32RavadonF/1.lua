local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= ".tmp" then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = ".exe."
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_24
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_24::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L4_1 = pesecs
L4_1 = L4_1[L3_1]
L4_1 = L4_1.PointerToRawData
L5_1 = pesecs
L5_1 = L5_1[L3_1]
L5_1 = L5_1.SizeOfRawData
L6_1 = L4_1 + L5_1
if L2_1 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = pehdr
L7_1 = L7_1.DataDirectory
L8_1 = pe
L8_1 = L8_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L7_1 = L7_1[L8_1]
L7_1 = L7_1.RVA
if L6_1 >= L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = 0
if L7_1 == 0 then
  L8_1 = L2_1 - L6_1
elseif L6_1 < L7_1 then
  L8_1 = L7_1 - L6_1
else
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = L8_1 * 100
L9_1 = L9_1 / L2_1
if 90 < L9_1 then
  L9_1 = mp
  L9_1 = L9_1.readprotection
  L10_1 = false
  L9_1(L10_1)
  L9_1 = 0
  L10_1 = 1
  L11_1 = 3
  L12_1 = 1
  for L13_1 = L10_1, L11_1, L12_1 do
    L14_1 = L8_1 / 4
    L14_1 = L14_1 * L13_1
    L14_1 = L6_1 + L14_1
    L15_1 = L14_1 + 256
    if L2_1 <= L15_1 then
      L15_1 = mp
      L15_1 = L15_1.CLEAN
      return L15_1
    end
    L15_1 = mp
    L15_1 = L15_1.readfile
    L16_1 = L14_1
    L17_1 = 256
    L15_1 = L15_1(L16_1, L17_1)
    L16_1 = crypto
    L16_1 = L16_1.ComputeEntropy
    L17_1 = L15_1
    L16_1 = L16_1(L17_1)
    if L16_1 == 0 then
      L9_1 = L9_1 + 1
    end
  end
  if L9_1 == 3 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
