local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
  if L1_1 and L2_1 then
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
    L3_1 = L3_1(L4_1)
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.GetProcessCommandLine
    L6_1 = L3_1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    L5_1 = pcall
    L6_1 = mp
    L6_1 = L6_1.get_contextdata
    L7_1 = mp
    L7_1 = L7_1.CONTEXT_DATA_AMSI_CONTENTNAME
    L5_1, L6_1 = L5_1(L6_1, L7_1)
    if L5_1 and L4_1 ~= nil and L6_1 == nil then
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L4_1
      L9_1 = "-command"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 == nil then
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L4_1
        L9_1 = "remotesigned"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 == nil then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = L4_1
          L9_1 = "iwagaemaaablagmaawagagyabwbyacaaqwbqafuaiabha"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 == nil then
            goto lbl_74
          end
        end
      end
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      do return L7_1 end
      ::lbl_74::
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L4_1
      L9_1 = "-encodedcommand"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 == nil then
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L4_1
        L9_1 = "-enc"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 == nil then
          goto lbl_118
        end
      end
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L4_1
      L9_1 = "-noprofile"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 == nil then
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L4_1
        L9_1 = "-nop"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 == nil then
          goto lbl_118
        end
      end
      L7_1 = TrackPidAndTechnique
      L8_1 = "AMSI"
      L9_1 = "T1204"
      L10_1 = "UserExecution"
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
::lbl_118::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
