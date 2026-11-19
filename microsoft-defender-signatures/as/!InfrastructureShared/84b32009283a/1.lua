-- Threat: !InfrastructureShared
-- Name: 84b32009283a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
local l_0_2 = {}
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil or l_0_3.ppid == nil or l_0_3.command_line == nil or l_0_3.command_line == "" then
  return mp.CLEAN
end
if string.find(l_0_3.command_line, "/usr/bin/apt-key", 1, true) or string.find(l_0_3.command_line, "postgres", 1, true) or string.find(l_0_3.command_line, "zypper -qn refresh", 1, true) then
  return mp.CLEAN
end
local l_0_4 = {
  {
    "",
    "/usr/bin/apt-key"
  },
  {
    "",
    "zypper -qn refresh"
  }
}
if checkParentCmdline(l_0_3.ppid, l_0_4, 3) == true then
  return mp.CLEAN
end

function gpgCommandLineSanityCheck(l_1_0, l_1_1)
  if string.find("/usr/bin/gpg", l_1_0, 1, true) ~= 1 and string.find("/usr/bin/gpg2", l_1_0, 1, true) ~= 1 then
    return false
  end
  if string.find(l_1_1, "--ignore-time-conflict", 1, true) or string.find(l_1_1, "--no-sk-comments", 1, true) or string.find(l_1_1, "--enable-progress-filter", 1, true) or string.find(l_1_1, "--enable-special-filenames", 1, true) or string.find(l_1_1, "--check-trustdb", 1, true) or string.find(l_1_1, "--version", 1, true) or string.find(l_1_1, "--with-colons", 1, true) or string.find(l_1_1, "--decrypt", 1, true) or string.find(l_1_1, "--fingerprint", 1, true) then
    return false
  end
  return true
end

for l_0_5 = 1, l_0_0 do
  local l_0_6 = sigattr_tail[l_0_5].attribute
  local l_0_7 = sigattr_tail[l_0_5].utf8p1
  local l_0_8 = sigattr_tail[l_0_5].utf8p2
  if l_0_6 == 16400 and l_0_7 ~= nil and l_0_8 ~= nil and l_0_2[l_0_8] == nil then
    l_0_2[l_0_8] = true
    if gpgCommandLineSanityCheck(l_0_7, l_0_8) == true then
      l_0_1 = l_0_1 + 1
    end
  end
end
if 10 <= l_0_1 then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_GpgEncryption")
  local l_0_9 = safeJsonSerialize(l_0_2)
  bm.add_related_string("gpg_cmdline", l_0_9, bm.RelatedStringBMReport)
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN
