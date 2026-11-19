-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ClickFixRDia.SC
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: MpIsRunDialogAmsiScan

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 == 0 or 700 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage) or tostring(footerpage)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = mp.utf16to8(l_0_1)
if 512 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = false
local l_0_4
local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_5 and type(l_0_6) == "string" and 0 < #l_0_6 then
  l_0_4 = l_0_6
  local l_0_7 = string.lower(l_0_6)
  if string.sub(l_0_7, 1, 7) == "http://" or string.sub(l_0_7, 1, 8) == "https://" then
    l_0_3 = true
  end
end
local l_0_8 = {
  "mshta",
  "mshta.exe",
  "regsvr32",
  "regsvr32.exe",
  "certutil",
  "certutil.exe",
  "bitsadmin",
  "bitsadmin.exe",
  "curl.exe",
  "wmic",
  "wmic.exe",
  "installutil",
  "msbuild",
  "regasm",
  "regsvcs",
  "ieexec",
  "hh.exe",
  "cmstp",
  "cmstp.exe",
  "forfiles",
  "forfiles.exe",
  "pcalua",
  "scriptrunner",
  "tftp.exe"
}
local l_0_9 = {
  "wscript",
  "cscript",
  "rundll32",
  "rundll32.exe",
  "msiexec",
  "msiexec.exe",
  "ftp.exe",
  "conhost",
  "wsl.exe",
  "wsl ",
  "pwsh",
  "pwsh.exe",
  "psexec"
}
local l_0_10 = {
  "powershell",
  "cmd.exe",
  "cmd /c",
  "cmd /k",
  "cmd /r",
  "cmd.exe /"
}
local l_0_11 = 0
if contains(l_0_2, l_0_8) then
  l_0_11 = 3
elseif contains(l_0_2, l_0_9) then
  l_0_11 = 2
elseif contains(l_0_2, l_0_10) then
  l_0_11 = 1
end
if l_0_11 == 0 then
  return mp.CLEAN
end
local l_0_12 = {
  "invoke-expression",
  " iex ",
  " iex(",
  "|iex",
  ";iex",
  "&iex",
  "(iex ",
  "(iex(",
  "invoke-webrequest",
  "iwr ",
  " iwr(",
  "|iwr",
  ";iwr",
  "(iwr ",
  "(iwr(",
  "invoke-restmethod",
  " irm ",
  " irm(",
  "|irm",
  ";irm",
  "(irm ",
  "(irm(",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "net.webclient",
  "system.net.webclient",
  "frombase64string",
  "[convert]::from",
  "-encodedcommand",
  " -enc ",
  "amsiutils",
  "amsiinitfailed",
  "amsicontext",
  "add-mppreference",
  "set-mppreference",
  "start-bitstransfer",
  "bitstransfer",
  "hta:",
  "javascript:",
  "[ref].assembly",
  "start $env"
}
if contains(l_0_2, l_0_12) then
  local l_0_13 = l_0_3 and "|REMOTE" or ""
  set_research_data("ClickFixRDia_SC", "HIGH" .. l_0_13 .. "||T" .. l_0_11 .. "||" .. tostring(l_0_4 or "-") .. "||" .. tostring(l_0_1), false)
  return mp.INFECTED
end
local l_0_14 = {
  "-noprofile",
  "-noninteractive",
  "-w hidden",
  "-windowstyle hidden",
  "-wi h",
  "-wi 1",
  "-executionpolicy",
  "-useb",
  "-usebasicparsing",
  "start-process"
}
local l_0_15 = 0
for l_0_16, l_0_17 in ipairs(l_0_14) do
  if string.find(l_0_2, l_0_17, 1, true) then
    l_0_15 = l_0_15 + 1
  end
end
if string.find(l_0_2, "http://", 1, true) or string.find(l_0_2, "https://", 1, true) or string.find(l_0_2, "ftp://", 1, true) then
  l_0_15 = l_0_15 + 1
end
if l_0_3 then
  l_0_15 = l_0_15 + 2
end
local l_0_18 = 4
if 2 <= l_0_11 then
  l_0_18 = 1
end
if l_0_15 >= l_0_18 then
  local l_0_19 = l_0_3 and "|REMOTE" or ""
  set_research_data("ClickFixRDia_SC", "MED" .. tostring(l_0_15) .. l_0_19 .. "||T" .. l_0_11 .. "||" .. tostring(l_0_4 or "-") .. "||" .. tostring(l_0_1), false)
  return mp.INFECTED
end
return mp.CLEAN
