-- Threat: !InfrastructureShared
-- Name: 4ab3d6a415bb
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = bm.get_process_relationships()
local r0_1
if r0_0 then
  local r0_2, r0_3, r0_4 = ipairs(r0_0)
  for r0_5, r0_6 in r0_2, r0_3, r0_4 do
    if r0_6.ppid and r0_6.image_path then
      local r0_7 = string.lower(r0_6.image_path)
      local r0_8 = string.find(r0_7, "code.exe", 1, true)
      if r0_8 then
        local r0_9 = sysio.GetPEVersionInfo(r0_7)
        if not r0_9
          or not r0_9.ProductName
          or string.find(r0_9.ProductName, "Visual Studio Code", 1, true) then
          r0_1 = r0_6.ppid
          break
        end
        return mp.CLEAN
      end
    end
  end
end
if r0_1 then
  local r0_10, r0_11 = startTrackingApp(r0_1, "VSCode", "programfiles_targeted", "PFAppTracked")
  if r0_10 then
    if r0_11.IsNewApp then
      r0_11.SignatureName = "Bm/PFApp_SuspChildVS.A"
      bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(r0_11))
    end
  else
    bm.trigger_sig("ProcAttribError", safeJsonSerialize(r0_11))
  end
  local r0_12 = bm.get_imagepath
  r0_12 = r0_12() or ""
  local r0_13 = r0_12:match("([^\\]+)$")
  if r0_13 then
    local r0_14 = {}
    r0_14.ProcessName = r0_13
    r0_14.ParentName = "code.exe"
    r0_14.SignatureName = "Bm/PFApp_SuspChildVS.A"
    r0_14.AttributeName = "PFAppTracked"
    r0_14.AttributeCategory = "programfiles_targeted"
    r0_14.TrackedProcess = "VSCode"
    local r0_15 = bm.get_current_process_startup_info()
    if r0_15 and r0_15.ppid then
      local r0_16 = mp.GetProcessCommandLine(r0_15.ppid)
      local r0_17, r0_18 = CommandLineGrader(r0_16)
      r0_14.CommandlineScoreIndicator = r0_18
      r0_14.CommandlineScore = r0_17
    end
    local r0_19, r0_20 = "Code.exe", r0_13
    r0_19 = r0_19 .. "_" .. r0_20
    local r0_21 = AnomalyTableCheck
    r0_20 = "Appomaly_ChildProcName_2"
    local r0_22, r0_23, r0_24 = r0_21(r0_20, r0_19, 30, "MarkerRecord_VSCode")
    if r0_22 and not r0_23 then
      r0_14.AnomalyTableName = "Appomaly_ChildProcName_2"
      r0_14.AnomalyTableInfo = r0_24
      bm.trigger_sig("PFAppChildProc_G", safeJsonSerialize(r0_14))
    end
    bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(r0_14))
  end
end
return mp.CLEAN
