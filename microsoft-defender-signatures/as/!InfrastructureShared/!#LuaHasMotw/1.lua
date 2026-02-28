local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWZone
  L0_1 = L0_1()
  if L0_1 ~= nil and 3 <= L0_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.getfilename
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1()
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    if L1_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.len
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if 4 <= L2_1 then
        L2_1 = string
        L2_1 = L2_1.sub
        L3_1 = L1_1
        L4_1 = -4
        L2_1 = L2_1(L3_1, L4_1)
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = MpCommon
        L4_1 = L4_1.PathToWin32Path
        L5_1 = L1_1
        L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L2_1 == ".iso" then
          L4_1 = MpCommon
          L4_1 = L4_1.AppendPersistContext
          L5_1 = L3_1
          L6_1 = "IsoWithMotw"
          L7_1 = 5
          L4_1(L5_1, L6_1, L7_1)
        elseif L2_1 == ".vhd" then
          L4_1 = MpCommon
          L4_1 = L4_1.AppendPersistContext
          L5_1 = L3_1
          L6_1 = "VhdWithMotw"
          L7_1 = 5
          L4_1(L5_1, L6_1, L7_1)
        elseif L2_1 == ".img" then
          L4_1 = MpCommon
          L4_1 = L4_1.AppendPersistContext
          L5_1 = L3_1
          L6_1 = "ImgWithMotw"
          L7_1 = 5
          L4_1(L5_1, L6_1, L7_1)
        end
      end
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
