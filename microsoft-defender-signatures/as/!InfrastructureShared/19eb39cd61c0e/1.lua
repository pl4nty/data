-- Threat: !InfrastructureShared
-- Name: 19eb39cd61c0e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = this_sigattrlog[9]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if string.find(l_0_1, ".monster/?", 1, true) or string.find(l_0_1, ".top/?", 1, true) or string.find(l_0_1, ".pro/?", 1, true) or string.find(l_0_1, ".lol/?", 1, true) or string.find(l_0_1, ".cfd/?", 1, true) or string.find(l_0_1, ".cc/?", 1, true) or string.find(l_0_1, ".buzz/?", 1, true) or string.find(l_0_1, "?subid=", 1, true) or string.find(l_0_1, "?msclkid=", 1, true) or string.find(l_0_1, "?srsltid=", 1, true) or string.find(l_0_1, "campaignid=", 1, true) or string.find(l_0_1, "campaign_id=", 1, true) or string.find(l_0_1, "click_id=", 1, true) or string.find(l_0_1, "?__cf_chl_tk=", 1, true) then
  return mp.INFECTED
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil or l_0_2.command_line == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.command_line)
local l_0_4, l_0_5 = string.gsub(l_0_3, "%^", "")
if 12 <= l_0_5 then
  return mp.INFECTED
end
local l_0_6 = 0
if string.find(l_0_3, "\\powershell.exe", 1, true) or string.find(l_0_3, "\\pwsh.exe", 1, true) then
  l_0_6 = l_0_6 + str_count_match(l_0_3, {
    "iex[()]",
    "iex ",
    "irm ",
    "irm[()]",
    "iwr ",
    "iwr[()]",
    " %-useba",
    "& %$env:",
    "%.%a%a%a/",
    "%]::create%(",
    "%.getbytes%(",
    "%(gcm",
    "%(gal",
    "%-join",
    "|iex",
    "|powershell",
    "::create",
    "%.content",
    "%.invoke",
    "%+'\\",
    "'[%w%.]+'%+'[%w%.]+'",
    "%.open%(",
    "%.download",
    "& ?powershell ",
    "join%-path %$env:"
  })
end
if string.find(l_0_3, "\\cmd.exe", 1, true) then
  l_0_6 = l_0_6 + str_count_match(l_0_3, {
    "http",
    "\\\\",
    "bitsadmin /transfer",
    "&& powershell",
    "&& schtasks",
    " /create ",
    "for /f ",
    "!%a+!!%a+!",
    "& ?set ",
    "& ?cmd ",
    "@80\\",
    "@ssl\\"
  })
end
if string.find(l_0_3, "\\conhost.exe", 1, true) then
  l_0_6 = l_0_6 + str_count_match(l_0_3, {
    " %-%-headless ",
    "pushd ",
    "\\\\",
    "/v:on ",
    "%^",
    "iex%(",
    "&set ",
    "!%a+!!%a+!"
  })
end
if string.find(l_0_3, "\\msiexec.exe", 1, true) then
  l_0_6 = l_0_6 + str_count_match(l_0_3, {
    "http",
    " /i ",
    " [/%-]package ",
    ":\\\\",
    "\225\181\150\225\181\131",
    "\226\156\148\239\184\143",
    "%.vercel%.app/%w+%.msi%s+/qn"
  })
  l_0_6 = l_0_6 + 1
end
if 3 <= l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
