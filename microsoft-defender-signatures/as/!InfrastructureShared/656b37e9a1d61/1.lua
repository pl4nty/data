-- Threat: !InfrastructureShared
-- Name: 656b37e9a1d61
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "aw.protectionagent.powershellexecutor64.exe",
  "vmware.hub.sfdagent.deploycmd.exe",
  "agentexecutor.exe"
}) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p2
end
local l_0_1, l_0_2 = string.match(l_0_0, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
l_0_2 = tonumber(l_0_2)
local l_0_3 = bm.get_current_process_startup_info()
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_3.ppid
local l_0_5 = bm.GetProcAddress(l_0_4, "rpcrt4.dll", "NdrClientCall3")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = bm.VirtualQuery(l_0_5)
if not l_0_6 or isnull(l_0_7) then
  return mp.CLEAN
end
if l_0_7.base_addr == l_0_1 then
  local l_0_8 = bm.get_imagepath()
  if isnull(l_0_8) then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_8, 300) then
    local l_0_9 = string.lower(l_0_3.command_line)
    bm_AddRelatedFileFromCommandLine(l_0_9, nil, nil, 1)
    bm.add_related_file(l_0_9)
    bm.add_related_string("[->] MALICIOUS SCRIPT: ", l_0_9, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
