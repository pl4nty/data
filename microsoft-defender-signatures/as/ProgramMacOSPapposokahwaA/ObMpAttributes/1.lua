local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = {}
  L1_1["acrobat reader"] = ""
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = L1_1[L2_1]
  if L3_1 then
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "BM_MACHO64_FILE"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattribute
      L5_1 = "BM_MACHO32_FILE"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_60
      end
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_FILEPATH
    L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "/applications/adobe acrobat reader dc.app/contents"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
::lbl_60::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
