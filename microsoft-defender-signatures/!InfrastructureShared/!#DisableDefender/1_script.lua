-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#DisableDefender\1_luac 

-- params : ...
-- function num : 0
do
  if ((((((not (mp.get_mpattribute)("AGGR:PowerShell/DisableIntrusionPreventionSystem") or (mp.get_mpattribute)("AGGR:PowerShell/DisableIOAVProtection")) and not (mp.get_mpattribute)("AGGR:PowerShell/DisableRealTimeMonitoring")) or (mp.get_mpattribute)("AGGR:PowerShell/DisableScriptScanning")) and not (mp.get_mpattribute)("AGGR:PowerShell/DisableControlledFolderAccess")) or (mp.get_mpattribute)("AGGR:PowerShell/SubmitSamplesConsent")) and not (mp.get_mpattribute)("SCPT:PowerShell/SetNetProtectAudit")) or (mp.get_mpattribute)("SCPT:PowerShell/DisableMAPSReport") then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
  end
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 >= 2 and l_0_0 < 10 then
    (mp.set_mpattribute)("Disable_" .. l_0_0 .. "_WDFunctions")
  end
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 > 3 and l_0_0 < 10 then
    (mp.set_mpattribute)("Disable_Multiple_WDFunctions")
  end
  return mp.CLEAN
end

