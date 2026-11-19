-- Threat: !InfrastructureShared
-- Name: 9beb3d96b1a02
-- Type: 21
-- Includes: BMLuaLib

if IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
