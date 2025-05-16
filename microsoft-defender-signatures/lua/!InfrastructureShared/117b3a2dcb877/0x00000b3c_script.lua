-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\117b3a2dcb877\0x00000b3c_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[3]).matched then
  l_0_0 = (this_sigattrlog[3]).utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if isTainted(l_0_0, "new_script_file_created_hint") or isTainted(l_0_0, "new_archive_file_created_hint") or isTainted(l_0_0, "new_elf_file_created_hint") then
  taint(l_0_0, "remote_file_created_taint", 3600)
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.trigger_sig)("PossibleNonElfDownload", l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_RemoteFileCopy")
else
  local l_0_1 = (string.match)(l_0_0, "([^/]+)$")
  if not l_0_1 or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = (string.match)(l_0_1, "(%.[^%.%s]+)%s*$")
  if l_0_2 ~= nil or l_0_2 ~= "" then
    local l_0_3 = {}
    l_0_3[".doc"] = true
    l_0_3[".xls"] = true
    l_0_3[".mp3"] = true
    l_0_3[".mp4"] = true
    l_0_3[".jpg"] = true
    l_0_3[".jpeg"] = true
    l_0_3[".exe"] = true
    l_0_3[".html"] = true
    l_0_3[".docx"] = true
    l_0_3[".xlsx"] = true
    l_0_2 = (l_0_2.lower)()
    if l_0_3[l_0_2] then
      taint(l_0_0, "remote_file_created_taint", 3600)
      ;
      (bm.add_related_file)(l_0_0)
      ;
      (bm.trigger_sig)("PossibleNonElfDownload", l_0_0)
      addRelatedProcess()
      reportRelatedBmHits()
      TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_RemoteFileCopy")
    end
  end
end
do
  return mp.CLEAN
end

