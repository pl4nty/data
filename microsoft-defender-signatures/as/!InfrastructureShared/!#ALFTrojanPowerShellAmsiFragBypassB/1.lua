-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PowerShell/AmsiFragBypass.B
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (SCPT:Script/AmsiBypassFragment.A | SCPT:Script/AmsiBypassFragment.B | SCPT:Script/AmsiBypassFragment.C | SCPT:Script/AmsiBypassFragment.D | SCPT:Script/AmsiBypassFragment.E) & LUA:FileSizeLE50KB.B & (!SCPT:Script/AmsiBypassExclu) & MpPowershellAmsiViaCmdLine

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1 .. "-" .. "amsifrag"
    if mp.get_mpattribute("SCPT:Script/AmsiBypassFragment.A") then
      AddTacticForPid(l_0_2, "PS_ManageAuto", 3600)
    end
    if mp.get_mpattribute("SCPT:Script/AmsiBypassFragment.B") then
      AddTacticForPid(l_0_2, "Ass_GetVal", 3600)
    end
    if mp.get_mpattribute("SCPT:Script/AmsiBypassFragment.C") then
      AddTacticForPid(l_0_2, "GetField", 3600)
    end
    if mp.get_mpattribute("SCPT:Script/AmsiBypassFragment.D") then
      AddTacticForPid(l_0_2, "GetValue", 3600)
    end
    if mp.get_mpattribute("SCPT:Script/AmsiBypassFragment.E") then
      AddTacticForPid(l_0_2, "SetValue", 3600)
    end
    local l_0_3 = GetTacticsTableForPid(l_0_2)
    local l_0_4 = 0
    if l_0_3 ~= nil then
      for l_0_5, l_0_6 in pairs(l_0_3) do
        if l_0_5 ~= nil then
          l_0_4 = l_0_4 + 1
        end
      end
      if 5 <= l_0_4 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
