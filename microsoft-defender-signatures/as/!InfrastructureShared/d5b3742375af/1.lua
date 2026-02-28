local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = L0_1.ppid
if L1_1 ~= nil and L2_1 ~= nil then
  L3_1 = IsPidExcluded
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = StringStartsWith
  L4_1 = L1_1
  L5_1 = "%"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = bm
  L3_1 = L3_1.DisableSignature
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    if L8_1 ~= nil then
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      L10_1 = IsKeyInRollingQueue
      L11_1 = "SuspFileDroppedViaSMB"
      L12_1 = L9_1
      L13_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1)
      if L10_1 then
        L10_1 = bm
        L10_1 = L10_1.trigger_sig
        L11_1 = "T1570"
        L12_1 = "exec_remotedroppedscript_a"
        L13_1 = L2_1
        L10_1(L11_1, L12_1, L13_1)
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
      L10_1 = IsKeyInRollingQueue
      L11_1 = "DroppedByPossibleRemotelyCreatedProc"
      L12_1 = L9_1
      L13_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1)
      if L10_1 then
        L10_1 = bm
        L10_1 = L10_1.trigger_sig
        L11_1 = "T1570"
        L12_1 = "exec_remotedroppedscript_b"
        L13_1 = L2_1
        L10_1(L11_1, L12_1, L13_1)
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
