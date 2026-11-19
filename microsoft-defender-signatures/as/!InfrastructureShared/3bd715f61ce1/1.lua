-- Threat: !InfrastructureShared
-- Name: 3bd715f61ce1
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("TaintedMachineML_High") > 0 then
  return mp.INFECTED
end
return mp.CLEAN
