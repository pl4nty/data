-- Threat: !InfrastructureShared
-- Name: 15b3ef56f7cb
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.gsub(l_0_1, "\"", "")
  l_0_1 = string.gsub(l_0_1, "'", "")
  l_0_1 = string.gsub(l_0_1, "'+'", "")
  l_0_1 = string.gsub(l_0_1, "\"+\"", "")
  local l_0_2 = string.lower(l_0_1)
  local l_0_3 = 0
  l_0_3 = str_count_match(l_0_2, {
    " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s",
    " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s",
    "irm http",
    "iwr http",
    "iex %$",
    "iex%s?%(",
    "|%s?iex",
    "invoke-expression",
    "curl",
    " //e:jscript",
    "%.vbs",
    "%)%.downloadstring%(",
    "::frombase64string%(%$",
    "net%.sockets%.tcpclient%(",
    "installproduct('https://",
    "installproduct(\"https://"
  })
  l_0_3 = l_0_3 + str_count_match(l_0_2, {
    " \226[\128-\191][\128-\191] ",
    " \240[\128-\191][\128-\191][\128-\191] "
  })
  if 2 <= l_0_3 then
    return mp.INFECTED
  end
  if string.find(l_0_1, " [%-/][eE][ncodemaNCODEMA]*%s+") then
    local l_0_4 = NormalizeCmdline("powershell", l_0_1)
    if l_0_4 == nil then
      return mp.CLEAN
    end
    l_0_4 = string.lower(l_0_4)
    l_0_3 = 0
    l_0_3 = str_count_match(l_0_4, {
      "iwr ",
      "irm ",
      "%.downloadstring",
      "wget",
      "iex",
      "& %.\\"
    })
    if 2 <= l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
