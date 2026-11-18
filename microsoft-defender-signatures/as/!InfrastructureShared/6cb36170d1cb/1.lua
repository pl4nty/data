-- Threat: !InfrastructureShared
-- Name: 6cb36170d1cb
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0
  l_0_0 = this_sigattrlog[2].utf8p2
  if l_0_0 ~= "" and l_0_0 ~= nil and (isTainted(l_0_0, "remote_file_created_taint") or isTainted(l_0_0, "mounted_file_execution")) then
    bm.add_related_file(l_0_0)
    reportRelatedBmHits()
    return mp.INFECTED
  end
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
