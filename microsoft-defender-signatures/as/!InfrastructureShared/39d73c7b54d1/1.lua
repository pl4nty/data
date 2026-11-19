-- Threat: !InfrastructureShared
-- Name: 39d73c7b54d1
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("TaintedMachineML_Low") > 0 then
  return mp.INFECTED
end
return mp.CLEAN
