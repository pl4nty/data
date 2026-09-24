-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b3db5c9af1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (l_0_1:gsub("\\", "/")):lower()
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
    local l_0_11 = {}
    l_0_11.publisher = l_0_5
    l_0_11.name = l_0_7
    l_0_11.version = l_0_8
    l_0_11.target = l_0_10
    l_0_3 = l_0_11
  end
end
do
  if not l_0_3.name then
    return mp.CLEAN
  end
  local l_0_12 = safeJsonSerialize(l_0_3)
  do
    if l_0_12 then
      local l_0_13 = 2592000
      AppendToRollingQueue("InstalledExtensions_VSCode", l_0_12, 1, l_0_13, 500, 1)
    end
    local l_0_14 = l_0_3.name
    if l_0_3.publisher and l_0_3.publisher ~= "" then
      l_0_14 = l_0_3.publisher .. "." .. l_0_3.name
    end
    local l_0_15, l_0_16 = startTrackingApp(l_0_0.ppid, "VSCodeExtension" .. l_0_14, "programfiles_targeted", "PFAppTracked")
    if not l_0_15 then
      (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(l_0_16))
    else
      if l_0_16.IsNewApp then
        l_0_16.SignatureName = "Bm/PFApp_SuspVSExt.A"
        ;
        (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_16))
      end
    end
    do
      local l_0_17, l_0_18 = (bm.get_imagepath)() or ""
      -- DECOMPILER ERROR at PC124: Confused about usage of register: R11 in 'UnsetPending'

      local l_0_19 = nil
      local l_0_20 = (l_0_17:match("([^\\]+)$"))
      local l_0_21 = nil
      if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
        l_0_21 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
      end
      if not l_0_21 then
        l_0_21 = "None"
      end
      if l_0_20 then
        local l_0_22 = nil
        local l_0_23 = {ProcessName = l_0_20, ParentName = l_0_21, SignatureName = "Bm/PFApp_SuspVSExtension.A", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", TrackedProcess = "VSCodeExtensions" .. l_0_14, Commandline = l_0_2, ExtensionInfo = l_0_14}
        local l_0_24, l_0_25, l_0_26 = , AnomalyTableCheck("Appomaly_ChildProcName_2", l_0_14 .. "_" .. l_0_20, 30, "MarkerRecord_VSCodeExtensions" .. l_0_14)
        if l_0_25 and not l_0_26 then
          l_0_23.AnomalyTableName = "Appomaly_ChildProcName_2"
          l_0_23.AnomalyTableInfo = l_0_14 .. "_" .. l_0_20
          ;
          (bm.trigger_sig)("PFAppChildProc_VSCodeExt", safeJsonSerialize(l_0_23))
        end
      end
      do
        return mp.CLEAN
      end
    end
  end
end

