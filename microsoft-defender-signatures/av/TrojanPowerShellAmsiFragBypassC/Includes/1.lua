local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_AMSI_OPERATION_PPID
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = L1_1
    L3_1 = "-"
    L4_1 = "amsifragVirtual"
    L2_1 = L2_1 .. L3_1 .. L4_1
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:PSDllImportKernel32"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "PS_Import"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:PS/WinAPIGetProcAddress"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "Ass_GetProc"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCRIPT:Psloadlib.A"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "GetLoadlib"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCRIPT:Pscopy.A"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "Pscopy"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:HackTool:PowerShell/InterOpMarshal"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "SetIntermarshal"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:Script/AmsiBypassWin32"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "Ps_win32"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:Script/AmsiBypassVirtualProc"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "Ps_Virtual"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = GetTacticsTableForPid
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = 0
    if L3_1 ~= nil then
      L5_1 = pairs
      L6_1 = L3_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        if L8_1 ~= nil then
          L4_1 = L4_1 + 1
        end
      end
      if 5 <= L4_1 then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
