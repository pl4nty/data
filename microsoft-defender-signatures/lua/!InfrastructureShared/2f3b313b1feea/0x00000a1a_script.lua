-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f3b313b1feea\0x00000a1a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 ~= nil then
  l_0_1 = (this_sigattrlog[14]).utf8p2
else
  if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p2 ~= nil then
    l_0_1 = (this_sigattrlog[15]).utf8p2
  end
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if isTainted(l_0_1, "remote_file_created_taint") then
  (bm.add_related_file)(l_0_1)
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN

