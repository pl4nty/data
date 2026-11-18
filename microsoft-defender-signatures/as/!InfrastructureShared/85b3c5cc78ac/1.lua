-- Threat: !InfrastructureShared
-- Name: 85b3c5cc78ac
-- Type: 21

if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
