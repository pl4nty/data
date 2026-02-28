local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 ~= nil then
    L3_2 = #A0_2
    if not (L3_2 <= 0) and A1_2 ~= nil then
      L3_2 = #A1_2
      if not (L3_2 <= 0) then
        goto lbl_13
      end
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_13::
  L3_2 = 14400
  if A2_2 ~= nil then
    L3_2 = A2_2
  end
  L4_2 = mp
  L4_2 = L4_2.get_mpattribute
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = MpCommon
    L4_2 = L4_2.QueryPersistContextNoPath
    L5_2 = A1_2
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      L4_2 = MpCommon
      L4_2 = L4_2.AppendPersistContextNoPath
      L5_2 = A1_2
      L6_2 = A0_2
      L7_2 = L3_2
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = MpCommon
      L4_2 = L4_2.QueryPersistContextNoPath
      L5_2 = "TaintedMachine"
      L6_2 = A1_2
      L4_2 = L4_2(L5_2, L6_2)
      if not L4_2 then
        L4_2 = MpCommon
        L4_2 = L4_2.AppendPersistContextNoPath
        L5_2 = "TaintedMachine"
        L6_2 = A1_2
        L7_2 = L3_2
        L4_2(L5_2, L6_2, L7_2)
      end
      L4_2 = true
      return L4_2
    end
  end
  L4_2 = MpCommon
  L4_2 = L4_2.GetPersistContextCountNoPath
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if L4_2 <= 0 then
    L4_2 = clearPersistContextNoPath
    L5_2 = "TaintedMachine"
    L6_2 = A1_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = false
  return L4_2
end

checkTaintedMachinePersistContext = L0_1
L0_1 = checkTaintedMachinePersistContext
L1_1 = "MpEnableTaintedShieldsUpMachine"
L2_1 = "TaintedMachineLow"
L0_1(L1_1, L2_1)
L0_1 = checkTaintedMachinePersistContext
L1_1 = "MpEnableTainted_medium"
L2_1 = "TaintedMachineMedium"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == true then
  L1_1 = checkTaintedMachinePersistContext
  L2_1 = "MpEnableTainted_medium"
  L3_1 = "TaintedMachineLow"
  L1_1(L2_1, L3_1)
end
L1_1 = checkTaintedMachinePersistContext
L2_1 = "MpEnableTainted_high"
L3_1 = "TaintedMachineHigh"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == true then
  L2_1 = checkTaintedMachinePersistContext
  L3_1 = "MpEnableTainted_high"
  L4_1 = "TaintedMachineLow"
  L2_1(L3_1, L4_1)
  L2_1 = checkTaintedMachinePersistContext
  L3_1 = "MpEnableTainted_high"
  L4_1 = "TaintedMachineMedium"
  L2_1(L3_1, L4_1)
end
L2_1 = checkTaintedMachinePersistContext
L3_1 = "CompromisedMachineML_low"
L4_1 = "TaintedMachineML_Low"
L2_1(L3_1, L4_1)
L2_1 = checkTaintedMachinePersistContext
L3_1 = "CompromisedMachineML_moderate"
L4_1 = "TaintedMachineML_Medium"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == true then
  L3_1 = checkTaintedMachinePersistContext
  L4_1 = "CompromisedMachineML_moderate"
  L5_1 = "TaintedMachineML_Low"
  L3_1(L4_1, L5_1)
end
L3_1 = checkTaintedMachinePersistContext
L4_1 = "CompromisedMachineML_high"
L5_1 = "TaintedMachineML_High"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == true then
  L4_1 = checkTaintedMachinePersistContext
  L5_1 = "CompromisedMachineML_high"
  L6_1 = "TaintedMachineML_Low"
  L4_1(L5_1, L6_1)
  L4_1 = checkTaintedMachinePersistContext
  L5_1 = "CompromisedMachineML_high"
  L6_1 = "TaintedMachineML_Medium"
  L4_1(L5_1, L6_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
