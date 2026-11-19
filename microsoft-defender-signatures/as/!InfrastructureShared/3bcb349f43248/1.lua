-- Threat: !InfrastructureShared
-- Name: 3bcb349f43248
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if not is_excluded_parent_proc_auto()
  and IsSenseRelatedProc() ~= true
  and not IsProcNameInParentProcessTree("BM",
    {
      "csrss.exe", "aw.protectionagent.powershellexecutor64.exe",
      "vmware.hub.sfdagent.deploycmd.exe", "agentexecutor.exe", "pdzipservice.exe",
      "santivirusic.exe", "segurazoic.exe", "svservice.exe", "amagentassist.exe",
      "bdantiransomware.exe", "acrodist.exe"
    }) then
  local r0_0 = this_sigattrlog[12].matched
  local r0_1 = this_sigattrlog[13].matched
  local r0_2 = this_sigattrlog[14].matched
  local r0_3 = this_sigattrlog[15].matched
  if not r0_0 and not r0_1 and not r0_2 and not r0_3 then
    return mp.CLEAN
  end
  local r0_4 = bm.get_imagepath()
  if isnull(r0_4) then
    return mp.CLEAN
  end
  r0_4 = string.lower(r0_4)
  if not string.find(r0_4, "\\windows defender\\msmpeng.exe", 1, true)
    and not string.find(r0_4, "\\windows defender advanced threat protection\\", 1, true) then
    local r0_5 = bm.get_current_process_startup_info()
    if isnull(r0_5) then
      return mp.CLEAN
    end
    local r0_6, r0_7 = "unknown", ""
    if r0_0 then
      r0_6 = "QueueUserAPC"
      if this_sigattrlog[12].utf8p2 then
        r0_7 = string.lower(this_sigattrlog[12].utf8p2)
      end
    elseif r0_1 then
      r0_6 = "MapViewOfSection"
      if this_sigattrlog[13].utf8p2 then
        r0_7 = string.lower(this_sigattrlog[13].utf8p2)
      end
    elseif r0_2 then
      r0_6 = "WriteProcessMemory"
      if this_sigattrlog[14].utf8p2 then
        r0_7 = string.lower(this_sigattrlog[14].utf8p2)
      end
    elseif r0_3 then
      r0_6 = "VirtualAllocEx"
      if this_sigattrlog[15].utf8p2 then
        r0_7 = string.lower(this_sigattrlog[15].utf8p2)
      end
    end
    local r0_8, r0_9 = "", ""
    if r0_7 ~= "" then
      local r0_10, r0_11 = pcall(string.match, r0_7, "vmbaseaddress:(%d+)")
      r0_8 = r0_10 and r0_11 or r0_8
      local r0_12, r0_13 = pcall(string.match, r0_7, "vmregionsize:(%d+)")
      r0_9 = r0_12 and r0_13 or r0_9
      local r0_14, r0_15
      r0_9 = r0_9 == "" and r0_14 and r0_15 or r0_9
      if r0_9 == "" then
        local r0_16, r0_17 = pcall(string.match, r0_7, "localvmallocregionsize:(%d+)")
        if r0_16 and r0_17 then
          r0_9 = r0_17
        end
      end
    end
    local r0_18 = string.match(r0_4, "\\([^\\]+)$") or "unknown"
    local r0_19 = {
      ["smartscreen.exe"] = true, ["runtimebroker.exe"] = true, ["dllhost.exe"] = true,
      ["consent.exe"] = true, ["sihost.exe"] = true, ["taskhostw.exe"] = true,
      ["backgroundtaskhost.exe"] = true, ["searchprotocolhost.exe"] = true, ["werfault.exe"] = true,
      ["audiodg.exe"] = true, ["fontdrvhost.exe"] = true, ["conhost.exe"] = true, ["mrt.exe"] = true
    }
    local r0_20 = r0_19[r0_18] or false
    bm.add_related_string("INJECTION_TECHNIQUE: ", r0_6, bm.RelatedStringBMReport)
    bm.add_related_string("TARGET_PROCESS: ", r0_18, bm.RelatedStringBMReport)
    bm.add_related_string("TARGET_IMAGE_PATH: ", r0_4, bm.RelatedStringBMReport)
    bm.add_related_string("HIGH_VALUE_TARGET: ", tostring(r0_20), bm.RelatedStringBMReport)
    if r0_8 ~= "" then
      bm.add_related_string("SHELLCODE_ADDRESS: ", r0_8, bm.RelatedStringBMReport)
    end
    if r0_9 ~= "" then
      bm.add_related_string("SHELLCODE_SIZE: ", r0_9, bm.RelatedStringBMReport)
    end
    if r0_5.command_line then
      bm.add_related_string("TARGET_CMDLINE: ", string.lower(r0_5.command_line),
        bm.RelatedStringBMReport)
    end
    local r0_21 = {
      technique = r0_6, mitre_id = "T1055.012", target_process = r0_18, target_path = r0_4,
      high_value = r0_20, shellcode_address = r0_8, shellcode_size = r0_9
    }
    bm.set_detection_string(safeJsonSerialize(r0_21))
    TrackPidAndTechniqueBM(r0_5.ppid, "T1055.012", "earlybird_apc_injection_target")
    bm.add_action("SmsAsyncScanEvent", 5000)
    bm.add_action("EmsScan", 1000)
    add_parents()
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
