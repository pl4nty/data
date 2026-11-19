-- Threat: !InfrastructureShared
-- Name: 145b31b775a5c
-- Type: 21

if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
