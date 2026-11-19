-- Threat: !InfrastructureShared
-- Name: 117b3a2dcb877
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = ""
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if isTainted(l_0_0, "new_script_file_created_hint") or isTainted(l_0_0, "new_archive_file_created_hint") or isTainted(l_0_0, "new_elf_file_created_hint") then
  taint(l_0_0, "remote_file_created_taint", 3600)
  bm.add_related_file(l_0_0)
  bm.trigger_sig("PossibleNonElfDownload", l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_RemoteFileCopy")
else
  local l_0_1 = string.match(l_0_0, "([^/]+)$")
  if not l_0_1 or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = string.match(l_0_1, "(%.[^%.%s]+)%s*$")
  if l_0_2 ~= nil or l_0_2 ~= "" then
    local l_0_3 = {
      [".doc"] = true,
      [".xls"] = true,
      [".mp3"] = true,
      [".mp4"] = true,
      [".jpg"] = true,
      [".jpeg"] = true,
      [".exe"] = true,
      [".html"] = true,
      [".docx"] = true,
      [".xlsx"] = true
    }
    l_0_2 = l_0_2.lower()
    if l_0_3[l_0_2] then
      taint(l_0_0, "remote_file_created_taint", 3600)
      bm.add_related_file(l_0_0)
      bm.trigger_sig("PossibleNonElfDownload", l_0_0)
      addRelatedProcess()
      reportRelatedBmHits()
      TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_RemoteFileCopy")
    end
  end
end
return mp.CLEAN
