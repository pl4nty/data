-- Threat: !InfrastructureShared
-- Name: 32b3eab2e68c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_3)
local l_0_5 = {
  ".nib",
  ".png",
  ".jpeg",
  ".jpg",
  ".pdf",
  ".docx",
  ".dmg",
  ".pkg",
  ".doc",
  ".ppt",
  ".pptx",
  ".xls",
  ".xlsx",
  ".mp4",
  ".mp3",
  ".heif",
  ".mkv"
}
if string.find(l_0_4, "/contents/macos/", 1, true) then
  local l_0_6 = string.match(l_0_4, "(.-)/contents")
  for l_0_7, l_0_8 in pairs(l_0_5) do
    local l_0_9 = string.len(l_0_8)
    if l_0_8 ~= nil and string.find(l_0_6, l_0_8, -l_0_9, true) then
      if sysio.IsFileExists(l_0_3) then
        bm.add_threat_file(l_0_3)
      end
      if SuspMacPathsToMonitor(l_0_2, true) or string.find(l_0_2, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_2, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_2, "/Users/[^/]+/Desktop/", 1, false) then
        TrackPidAndTechniqueBM("BM", "T1036.008", "DefenseEvasion_PRI1_Masquerading_FileType")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
