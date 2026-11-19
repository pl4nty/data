-- Threat: !InfrastructureShared
-- Name: 5bb3ebf3c085
-- Type: 21
-- Includes: BMLuaLib

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = l_1_0 .. " "
  
  local l_1_3 = l_1_1 .. ".exe"
  for l_1_4, l_1_5 in string.gmatch(l_1_2, "([^%s\"'\\/|;&(]+)()") do
    if (l_1_4 == l_1_1 or l_1_4 == l_1_3) and string.find(string.sub(l_1_2, l_1_5, l_1_5), "[%s\"']") then
      return true
    end
  end
  return false
end

local function l_0_1(l_2_0)
  if type(l_2_0) ~= "string" or l_2_0 == "" then
    return false
  end
  l_2_0 = string.lower(l_2_0)
  local l_2_1 = string.find(l_2_0, "http://", 1, true) or string.find(l_2_0, "https://", 1, true)
  if not l_2_1 then
    return false
  end
  local l_2_2 = {
    "invoke-webrequest",
    "invoke-restmethod"
  }
  if contains(l_2_0, l_2_2) then
    return true
  end
  if string.find(l_2_0, "%.downloadstring%s*%(") or string.find(l_2_0, "%.downloadfile%s*%(") then
    return true
  end
  local l_2_3 = l_2_0 .. " "
  if l_0_0(l_2_0, "bitsadmin") and string.find(l_2_3, "/transfer[%s\"']") and not string.find(l_2_3, "/upload[%s\"']") then
    return true
  end
  if contains(l_2_0, "start-bitstransfer") and string.find(l_2_0, "%-source%s+[\"']?https?://") then
    return true
  end
  if string.find(l_2_0, "[%s\"'(|;=,]iwr[%s\"'(]") then
    return true
  end
  if string.find(l_2_0, "[%s\"'(|;=,]irm[%s\"'(]") then
    return true
  end
  if l_0_0(l_2_0, "curl") or l_0_0(l_2_0, "wget") then
    return true
  end
  if string.find(l_2_0, "certutil", 1, true) and (string.find(l_2_0, "-urlcache", 1, true) or string.find(l_2_0, "http", 1, true)) then
    return true
  end
  if string.find(l_2_0, "msiexec", 1, true) and string.find(l_2_0, "http", 1, true) then
    return true
  end
  if string.find(l_2_0, "mshta", 1, true) and string.find(l_2_0, "http", 1, true) then
    return true
  end
  return false
end

local l_0_2 = bm.get_current_process_startup_info()
if not l_0_2 or not next(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
if l_0_2.command_line then
  l_0_3[#l_0_3 + 1] = l_0_2.command_line
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 and l_0_4.ppid then
  l_0_3[#l_0_3 + 1] = mp.GetProcessCommandLine(l_0_4.ppid)
end
local l_0_5, l_0_6, l_0_7 = pcall(bm.get_process_relationships, l_0_2.ppid)
if l_0_5 then
  if type(l_0_6) == "table" then
    for l_0_8, l_0_9 in ipairs(l_0_6) do
      if l_0_9.ppid then
        l_0_3[#l_0_3 + 1] = mp.GetProcessCommandLine(l_0_9.ppid)
      end
    end
  end
  if type(l_0_7) == "table" then
    for l_0_10, l_0_11 in ipairs(l_0_7) do
      if l_0_11.ppid then
        l_0_3[#l_0_3 + 1] = mp.GetProcessCommandLine(l_0_11.ppid)
      end
    end
  end
end
local l_0_12 = {
  "169.254.169.254",
  "metadata.google",
  "metadata.azure",
  "\\.vscode\\extensions\\"
}
local l_0_13
for l_0_14, l_0_15 in ipairs(l_0_3) do
  if not l_0_13 and l_0_1(l_0_15) and not contains(l_0_15, l_0_12) then
    l_0_13 = l_0_15
  end
end
if not l_0_13 then
  return mp.CLEAN
end
local l_0_16 = string.lower(l_0_13)
local l_0_17 = ""
if l_0_4 and l_0_4.image_path then
  l_0_17 = string.lower(l_0_4.image_path)
end
if contains(l_0_17, {
  "agentexecutor.exe",
  "\\code.exe",
  "windowsterminal.exe",
  "consctlx.exe",
  "reload.exe",
  "\\escan\\"
}) then
  return mp.CLEAN
end
if contains(l_0_16, {"runmru", "\\run\\"}) or contains(l_0_17, {
  "\\explorer.exe",
  "\\mshta.exe"
}) then
  bm.add_related_string("[->] CLICKFIX ORIGIN: ", l_0_17, bm.RelatedStringBMReport)
end
bm.add_related_string("[->] CLICKFIX DOWNLOADER (AMSI-corroborated): ", l_0_13, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_16, nil, nil, 1)
if l_0_2.ppid then
  bm.request_SMS(l_0_2.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailClickFixDownloader.AM")
add_parents()
return mp.INFECTED
