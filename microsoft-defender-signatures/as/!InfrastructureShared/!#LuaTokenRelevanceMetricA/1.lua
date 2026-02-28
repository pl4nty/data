local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILE_AGE
L1_1 = L1_1(L2_1)
if L1_1 == nil or 18000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 256 or 5242880 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "cache"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "crypto"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "\\scans\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      goto lbl_69
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_69::
L4_1 = mp
L4_1 = L4_1.GetCertificateInfo
L5_1 = false
L4_1 = L4_1(L5_1)
L5_1 = pairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.Signers
  if L10_1 ~= nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:FileNameTokenRelevanceMetric.A"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
