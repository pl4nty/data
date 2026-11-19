-- Threat: !InfrastructureShared
-- Name: 19d02cf101e4
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
else
  return mp.CLEAN
end
local l_0_1 = string.find(l_0_0, ".3mf->metadata/project_settings.config", 1, true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 131072
local l_0_3 = mp.getfilesize()
if l_0_2 > l_0_3 then
  l_0_2 = l_0_3
end
mp.readprotection(false)
local l_0_4 = mp.readfile(0, l_0_2)
mp.readprotection(true)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(safeJsonDeserialize, tostring(l_0_4))
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = tostring(l_0_6.post_process)
if l_0_7 == nil then
  return mp.CLEAN
else
  l_0_7 = string.lower(l_0_7)
end
local l_0_8 = {
  "powershell",
  "pwsh",
  "cmd.exe",
  "wscript",
  "cscript",
  "mshta",
  "rundll32",
  "regsvr32",
  "certutil",
  "bitsadmin",
  "invoke-webrequest",
  "downloadstring",
  "frombase64string",
  "-enc",
  "-encodedcommand",
  "iex",
  "start-process",
  "schtasks",
  "wmic",
  "msiexec",
  "curl ",
  "wget ",
  "http://",
  "https://",
  "\\appdata\\local\\temp\\",
  "%temp%"
}
for l_0_9, l_0_10 in ipairs(l_0_8) do
  if string.find(l_0_7, l_0_10, 1, true) ~= nil then
    set_research_data("post_process", l_0_7, false)
    return mp.INFECTED
  end
end
return mp.CLEAN
