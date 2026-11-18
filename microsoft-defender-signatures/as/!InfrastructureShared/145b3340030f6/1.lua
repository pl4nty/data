-- Threat: !InfrastructureShared
-- Name: 145b3340030f6
-- Type: 21

if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
