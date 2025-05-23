-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanPowerShellAmsiFragBypassC\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1 .. "-" .. "amsifragVirtual"
    if (mp.get_mpattribute)("SCPT:PSDllImportKernel32") then
      AddTacticForPid(l_0_2, "PS_Import", 3600)
    end
    if (mp.get_mpattribute)("SCPT:PS/WinAPIGetProcAddress") then
      AddTacticForPid(l_0_2, "Ass_GetProc", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:Psloadlib.A") then
      AddTacticForPid(l_0_2, "GetLoadlib", 3600)
    end
    if (mp.get_mpattribute)("SCRIPT:Pscopy.A") then
      AddTacticForPid(l_0_2, "Pscopy", 3600)
    end
    if (mp.get_mpattribute)("SCPT:HackTool:PowerShell/InterOpMarshal") then
      AddTacticForPid(l_0_2, "SetIntermarshal", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassWin32") then
      AddTacticForPid(l_0_2, "Ps_win32", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassVirtualProc") then
      AddTacticForPid(l_0_2, "Ps_Virtual", 3600)
    end
    local l_0_3 = GetTacticsTableForPid(l_0_2)
    local l_0_4 = 0
    if l_0_3 ~= nil then
      for l_0_8,l_0_9 in pairs(l_0_3) do
        if l_0_8 ~= nil then
          l_0_4 = l_0_4 + 1
        end
      end
      if l_0_4 >= 5 then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

