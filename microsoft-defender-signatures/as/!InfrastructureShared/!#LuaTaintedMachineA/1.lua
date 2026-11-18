-- Threat: !InfrastructureShared
-- Name: !#Lua:TaintedMachine.A
-- Type: 13
-- Includes: AgePrevalence
-- MpAttributes: MpEnableTaintedShieldsUpMachine | MpEnableTainted_medium | MpEnableTainted_high | CompromisedMachineML_low | CompromisedMachineML_moderate | CompromisedMachineML_high

function checkTaintedMachinePersistContext(l_1_0, l_1_1, l_1_2)
  if l_1_0 == nil or #l_1_0 <= 0 or l_1_1 == nil or #l_1_1 <= 0 then
    return false
  end
  local l_1_3 = 14400
  if l_1_2 ~= nil then
    l_1_3 = l_1_2
  end
  if mp.get_mpattribute(l_1_0) and not MpCommon.QueryPersistContextNoPath(l_1_1, l_1_0) then
    MpCommon.AppendPersistContextNoPath(l_1_1, l_1_0, l_1_3)
    if not MpCommon.QueryPersistContextNoPath("TaintedMachine", l_1_1) then
      MpCommon.AppendPersistContextNoPath("TaintedMachine", l_1_1, l_1_3)
    end
    return true
  end
  if 0 >= MpCommon.GetPersistContextCountNoPath(l_1_1) then
    clearPersistContextNoPath("TaintedMachine", l_1_1)
  end
  return false
end

checkTaintedMachinePersistContext("MpEnableTaintedShieldsUpMachine", "TaintedMachineLow")
local l_0_0 = checkTaintedMachinePersistContext("MpEnableTainted_medium", "TaintedMachineMedium")
if l_0_0 == true then
  checkTaintedMachinePersistContext("MpEnableTainted_medium", "TaintedMachineLow")
end
local l_0_1 = checkTaintedMachinePersistContext("MpEnableTainted_high", "TaintedMachineHigh")
if l_0_1 == true then
  checkTaintedMachinePersistContext("MpEnableTainted_high", "TaintedMachineLow")
  checkTaintedMachinePersistContext("MpEnableTainted_high", "TaintedMachineMedium")
end
checkTaintedMachinePersistContext("CompromisedMachineML_low", "TaintedMachineML_Low")
local l_0_2 = checkTaintedMachinePersistContext("CompromisedMachineML_moderate", "TaintedMachineML_Medium")
if l_0_2 == true then
  checkTaintedMachinePersistContext("CompromisedMachineML_moderate", "TaintedMachineML_Low")
end
local l_0_3 = checkTaintedMachinePersistContext("CompromisedMachineML_high", "TaintedMachineML_High")
if l_0_3 == true then
  checkTaintedMachinePersistContext("CompromisedMachineML_high", "TaintedMachineML_Low")
  checkTaintedMachinePersistContext("CompromisedMachineML_high", "TaintedMachineML_Medium")
end
return mp.CLEAN
