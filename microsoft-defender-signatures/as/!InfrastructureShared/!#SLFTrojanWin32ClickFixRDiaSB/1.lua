-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ClickFixRDia.SB
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper, ResearchData
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
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if not l_0_2 or l_0_3 == nil then
  return mp.CLEAN
end
if type(l_0_3) ~= "string" or #l_0_3 < 10 or 2048 < #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if string.sub(l_0_4, 1, 7) ~= "http://" and string.sub(l_0_4, 1, 8) ~= "https://" then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_1)
local l_0_6 = {
  "powershell",
  "pwsh",
  "cmd.exe",
  "cmd /c",
  "cmd /k",
  "cmd /r",
  "cmd.exe /",
  "mshta",
  "wscript",
  "cscript",
  "rundll32",
  "regsvr32",
  "msiexec",
  "curl.exe",
  "certutil",
  "bitsadmin",
  "wmic",
  "forfiles",
  "hh.exe",
  "ieexec",
  "installutil",
  "msbuild",
  "regasm",
  "regsvcs",
  "cmstp",
  "ftp.exe",
  "tftp.exe"
}
if not contains(l_0_5, l_0_6) then
  return mp.CLEAN
end
local l_0_7 = string.gsub(l_0_5, "%s", "")
if #l_0_7 < 18 then
  return mp.CLEAN
end
local l_0_8 = l_0_7
local l_0_9 = {
  "powershell%.exe",
  "powershell",
  "pwsh%.exe",
  "pwsh",
  "cmd%.exe",
  "mshta%.exe",
  "mshta",
  "wscript%.exe",
  "wscript",
  "cscript%.exe",
  "cscript",
  "rundll32%.exe",
  "rundll32",
  "regsvr32%.exe",
  "regsvr32",
  "msiexec%.exe",
  "msiexec",
  "curl%.exe",
  "curl",
  "certutil%.exe",
  "certutil",
  "bitsadmin%.exe",
  "bitsadmin",
  "wmic%.exe",
  "wmic",
  "forfiles%.exe",
  "forfiles",
  "hh%.exe",
  "ieexec%.exe",
  "cmstp%.exe",
  "ftp%.exe",
  "tftp%.exe"
}
for l_0_10, l_0_11 in ipairs(l_0_9) do
  l_0_8 = string.gsub(l_0_8, l_0_11, "")
end
l_0_8 = string.gsub(l_0_8, "[/-][a-z]", "")
if #l_0_8 < 12 then
  return mp.CLEAN
end
local l_0_12, l_0_13 = mp.CheckUrl(l_0_3)
if l_0_12 == 1 and l_0_13 == 1 then
  return mp.CLEAN
end
local l_0_14 = {}
l_0_14.SIG_CONTEXT = "CLICKFIX_RUNDIALOG"
local l_0_15 = SafeGetUrlReputation({l_0_3}, l_0_14, false, 2000)
if l_0_15 and l_0_15.urls and l_0_15.urls[l_0_3] then
  local l_0_16 = l_0_15.urls[l_0_3].determination
  local l_0_17 = l_0_15.urls[l_0_3].confidence or 0
  if (l_0_16 == 2 or l_0_16 == 3 or l_0_16 == 5 or l_0_16 == 6) and 60 <= l_0_17 then
    local l_0_18 = "unknown"
    if l_0_16 == 2 then
      l_0_18 = "malware"
    elseif l_0_16 == 3 then
      l_0_18 = "phish"
    elseif l_0_16 == 5 then
      l_0_18 = "scam"
    elseif l_0_16 == 6 then
      l_0_18 = "pua"
    end
    set_research_data("ClickFixRDia_SB", l_0_18 .. "|" .. tostring(l_0_17) .. "||" .. tostring(l_0_3) .. "||" .. tostring(l_0_1), false)
    return mp.INFECTED
  end
end
return mp.CLEAN
