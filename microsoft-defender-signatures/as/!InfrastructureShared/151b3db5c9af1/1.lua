-- Threat: !InfrastructureShared
-- Name: 151b3db5c9af1
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:gsub("\\", "/"):lower()
local l_0_3 = {}
local l_0_4 = l_0_2:match("%.vscode[%w%-]*/extensions/([^/]+)/")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = l_0_4:match("^([^.]+)%.(.+)$")
if l_0_5 and l_0_6 then
  local l_0_7, l_0_8, l_0_9 = l_0_6:match("^(.-)%-(%d+%.%d+%.%d+)(.*)$")
  if l_0_7 and l_0_8 then
    local l_0_10 = l_0_9:match("^%-(.+)$")
    l_0_3 = {
      publisher = l_0_5,
      name = l_0_7,
      version = l_0_8,
      target = l_0_10
    }
  end
end
if not l_0_3.name then
  return mp.CLEAN
end
local l_0_11 = safeJsonSerialize(l_0_3)
if l_0_11 then
  local l_0_12 = 2592000
  AppendToRollingQueue("InstalledExtensions_VSCode", l_0_11, 1, l_0_12, 500, 1)
end
local l_0_13 = l_0_3.name
if l_0_3.publisher and l_0_3.publisher ~= "" then
  l_0_13 = l_0_3.publisher .. "." .. l_0_3.name
end
local l_0_14, l_0_15 = startTrackingApp(l_0_0.ppid, "VSCodeExtension" .. l_0_13, "programfiles_targeted", "PFAppTracked")
if not l_0_14 then
  bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_15))
elseif l_0_15.IsNewApp then
  l_0_15.SignatureName = "Bm/PFApp_SuspVSExt.A"
  bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_15))
end
local l_0_16 = bm.get_imagepath() or ""
local l_0_17 = l_0_16:match("([^\\]+)$")
local l_0_18
local l_0_19 = mp.GetParentProcInfo()
if l_0_19 and l_0_19.image_path then
  l_0_18 = l_0_19.image_path:match("([^\\]+)$")
end
l_0_18 = l_0_18 or "None"
if l_0_17 then
  local l_0_20 = {}
  l_0_20.ProcessName = l_0_17
  l_0_20.ParentName = l_0_18
  l_0_20.SignatureName = "Bm/PFApp_SuspVSExtension.A"
  l_0_20.AttributeName = "PFAppTracked"
  l_0_20.AttributeCategory = "programfiles_targeted"
  l_0_20.TrackedProcess = "VSCodeExtensions" .. l_0_13
  l_0_20.Commandline = l_0_2
  l_0_20.ExtensionInfo = l_0_13
  local l_0_21 = l_0_13 .. "_" .. l_0_17
  local l_0_22, l_0_23, l_0_24 = AnomalyTableCheck("Appomaly_ChildProcName_2", l_0_21, 30, "MarkerRecord_VSCodeExtensions" .. l_0_13)
  if l_0_22 and not l_0_23 then
    l_0_20.AnomalyTableName = "Appomaly_ChildProcName_2"
    l_0_20.AnomalyTableInfo = l_0_24
    bm.trigger_sig("PFAppChildProc_VSCodeExt", safeJsonSerialize(l_0_20))
  end
end
return mp.CLEAN
