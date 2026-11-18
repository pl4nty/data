-- Threat: !InfrastructureShared
-- Name: 2fd74ab8bac0
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("TaintedMachine") > 0 then
  return mp.INFECTED
end
return mp.CLEAN
