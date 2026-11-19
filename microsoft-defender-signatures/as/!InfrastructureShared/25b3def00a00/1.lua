-- Threat: !InfrastructureShared
-- Name: 25b3def00a00
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.gsub(l_0_1, "\"", "")
  l_0_1 = string.gsub(l_0_1, "'", "")
  local l_0_2 = string.lower(l_0_1)
  local l_0_3 = 0
  local l_0_4 = false
  if string.find(l_0_1, " [%-/][eE][ncodemaNCODEMA]*%s+") then
    local l_0_5 = NormalizeCmdline("powershell", l_0_1)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    l_0_2 = string.lower(l_0_5)
    l_0_3 = l_0_3 + 1
    l_0_3 = l_0_3 + str_count_match(l_0_2, {"http"})
    l_0_4 = true
  end
  if isIEXfound(l_0_2) then
    l_0_3 = l_0_3 + 1
  end
  l_0_3 = l_0_3 + str_count_match(l_0_2, {
    " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s",
    " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s",
    "mshta.+http",
    "irm ",
    "iwr ",
    " //e:jscript",
    "%.vbs",
    "%)%.downloadstring%(",
    "::frombase64string%(%$",
    "net%.sockets%.tcpclient%(",
    "invoke%-webrequest",
    "invoke%-restmethod",
    ".invoke%(%)",
    "%[system%.text%.encoding%]::utf8",
    "msxml2.xmlhttp",
    "saps%s+",
    "start%-process",
    "start%s+",
    "%-useb",
    "%-usebasicparsing",
    "wscript",
    "cscript",
    "%.shell",
    "%.vbs",
    "wget",
    "curl",
    "conhost.+%-%-headless",
    "net%.webclient",
    "%.content",
    "start%-sleep",
    "%$env:"
  })
  l_0_3 = l_0_3 + str_count_match(l_0_2, {
    " \226[\128-\191][\128-\191] ",
    " \240[\128-\191][\128-\191][\128-\191] "
  })
  if l_0_4 == true and 3 <= l_0_3 then
    return mp.INFECTED
  elseif l_0_4 == false and 2 <= l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
