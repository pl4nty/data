local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil and L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "\\powershell.exe"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "\\pwsh.exe"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        goto lbl_48
      end
    end
    L3_1 = pcall
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_AMSI_CONTENTNAME
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil and L4_1 == nil then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
::lbl_48::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
