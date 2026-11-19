-- Threat: Trojan:PowerShell/AmsiFragBypass.D
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: SCPT:PSDllImportKernel32 | SCRIPT:PowerShell/ReadProcMem | SCPT:PS/WinAPIGetProcAddress | SCRIPT:PsGetModHandle.A | SCRIPT:Pscopy.A | SCRIPT:PS.GetCurrentProcess | SCPT:Trojan:Win32/PS.GetAssemblies & LUA:FileSizeLE10000.B

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1 .. "-" .. "amsifragVirtualbypass"
    if mp.get_mpattribute("SCPT:PSDllImportKernel32") then
      AddTacticForPid(l_0_2, "PS_Import", 3600)
    end
    if mp.get_mpattribute("SCRIPT:PowerShell/ReadProcMem") then
      AddTacticForPid(l_0_2, "Ass_ReadProcMem", 3600)
    end
    if mp.get_mpattribute("SCPT:PS/WinAPIGetProcAddress") then
      AddTacticForPid(l_0_2, "GetProcAdd", 3600)
    end
    if mp.get_mpattribute("SCRIPT:PsGetModHandle.A") then
      AddTacticForPid(l_0_2, "GetModule", 3600)
    end
    if mp.get_mpattribute("SCRIPT:Pscopy.A") then
      AddTacticForPid(l_0_2, "PsCopy", 3600)
    end
    if mp.get_mpattribute("SCRIPT:PS.GetCurrentProcess") then
      AddTacticForPid(l_0_2, "GetCurrProc", 3600)
    end
    if mp.get_mpattribute("SCPT:Trojan:Win32/PS.GetAssemblies") then
      AddTacticForPid(l_0_2, "GetAssem", 3600)
    end
    local l_0_3 = GetTacticsTableForPid(l_0_2)
    local l_0_4 = 0
    if l_0_3 ~= nil then
      for l_0_5, l_0_6 in pairs(l_0_3) do
        if l_0_5 ~= nil then
          l_0_4 = l_0_4 + 1
        end
      end
      if 6 <= l_0_4 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
