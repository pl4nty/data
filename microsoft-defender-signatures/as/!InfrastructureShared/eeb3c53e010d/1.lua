-- Threat: !InfrastructureShared
-- Name: eeb3c53e010d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 60
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1.ppid == nil or l_0_1.command_line == nil or l_0_1.command_line == "" then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 == nil or l_0_3.ppid == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_3.ppid .. ":" .. l_0_2 .. ":Known_File_Renamed"
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
local l_0_5 = "Ransomware_Analysis_Generic.J"
local l_0_6 = MpCommon.GetPersistContextNoPath(l_0_5)
if l_0_6 ~= nil then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if string.find(l_0_1.ppid, l_0_8, 1, true) == 1 then
      return mp.CLEAN
    end
  end
end
MpCommon.SetPersistContextNoPath(l_0_5, {
  l_0_1.ppid
}, l_0_0)
local l_0_9 = "Ransomware_Analysis_cmd_Generic.J"
local l_0_10 = MpCommon.GetPersistContextNoPath(l_0_9)
if l_0_10 ~= nil then
  for l_0_11, l_0_12 in ipairs(l_0_10) do
    if string.find(l_0_1.command_line, l_0_12, 1, true) == 1 then
      return mp.CLEAN
    end
  end
end
MpCommon.SetPersistContextNoPath(l_0_9, {
  l_0_1.command_line
}, l_0_0)
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_13 = this_sigattrlog[5].utf8p1
  local l_0_14 = this_sigattrlog[5].utf8p2
  local l_0_15 = l_0_13:match("[^>]*[\\/$]")
  local l_0_16 = l_0_14:match("[^>]*[\\/$]")
  local l_0_17 = l_0_13:match("%.[^/%.]+$")
  local l_0_18 = l_0_14:match("%.[^/%.]+$")
  if l_0_16 ~= nil and l_0_15 ~= nil and l_0_15 == l_0_16 and l_0_17 ~= nil and l_0_18 ~= nil and l_0_18 ~= l_0_17 and isFileExtensionOfInterest(l_0_14) and IsRansomwareProcessImagePathExtensionExcluded(l_0_2, l_0_17) == false then
    MpCommon.SetPersistContextNoPath(l_0_4, {l_0_13}, l_0_0)
    if analyzeRansomwarePattern5(l_0_4, "FILE_RENAMED_WITH_KNOWN_EXTN") == mp.INFECTED then
      RemediateProcessTreeForLinux()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
