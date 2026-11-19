-- Threat: !InfrastructureShared
-- Name: 416b3f9496444
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "agentexecutor.exe",
  "acrodist.exe"
}) then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].matched or this_sigattrlog[3].matched or this_sigattrlog[4].matched
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[5].matched
local l_0_2 = this_sigattrlog[6].matched
local l_0_3 = this_sigattrlog[7].matched
local l_0_4 = this_sigattrlog[8].matched
local l_0_5 = this_sigattrlog[9].matched
local l_0_6 = this_sigattrlog[10].matched
if not l_0_1 and not l_0_2 and not l_0_3 and not l_0_4 and not l_0_5 and not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = bm.get_imagepath()
if isnull(l_0_7) then
  return mp.CLEAN
end
l_0_7 = string.lower(l_0_7)
if string.find(l_0_7, "\\windows defender\\msmpeng.exe", 1, true) or string.find(l_0_7, "\\windows defender advanced threat protection\\", 1, true) then
  return mp.CLEAN
end
local l_0_8 = "unknown"
local l_0_9 = ""
if l_0_1 then
  l_0_8 = "QueueUserAPC"
  if this_sigattrlog[5].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[5].utf8p2)
  end
elseif l_0_2 then
  l_0_8 = "MapViewOfSection"
  if this_sigattrlog[6].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[6].utf8p2)
  end
elseif l_0_3 then
  l_0_8 = "WriteProcessMemory"
  if this_sigattrlog[7].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[7].utf8p2)
  end
elseif l_0_4 then
  l_0_8 = "VirtualAllocEx"
  if this_sigattrlog[8].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[8].utf8p2)
  end
elseif l_0_5 then
  l_0_8 = "VirtualProtectEx"
  if this_sigattrlog[9].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[9].utf8p2)
  end
elseif l_0_6 then
  l_0_8 = "SetThreadContext"
  if this_sigattrlog[10].utf8p2 then
    l_0_9 = string.lower(this_sigattrlog[10].utf8p2)
  end
end
local l_0_10 = ""
local l_0_11 = ""
if l_0_9 ~= "" then
  local l_0_12, l_0_13 = pcall(string.match, l_0_9, "vmbaseaddress:(%d+)")
  if l_0_12 and l_0_13 then
    l_0_10 = l_0_13
  end
  local l_0_14, l_0_15 = pcall(string.match, l_0_9, "vmregionsize:(%d+)")
  if l_0_14 and l_0_15 then
    l_0_11 = l_0_15
  end
  if l_0_11 == "" then
    local l_0_16, l_0_17 = pcall(string.match, l_0_9, "vmbytescopied:(%d+)")
    if l_0_16 and l_0_17 then
      l_0_11 = l_0_17
    end
  end
  if l_0_11 == "" then
    local l_0_18, l_0_19 = pcall(string.match, l_0_9, "localvmallocregionsize:(%d+)")
    if l_0_18 and l_0_19 then
      l_0_11 = l_0_19
    end
  end
end
local l_0_20
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_20 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_20 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_20 = this_sigattrlog[4].utf8p2
end
if l_0_20 ~= nil then
  local l_0_21 = mp.GetExecutablesFromCommandLine(string.lower(l_0_20))
  for l_0_22, l_0_23 in ipairs(l_0_21) do
    if sysio.IsFileExists(l_0_23) and string.find(l_0_23, ".dll", 1, true) == nil then
      bm.add_related_file(l_0_23)
    end
  end
end
bm.add_related_string("INJECTION_TECHNIQUE: ", l_0_8, bm.RelatedStringBMReport)
bm.add_related_string("SOURCE_IMAGE: ", l_0_7, bm.RelatedStringBMReport)
if l_0_10 ~= "" then
  bm.add_related_string("SHELLCODE_ADDRESS: ", l_0_10, bm.RelatedStringBMReport)
end
if l_0_11 ~= "" then
  bm.add_related_string("SHELLCODE_SIZE: ", l_0_11, bm.RelatedStringBMReport)
end
TrackPidAndTechniqueBM("BM", "T1055", "Behavior:Win32/SusPowerShellExecution.MK")
bm.add_action("SmsAsyncScanEvent", 5000)
bm.add_action("EmsScan", 1000)
add_parents()
return mp.INFECTED
