-- Threat: !InfrastructureShared
-- Name: d6b3d57d4ec4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[5]
if not (l_0_0 and l_0_0.matched) or type(l_0_0.utf8p1) ~= "string" or type(l_0_0.utf8p2) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0.utf8p1:lower(), "([^\\]+)$")
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.gsub(l_0_1, "%.exe$", "")
local l_0_2 = l_0_0.utf8p2:lower()
local l_0_3 = l_0_1
local l_0_5 = l_0_1 == "powershell" or l_0_1 == "pwsh"
if l_0_1 == "cmd" or l_0_5 then
  local l_0_6
  if l_0_1 == "cmd" then
    l_0_6 = string.match(l_0_2, "%s/[ck]%s+\"?%s*([^%s\";&|<>]+)")
  else
    l_0_6 = string.match(l_0_2, "%s%-command%s+['\"]?%s*([^%s'\";&|<>]+)") or string.match(l_0_2, "%s%-c%s+['\"]?%s*([^%s'\";&|<>]+)")
  end
  if l_0_6 then
    l_0_3 = string.gsub(string.match(l_0_6, "([^\\]+)$") or l_0_6, "%.exe$", "")
  end
  if containsall(l_0_2, {
    "system.net.sockets.tcpclient",
    "getstream",
    ".read(",
    ".write("
  }) and contains(l_0_2, {
    "%f[%w]iex%f[%W]",
    "invoke%-expression",
    "scriptblock::create"
  }, false) then
    return mp.INFECTED
  end
end
if l_0_3 == "whoami" or l_0_3 == "ipconfig" then
  return mp.INFECTED
end
local l_0_7 = contains(l_0_2, {"http://", "https://"})
if l_0_7 and (l_0_3 == "curl" or l_0_3 == "wget" or l_0_3 == "certutil" and contains(l_0_2, "-urlcache")) then
  return mp.INFECTED
end
if (l_0_5 or l_0_3 == "powershell" or l_0_3 == "pwsh") and l_0_7 and (contains(l_0_2, "downloadfile(") or contains(l_0_2, "downloadstring(") and contains(l_0_2, {
  "%f[%w]iex%f[%W]",
  "invoke%-expression"
}, false) or contains(l_0_2, {
  "invoke%-webrequest",
  "%f[%w]iwr%f[%W]"
}, false) and contains(l_0_2, "-outfile")) then
  return mp.INFECTED
end
return mp.CLEAN
