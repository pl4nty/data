-- Threat: !InfrastructureShared
-- Name: 39d713e68f58
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("TaintedMachineML_Medium") > 0 then
  return mp.INFECTED
end
return mp.CLEAN
