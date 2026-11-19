-- Threat: !InfrastructureShared
-- Name: 190b355305677
-- Type: 21
-- Includes: BMLuaLib

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
