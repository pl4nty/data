-- Threat: !InfrastructureShared
-- Name: 138b3c9a9b0e7
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if this_sigattrlog[2].matched and not isChildProcByCreatedFlag("onedrive") then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = l_0_2:match("([^\\]+)$")
local l_0_3, l_0_4 = bm.get_process_relationships()
if l_0_3 then
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if l_0_6.ppid and l_0_6.image_path then
      local l_0_7 = string.lower(l_0_6.image_path)
      if string.find(l_0_7, "onedrive", 1, true) then
        l_0_1 = l_0_6.ppid
        break
      end
    end
  end
end
local l_0_8, l_0_9 = startTrackingApp(l_0_1, "OneDrive", "programfiles_targeted", "PFAppTracked")
if not l_0_8 then
  bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_9))
elseif l_0_9.IsNewApp then
  l_0_9.SignatureName = "BM/SetProcAttribOneDrive"
  bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_9))
end
local l_0_10 = mp.GetProcessCommandLine(l_0_0.ppid)
local l_0_11, l_0_12 = CommandLineGrader(l_0_10)
local l_0_13, l_0_14
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1:match("([^\\]+)$") ~= this_sigattrlog[3].utf8p2 then
  local l_0_15 = "RenamedBinary[" .. l_0_1:match("pid:(%d+)") .. "][" .. this_sigattrlog[3].utf8p2 .. "-->" .. l_0_2 .. "]"
  l_0_13, l_0_14 = IncreaseProcessAnomalyScore(l_0_1, 10, l_0_15, "PFAppTracked")
end
local l_0_16 = true

local function l_0_17(l_1_0)
  l_1_0 = mp.ContextualExpandEnvironmentVariables(l_1_0)
  l_1_0 = l_1_0 and string.lower(l_1_0)
  local l_1_1 = {
    "%%?program_?%s?files%%?\\microsoft onedrive\\",
    "\\appdata\\local\\microsoft\\onedrive",
    "\\windows\\system32\\",
    "%system%\\",
    "\\program files %(x86%)\\microsoft onedrive\\",
    "\\windows\\syswow64\\",
    "\\program files.*\\microsoft office",
    "\\windows\\ccmcache",
    "\\windows\\imecache\\"
  }
  return contains(l_1_0, l_1_1, false)
end

if this_sigattrlog[4].matched then
  local l_0_18 = this_sigattrlog[4].utf8p1
  if not l_0_17(l_0_18) then
    if IsPotentiallyClean("CmdLine", "OneDrive" .. ";" .. l_0_2, l_0_12.CommandlineTokens) then
      return mp.CLEAN
    end
    local l_0_19 = "NoneDefaultDirectory[" .. l_0_1:match("pid:(%d+)") .. "][" .. l_0_18 .. "]"
    l_0_13, l_0_14 = IncreaseProcessAnomalyScore(l_0_1, 10, l_0_19, "PFAppTracked")
    l_0_16 = false
  end
end
local l_0_20
if l_0_13 then
  local l_0_21 = {}
  l_0_21.ProcessAttrib = l_0_14
  bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_21), bm.RelatedStringBMReport)
  l_0_20 = true
end
local l_0_22
local l_0_23 = mp.GetParentProcInfo()
if l_0_23 and l_0_23.image_path then
  l_0_22 = l_0_23.image_path:match("([^\\]+)$")
end
l_0_22 = l_0_22 or "None"
local l_0_24 = {}
l_0_24.ParentName = l_0_22
l_0_24.ProcessName = l_0_2
l_0_24.Source = "BM"
l_0_24.SignatureName = "Bm/SetProcAttribOneDrive.A"
l_0_24.TrackedProcess = "OneDrive"
l_0_24.AttributeName = "PFAppTracked"
l_0_24.AttributeCategory = "programfiles_targeted"
l_0_24.CommandlineScoreIndicator = l_0_12
l_0_24.CommandlineScore = l_0_11
local l_0_25 = l_0_22 .. "_" .. l_0_2
if not IsPotentiallyClean("CleanProcessChain", "OneDrive", l_0_2) then
  local l_0_26, l_0_27, l_0_28 = AnomalyTableCheck("Appomaly_ChildProcName", l_0_25, 30, "MarkerRecord_OneDrive")
  if l_0_26 and not l_0_27 then
    l_0_24.AnomalyTableName = "Appomaly_ChildProcName"
    l_0_24.ProcNameWeight = GetProcessNameScore(l_0_2)
    l_0_24.AnomalyTableInfo = l_0_28
    bm.trigger_sig("PFAppChildProcOneDrive", safeJsonSerialize(l_0_24))
  end
end
bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(l_0_24))
if l_0_0.integrity_level then
  l_0_25 = l_0_22 .. "_" .. l_0_2 .. "_" .. l_0_0.integrity_level
  if not IsPotentiallyClean("CleanProcessChainPriv", "OneDrive", l_0_0.integrity_level) then
    local l_0_29, l_0_30, l_0_31 = AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_25, 30, "MarkerRecord_OneDrive")
    if l_0_29 and not l_0_30 then
      l_0_24.AnomalyTableName = "Appomaly_ChildProcPriv"
      l_0_24.AnomalyTableInfo = l_0_31
      l_0_24.Key = l_0_25
      bm.trigger_sig("AnomalousChildPriv", safeJsonSerialize(l_0_24))
    end
  end
end
local l_0_32 = bm.get_imagepath()
l_0_32 = MpCommon.PathToWin32Path(l_0_32)
l_0_32 = NormalizeDirectory(bm.get_imagepath())
if l_0_32 and not l_0_16 then
  l_0_25 = l_0_22 .. "_" .. l_0_32 .. "_" .. l_0_2
  local l_0_33, l_0_34, l_0_35 = AnomalyTableCheck("Appomaly_ChildProcDir", l_0_25, 30, "MarkerRecord_OneDrive")
  if l_0_33 and not l_0_34 then
    l_0_24.AnomalyTableName = "Appomaly_ChildProcDir"
    l_0_24.ProcNameWeight = GetProcessNameScore(l_0_2)
    l_0_24.AnomalyTableInfo = l_0_35
    l_0_24.Key = l_0_25
    bm.trigger_sig("PFAppChildProcDir", safeJsonSerialize(l_0_24))
  end
end
if l_0_20 then
  return mp.INFECTED
end
return mp.CLEAN
