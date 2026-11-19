-- Threat: !InfrastructureShared
-- Name: 179d707f19376
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
if 450 < #l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = "(?:#.*?\\d{3,}[\\s'\"]*$|<#.*?\\d{3,}[\\s'\"]*#>|[-;:]{1,3}\\s*[^#<]{0,100}?\\d{3,}[\\s'\"]*$)"
local l_0_5 = "(rem\\s+.*?\\d{3,}\\s*$|::\\s*.*?\\d{3,}\\s*$)"
local l_0_6 = MpCommon.GetImagePathFromPid(l_0_0)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if not contains(l_0_6, {
  "powershell.exe",
  "cmd.exe",
  "mshta.exe",
  "conhost.exe",
  "curl.exe"
}) then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_7 = string.gsub(l_0_3, "[\"'`^()+#&]", "")
local l_0_8 = {
  "iwr",
  "iex",
  "irm",
  "curl",
  "bitsadmin",
  "e:jscript",
  "downloadstring",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
  "start-process",
  "c:\\users\\public\\",
  "uilevel",
  ".installproduct",
  "[char]"
}
if contains(l_0_7, l_0_8) then
  return mp.INFECTED
end
if contains(l_0_6, "powershell.exe") then
  local l_0_9, l_0_10 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_7)
  if l_0_9 then
    local l_0_11, l_0_12 = MpCommon.StringRegExpSearch(l_0_4, l_0_3)
    if l_0_11 then
      return mp.INFECTED
    end
  end
end
local l_0_13, l_0_14 = MpCommon.StringRegExpSearch(l_0_5, l_0_3)
if l_0_13 then
  return mp.INFECTED
end
return mp.CLEAN
