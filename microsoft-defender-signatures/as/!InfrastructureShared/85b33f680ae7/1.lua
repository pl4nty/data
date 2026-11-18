-- Threat: !InfrastructureShared
-- Name: 85b33f680ae7
-- Type: 21

if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
