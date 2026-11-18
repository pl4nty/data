-- Threat: !InfrastructureShared
-- Name: 35b312cc9afc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = l_0_0.command_line
  local l_0_2 = string.lower(l_0_1)
  local l_0_3 = l_0_2:match("%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+")
  if not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = bm.get_process_relationships()
  for l_0_6, l_0_7 in ipairs(l_0_4) do
    local l_0_8 = l_0_7.cmd_line
    if l_0_8 ~= nil then
      l_0_8 = string.lower(l_0_8)
      local l_0_9 = l_0_8:match("\\([^\\]+)$")
      local l_0_10 = {
        ["ruby.exe"] = true,
        ["compattelrunner.exe"] = true,
        ["choco.exe"] = true,
        ["senseir.exe"] = true,
        ["gpscript.exe"] = true,
        ["wuauclt.exe"] = true,
        ["dismhost.exe"] = true
      }
      if l_0_10[l_0_9] then
        return mp.CLEAN
      end
    end
  end
  local l_0_11 = GetTacticsTableForPid(l_0_0.ppid)
  if l_0_11 ~= nil and type(l_0_11) == "table" then
    local l_0_12 = 0
    if IsTacticObservedForPid(l_0_0.ppid, "obfuscation_") or IsTacticObservedForParents(l_0_0.ppid, "obfuscation_", 2) then
      l_0_12 = l_0_12 + 1
    end
    if l_0_11.winrshost_childproc or l_0_11.wsmprovhost_childproc or l_0_11.wmi_childproc or l_0_11.remotedropexe_childproc or l_0_11.python_childproc or l_0_11.rundll32_childproc or l_0_11.wscript_childproc or l_0_11.cscript_childproc or l_0_11.mshta_childproc or l_0_11.webshell_childproc or l_0_11.exec_remotedroppedscript_a or l_0_11.folderguard_blk or l_0_11.folderguard_folder_blk then
      l_0_12 = l_0_12 + 1
    end
    if l_0_11.amsitampering then
      l_0_12 = l_0_12 + 1
    end
    if l_0_11.processinjection_target_remoteinitiated_a or l_0_11.processinjection_target_remoteinitiated_b or l_0_11.processinjection_target_remoteinitiated_c then
      l_0_12 = l_0_12 + 1
    end
    if 2 < l_0_12 then
      TrackPidAndTechniqueBM(l_0_0.ppid, "T1027", "tt-remediate")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
