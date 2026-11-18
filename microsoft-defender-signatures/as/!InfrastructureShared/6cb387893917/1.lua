-- Threat: !InfrastructureShared
-- Name: 6cb387893917
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "/bin/tar", -8, true) then
  local l_0_2 = 0
  for l_0_3 in string.gmatch(l_0_0.command_line, "/var/log/recap") do
    l_0_2 = l_0_2 + 1
  end
  if 15 < l_0_2 then
    return mp.CLEAN
  end
end

function CheckCriticalFilesArchived(l_1_0)
  local l_1_1 = {
    ".db[^/%w]",
    ".sql[^/%w]",
    ".key[^/%w]",
    ".conf[^/%w]",
    ".doc?[^/%w]",
    ".pdf[^/%w]",
    ".xls?[^/%w]",
    ".ppt?[^/%w]",
    ".sh[^/%w]",
    ".c[^/%w]",
    ".cpp[^/%w]"
  }
  for l_1_2, l_1_3 in pairs(l_1_1) do
    local l_1_4 = 0
    for l_1_5 in string.gmatch(l_1_0, l_1_3) do
      l_1_4 = l_1_4 + 1
    end
    if 15 < l_1_4 then
      return true
    end
  end
  return false
end

if (string.find(l_0_1, "/bin/zip", -8, true) or string.find(l_0_1, "/bin/tar", -8, true) or string.find(l_0_1, "/bin/gzip", -9, true) or string.find(l_0_1, "/7z", -3, true) or string.find(l_0_1, "/usr/bin/file-roller", 1, true) == 1 or string.find(l_0_1, "/7zz", -4, true)) and CheckCriticalFilesArchived(l_0_0.command_line) then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1560", "Collection_ArchiveData")
  return mp.INFECTED
end
return mp.CLEAN
