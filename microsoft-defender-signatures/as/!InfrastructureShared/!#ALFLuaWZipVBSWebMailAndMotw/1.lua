local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.GetMOTWZone
  L1_1 = L1_1()
  if 3 <= L1_1 and L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "docs.googleusercontent.com/docs"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "drive.google.com"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_47
      end
    end
    L1_1 = mp
    L1_1 = L1_1.getfilesize
    L1_1 = L1_1()
    if L1_1 <= 2097152 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
::lbl_47::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
