-- Threat: !InfrastructureShared
-- Name: 145b367233159
-- Type: 21

if not MpCommon.QueryPersistContext(bm.get_imagepath(), "RunsDestructiveCMDsParentBlock") then
  return mp.CLEAN
end
return mp.INFECTED
