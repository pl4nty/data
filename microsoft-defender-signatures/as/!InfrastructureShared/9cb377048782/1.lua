-- Threat: !InfrastructureShared
-- Name: 9cb377048782
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 60
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil or l_0_2.ppid == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.ppid .. ":" .. l_0_1 .. ":File_Renamed"
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_4 = this_sigattrlog[4].utf8p1
  local l_0_5 = this_sigattrlog[4].utf8p2
  local l_0_6 = l_0_4:match("[^>]*[\\/$]")
  local l_0_7 = l_0_5:match("[^>]*[\\/$]")
  local l_0_8 = l_0_4:match("%.[^/%.]+$")
  local l_0_9 = l_0_5:match("%.[^/%.]+$")
  if l_0_7 ~= nil and l_0_6 ~= nil and l_0_6 == l_0_7 and l_0_8 ~= nil and l_0_9 ~= nil and l_0_9 ~= l_0_8 and isFileExtensionOfInterest(l_0_5) and isKnownFileExtension(l_0_4) == false and IsRansomwareProcessImagePathExtensionExcluded(l_0_1, l_0_8) == false then
    MpCommon.SetPersistContextNoPath(l_0_3, {l_0_4}, l_0_0)
    if analyzeRansomwarePattern5(l_0_3, "FILE_RENAMED_WITH_UNIQUE_EXTN") == mp.INFECTED then
      RemediateProcessTreeForLinux()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
