local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 5 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L3_1 = L0_1
    L2_1 = L0_1.len
    L2_1 = L2_1(L3_1)
    if 8 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L0_1
      L4_1 = 1
      L5_1 = 8
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 == "\\device\\" then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = MpCommon
        L3_1 = L3_1.PathToWin32Path
        L4_1 = L0_1
        L3_1, L4_1, L5_1 = L3_1(L4_1)
        L2_1 = L2_1(L3_1, L4_1, L5_1)
        L1_1 = L2_1
      end
    end
    L3_1 = L1_1
    L2_1 = L1_1.len
    L2_1 = L2_1(L3_1)
    if L2_1 == 6 then
      if L1_1 == "\\\\?\\c:" then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      else
        L2_1 = mp
        L2_1 = L2_1.set_mpattribute
        L3_1 = "Lua:FileBaseFolderInOtherDrive"
        L2_1(L3_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
