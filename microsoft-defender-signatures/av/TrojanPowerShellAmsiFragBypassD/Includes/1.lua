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
    L4_1 = "amsifragVirtualbypass"
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
    L4_1 = "SCRIPT:PowerShell/ReadProcMem"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "Ass_ReadProcMem"
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
      L5_1 = "GetProcAdd"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCRIPT:PsGetModHandle.A"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "GetModule"
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
      L5_1 = "PsCopy"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCRIPT:PS.GetCurrentProcess"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "GetCurrProc"
      L6_1 = 3600
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "SCPT:Trojan:Win32/PS.GetAssemblies"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = AddTacticForPid
      L4_1 = L2_1
      L5_1 = "GetAssem"
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
      if 6 <= L4_1 then
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
