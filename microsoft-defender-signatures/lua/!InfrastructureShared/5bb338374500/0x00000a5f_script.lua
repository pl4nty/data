-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb338374500\0x00000a5f_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0 = nil
    l_0_0 = (this_sigattrlog[2]).utf8p2
    if l_0_0 ~= "" and l_0_0 ~= nil and not (string.find)(l_0_0, "com.service_now.adme") and not (string.find)(l_0_0, ".ansible") and (isTainted(l_0_0, "remote_file_created_taint_specific") or isTainted(l_0_0, "mounted_file_execution")) then
      (bm.add_related_file)(l_0_0)
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
end

