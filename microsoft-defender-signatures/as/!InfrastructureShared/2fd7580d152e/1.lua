-- Threat: !InfrastructureShared
-- Name: 2fd7580d152e
-- Type: 21

if MpCommon.QueryPersistContextNoPath("TaintedMachine", "TaintedMachineLow") then
  return mp.INFECTED
end
return mp.CLEAN
