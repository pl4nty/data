-- Threat: !InfrastructureShared
-- Name: !#Lua:Trojan:PKL/SuspExec.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: BM_PKL_FILE

local l_0_0
local l_0_1 = false
local l_0_2
local l_0_3 = mp.getfilename()
local l_0_4 = {
  "\\jedi\\",
  "CPython-",
  ":\\Program Files",
  "\\search-structural\\pycode\\"
}
if contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
l_0_0 = tostring(headerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_5 = {
  "webbrowser",
  "httplib",
  "requests.api",
  "aiohttp.client",
  "socket",
  "subprocess",
  "/bin/bash",
  "runpy"
}
local l_0_6 = {
  "os.system",
  "nt.system",
  "os.environ",
  "nt.environ",
  "posix.system"
}
if contains(l_0_0, {
  "__builtin__",
  "builtins"
}) then
  if contains(l_0_0, {
    "eval",
    "exec",
    "compile",
    "getattr",
    "apply",
    "breakpoint",
    "open"
  }) then
    l_0_1 = true
    l_0_2 = "evel_exec"
  end
elseif contains(l_0_0, l_0_6, false) then
  l_0_1 = true
  l_0_2 = "syetem_environ"
elseif contains(l_0_0, l_0_5) then
  l_0_1 = true
  l_0_2 = "SuspKeyword"
end
if l_0_1 and l_0_2 then
  if mp.get_mpattribute("Lua:PKL_Protocol_V2") then
    mp.set_mpattribute("Lua:PKL_Protocol_V2_suspicious_" .. l_0_2)
  elseif mp.get_mpattribute("Lua:PKL_Protocol_V3") then
    mp.set_mpattribute("Lua:PKL_Protocol_V3_suspicious_" .. l_0_2)
  elseif mp.get_mpattribute("Lua:PKL_Protocol_V4") then
    mp.set_mpattribute("Lua:PKL_Protocol_V4_suspicious_" .. l_0_2)
  elseif mp.get_mpattribute("Lua:PKL_Protocol_V5") then
    mp.set_mpattribute("Lua:PKL_Protocol_V5_suspicious_" .. l_0_2)
  end
end
return mp.CLEAN
