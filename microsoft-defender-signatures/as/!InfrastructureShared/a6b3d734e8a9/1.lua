-- Threat: !InfrastructureShared
-- Name: a6b3d734e8a9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 60
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find("/usr/bin/gpg", l_0_1, 1, true) ~= 1 and string.find("/usr/bin/gpg2", l_0_1, 1, true) ~= 1 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil or l_0_2.ppid == nil or l_0_2.command_line == nil or l_0_2.command_line == "" then
  return mp.CLEAN
end
local l_0_3 = l_0_2.command_line
if string.find(l_0_3, "/usr/bin/apt-key", 1, true) or string.find(l_0_3, "zypper -qn refresh", 1, true) or string.find(l_0_3, "--ignore-time-conflict", 1, true) or string.find(l_0_3, "--no-sk-comments", 1, true) or string.find(l_0_3, "--enable-progress-filter", 1, true) or string.find(l_0_3, "--enable-special-filenames", 1, true) or string.find(l_0_3, "--check-trustdb", 1, true) or string.find(l_0_3, "--version", 1, true) or string.find(l_0_3, "--fingerprint", 1, true) then
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
if checkParentCmdline(l_0_2.ppid, l_0_4, 3) == true then
  return mp.CLEAN
end
local l_0_5 = mp.GetParentProcInfo()
if l_0_5 == nil or l_0_5.ppid == nil then
  return mp.CLEAN
end
local l_0_6 = l_0_5.ppid .. ":" .. l_0_1 .. ":File_Changed"
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  local l_0_7 = this_sigattrlog[4].utf8p1
  MpCommon.SetPersistContextNoPath(l_0_6, {l_0_7}, l_0_0)
  if analyzeRansomwarePattern5(l_0_6, "NEW_FILE_CREATED") == mp.INFECTED then
    TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
    RemediateProcessTreeForLinux()
    return mp.INFECTED
  end
end
return mp.CLEAN
