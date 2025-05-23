-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanPowerShellAmsiFragBypassB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1 .. "-" .. "amsifrag"
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassFragment.A") then
      AddTacticForPid(l_0_2, "PS_ManageAuto", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassFragment.B") then
      AddTacticForPid(l_0_2, "Ass_GetVal", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassFragment.C") then
      AddTacticForPid(l_0_2, "GetField", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassFragment.D") then
      AddTacticForPid(l_0_2, "GetValue", 3600)
    end
    if (mp.get_mpattribute)("SCPT:Script/AmsiBypassFragment.E") then
      AddTacticForPid(l_0_2, "SetValue", 3600)
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

