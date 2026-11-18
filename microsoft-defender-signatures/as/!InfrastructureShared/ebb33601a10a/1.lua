-- Threat: !InfrastructureShared
-- Name: ebb33601a10a
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = "pip"
local r0_1, r0_2, r0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local r0_4 = this_sigattrlog[1]
  r0_1 = r0_4.utf8p1
  local r0_5 = r0_1
  r0_4 = r0_5:match("([^\\]+)$")
  r0_1 = r0_4
  r0_4 = this_sigattrlog[1].utf8p2
  local r0_6 = string.lower(r0_4)
  r0_4 = r0_6
  r0_6 = r0_4:match("install%s+%-%-upgrade%s+(.+)")
  r0_2 = r0_6 or r0_4:match("install%s+(.+)") or ""
  r0_6 = r0_2.match
  r0_6 = r0_6(r0_2, "==(.*)")
  r0_3 = r0_6 or ""
else
  r0_1 = nil
  r0_2 = nil
  r0_3 = nil
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  local r0_7 = this_sigattrlog[2]
  r0_1 = r0_7.utf8p1
  local r0_8 = r0_1
  r0_7 = r0_8:match("([^\\]+)$")
  r0_1 = r0_7
  r0_7 = this_sigattrlog[2].utf8p2
  local r0_9 = string.lower(r0_7)
  r0_7 = r0_9
  r0_9 = r0_7:match("install%s+%-%-upgrade%s+(.+)")
  r0_2 = r0_9 or r0_7:match("install%s+(.+)") or ""
  r0_9 = r0_2.match
  r0_9 = r0_9(r0_2, "==(.*)")
  r0_3 = r0_9 or ""
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  local r0_10 = this_sigattrlog[3]
  r0_1 = r0_10.utf8p1
  local r0_11 = r0_1
  r0_10 = r0_11:match("([^\\]+)$")
  r0_1 = r0_10
  r0_10 = this_sigattrlog[3].utf8p2
  local r0_12 = string.lower(r0_10)
  r0_10 = r0_12
  r0_1, r0_2, r0_0 = r0_1, r0_10:match("cargo%s+install%s+(.+)"), "cargo"
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  local r0_13 = this_sigattrlog[4]
  r0_1 = r0_13.utf8p1
  local r0_14 = r0_1
  r0_13 = r0_14:match("([^\\]+)$")
  r0_1 = r0_13
  r0_13 = this_sigattrlog[4].utf8p2
  local r0_15 = string.lower(r0_13)
  r0_13 = r0_15
  r0_1, r0_2, r0_0 = r0_1, r0_13:match("cargo%s+add%s+(.+)"), "cargo"
end
if r0_1 then
  local r0_16 = {}
  local r0_17 = { name = r0_2, version = r0_3 }
  r0_16.PackageInfo = r0_17
  r0_16.ParentName = r0_1
  r0_17 = nil
  local r0_18 = bm.get_process_relationships()
  if r0_18 then
    local r0_19, r0_20, r0_21 = ipairs(r0_18)
    for r0_22, r0_23 in r0_19, r0_20, r0_21 do
      if r0_23.ppid and r0_23.image_path then
        local r0_24 = string.lower(r0_23.image_path)
        local r0_25 = string.find(r0_24, "pip.exe", 1, true)
        if r0_25
          or string.find(r0_24, "pip3.exe", 1, true)
          or string.find(r0_24, "cargo.exe", 1, true) then
          r0_17 = r0_23.ppid
          break
        end
      end
    end
  end
  if r0_17 then
    local r0_26, r0_27 = startTrackingApp(r0_17, "pip", "programfiles_targeted", "PFAppTracked")
    if r0_26 then
      if r0_27.IsNewApp then
        r0_27.SignatureName = "Bm/PFApp_SuspChildPip.A"
        bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(r0_27))
      end
    else
      bm.trigger_sig("ProcAttribError", safeJsonSerialize(r0_27))
    end
    local r0_28 = bm.get_imagepath
    r0_28 = r0_28() or ""
    local r0_29 = r0_28:match("([^\\]+)$")
    if r0_29 then
      local r0_30 = {}
      r0_30.ProcessName = r0_29
      r0_30.ParentName = r0_1
      r0_30.SignatureName = "Bm/PFApp_SuspChildPip.A"
      r0_30.AttributeName = "PFAppTracked"
      r0_30.AttributeCategory = "programfiles_targeted"
      r0_30.TrackedProcess = r0_0
      local r0_31 = bm.get_current_process_startup_info()
      if r0_31 and r0_31.ppid then
        local r0_32 = mp.GetProcessCommandLine(r0_31.ppid)
        local r0_33, r0_34 = CommandLineGrader(r0_32)
        r0_30.CommandlineScoreIndicator = r0_34
        r0_30.CommandlineScore = r0_33
      end
      local r0_35, r0_36 = r0_1, r0_29
      r0_35 = r0_35 .. "_" .. r0_36
      local r0_37 = AnomalyTableCheck
      r0_36 = "Appomaly_ChildProcName"
      local r0_38, r0_39, r0_40 = r0_37(r0_36, r0_35, 30, "MarkerRecord_Pip")
      if r0_38 and not r0_39 then
        r0_30.AnomalyTableName = "Appomaly_ChildProcName"
        r0_30.AnomalyTableInfo = r0_40
        r0_30.Key = r0_35
        bm.trigger_sig("PFAppChildProc_F", safeJsonSerialize(r0_30))
      end
      if r0_2 then
        local r0_41 = r0_1
        local r0_42, r0_43, r0_44 = r0_29, "_", r0_2
        r0_41 = r0_41 .. "_" .. r0_42 .. r0_43 .. r0_44
        local r0_45 = AnomalyTableCheck
        r0_42 = "Appomaly_ChildProcName"
        r0_43 = r0_41
        r0_44 = 30
        local r0_46 = r0_2
        local r0_47 = "MarkerRecord_Pip_" .. r0_46
        r0_46 = nil
        local r0_48, r0_49, r0_50 = r0_45(r0_42, r0_43, r0_44, r0_47)
        if r0_48 and not r0_49 then
          r0_30.AnomalyTableName = "Appomaly_ChildProcName"
          r0_30.AnomalyTableInfo = r0_50
          r0_30.Key = r0_41
          bm.trigger_sig("PFAppChildProc_F", safeJsonSerialize(r0_30))
        end
      end
      bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(r0_30))
    end
  end
  local r0_51, r0_52 = safeJsonSerialize(r0_16)
  bm.add_related_string("Evidence", r0_51 or r0_52 or "", bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
