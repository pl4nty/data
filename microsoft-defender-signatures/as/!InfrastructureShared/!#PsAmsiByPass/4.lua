local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = AddTacticForPid
  L2_1 = L0_1
  L3_1 = "PS_Patch"
  L4_1 = 3600
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = GetTacticsTableForPid
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = L1_1.PS_LoadLib
    if L2_1 then
      L2_1 = L1_1.PS_GetProc
      if L2_1 then
        L2_1 = L1_1.PS_VirtualProt
        if L2_1 then
          L2_1 = L1_1.PS_Patch
          if L2_1 then
            L2_1 = mp
            L2_1 = L2_1.set_mpattribute
            L3_1 = "PS_AmsiBypass1"
            L2_1(L3_1)
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
