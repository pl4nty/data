-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanPowerShellAmsiFragBypassD\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1 .. "-" .. "amsifragVirtualbypass"
    if (mp.get_mpattribute)("SCPT:PSDllImportKernel32") then
      AddTacticForPid(l_0_2, "PS_Import", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:PowerShell/ReadProcMem") then
      AddTacticForPid(l_0_2, "Ass_ReadProcMem", 3600)
    end
    if (mp.get_mpattribute)("SCPT:PS/WinAPIGetProcAddress") then
      AddTacticForPid(l_0_2, "GetProcAdd", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:PsGetModHandle.A") then
      AddTacticForPid(l_0_2, "GetModule", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:Pscopy.A") then
      AddTacticForPid(l_0_2, "PsCopy", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:PS.GetCurrentProcess") then
      AddTacticForPid(l_0_2, "GetCurrProc", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Trojan:Win32/PS.GetAssemblies") then
      AddTacticForPid(l_0_2, "GetAssem", 3600)
    end
    local l_0_3 = GetTacticsTableForPid(l_0_2)
    local l_0_4 = 0
    if l_0_3 ~= nil then
      for l_0_8,l_0_9 in pairs(l_0_3) do
        if l_0_8 ~= nil then
          l_0_4 = l_0_4 + 1
        end
      end
      if l_0_4 >= 6 then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

