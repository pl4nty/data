-- Threat: !InfrastructureShared
-- Name: 42eb3be4a8483
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "agentexecutor.exe",
  "acrodist.exe"
}) then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[6].matched
local l_0_1 = this_sigattrlog[7].matched
local l_0_2 = this_sigattrlog[8].matched
local l_0_3 = this_sigattrlog[9].matched
local l_0_4 = this_sigattrlog[10].matched
local l_0_5 = this_sigattrlog[11].matched
if not l_0_0 and not l_0_1 and not l_0_2 and not l_0_3 and not l_0_4 and not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = bm.get_imagepath()
if l_0_6 == nil then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if string.find(l_0_6, "\\windows defender\\msmpeng.exe", 1, true) or string.find(l_0_6, "\\windows defender advanced threat protection\\", 1, true) then
  return mp.CLEAN
end
local l_0_7 = "unknown"
local l_0_8 = ""
if l_0_0 then
  l_0_7 = "QueueUserAPC"
  if this_sigattrlog[6].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[6].utf8p2)
  end
elseif l_0_1 then
  l_0_7 = "MapViewOfSection"
  if this_sigattrlog[7].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[7].utf8p2)
  end
elseif l_0_2 then
  l_0_7 = "WriteProcessMemory"
  if this_sigattrlog[8].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[8].utf8p2)
  end
elseif l_0_3 then
  l_0_7 = "VirtualAllocEx"
  if this_sigattrlog[9].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[9].utf8p2)
  end
elseif l_0_4 then
  l_0_7 = "VirtualProtectEx"
  if this_sigattrlog[10].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[10].utf8p2)
  end
elseif l_0_5 then
  l_0_7 = "SetThreadContext"
  if this_sigattrlog[11].utf8p2 then
    l_0_8 = string.lower(this_sigattrlog[11].utf8p2)
  end
end
local l_0_9 = ""
local l_0_10 = ""
if l_0_8 ~= "" then
  local l_0_11, l_0_12 = pcall(string.match, l_0_8, "vmbaseaddress:(%d+)")
  if l_0_11 and l_0_12 then
    l_0_9 = l_0_12
  end
  local l_0_13, l_0_14 = pcall(string.match, l_0_8, "vmregionsize:(%d+)")
  if l_0_13 and l_0_14 then
    l_0_10 = l_0_14
  end
  if l_0_10 == "" then
    local l_0_15, l_0_16 = pcall(string.match, l_0_8, "vmbytescopied:(%d+)")
    if l_0_15 and l_0_16 then
      l_0_10 = l_0_16
    end
  end
  if l_0_10 == "" then
    local l_0_17, l_0_18 = pcall(string.match, l_0_8, "localvmallocregionsize:(%d+)")
    if l_0_17 and l_0_18 then
      l_0_10 = l_0_18
    end
  end
end
if this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_19 = mp.GetExecutablesFromCommandLine(this_sigattrlog[2].utf8p2)
  for l_0_20, l_0_21 in ipairs(l_0_19) do
    if sysio.IsFileExists(l_0_21) then
      bm.add_related_file(l_0_21)
    end
  end
end
bm.add_related_string("INJECTION_TECHNIQUE: ", l_0_7, bm.RelatedStringBMReport)
bm.add_related_string("SOURCE_IMAGE: ", l_0_6, bm.RelatedStringBMReport)
if l_0_9 ~= "" then
  bm.add_related_string("SHELLCODE_ADDRESS: ", l_0_9, bm.RelatedStringBMReport)
end
if l_0_10 ~= "" then
  bm.add_related_string("SHELLCODE_SIZE: ", l_0_10, bm.RelatedStringBMReport)
end
TrackPidAndTechniqueBM("BM", "T1055", "Behavior:Win32/SusPowerShellExecution.MK!Ofn")
bm.add_action("SmsAsyncScanEvent", 5000)
bm.add_action("EmsScan", 1000)
add_parents()
return mp.INFECTED
