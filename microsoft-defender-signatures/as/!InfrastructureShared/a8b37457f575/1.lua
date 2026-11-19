-- Threat: !InfrastructureShared
-- Name: a8b37457f575
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1]
if l_0_0 and l_0_0.matched then
  if type(l_0_0.utf8p1) ~= "string" then
    return mp.CLEAN
  end
  local l_0_1 = string.match(l_0_0.utf8p1:lower(), "([^/]+)$")
  if not contains(l_0_1, {
    "^php%-fpm[%d%.%-]*$",
    "^php%-cgi[%d%.%-]*$"
  }, false) then
    return mp.CLEAN
  end
end
local l_0_2 = this_sigattrlog[4]
if not (l_0_2 and l_0_2.matched) or type(l_0_2.utf8p1) ~= "string" or type(l_0_2.utf8p2) ~= "string" then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_2.utf8p1:lower(), "([^/]+)$")
local l_0_4 = l_0_2.utf8p2:lower()
local l_0_5 = {
  sh = true,
  bash = true,
  dash = true,
  ash = true,
  ksh = true,
  zsh = true
}
local l_0_7 = l_0_5[l_0_3] == true
local l_0_8 = l_0_3
if l_0_7 then
  local l_0_9 = string.match(l_0_4, "%s%-[a-z]*c[a-z]*%s+['\"]?%s*([^%s'\";&|<>]+)")
  l_0_8 = string.match(l_0_9 or "", "([^/]+)$") or l_0_3
  if containsall(l_0_4, {"/dev/tcp/", ">"}) or containsall(l_0_4, {"mkfifo", "|"}) and contains(l_0_4, {
    "%f[%w]nc%f[%W]",
    "%f[%w]ncat%f[%W]",
    "%f[%w]netcat%f[%W]"
  }, false) and contains(l_0_4, {"/bin/sh", "/bin/bash"}) then
    return mp.INFECTED
  end
end
if l_0_8 == "whoami" or l_0_8 == "id" or l_0_8 == "uname" and contains(l_0_4, "%s%-a%f[%W]", false) then
  return mp.INFECTED
end
if (l_0_8 == "curl" or l_0_8 == "wget") and contains(l_0_4, {"http://", "https://"}) then
  return mp.INFECTED
end
if (l_0_8 == "nc" or l_0_8 == "ncat" or l_0_8 == "netcat") and contains(l_0_4, "%s%-[ec][%s/]", false) and contains(l_0_4, {"/bin/sh", "/bin/bash"}) then
  return mp.INFECTED
end
if l_0_8 and string.match(l_0_8, "^python%d*%.?%d*$") and contains(l_0_4, "%s%-c[%s'\"]", false) and containsall(l_0_4, {
  "socket",
  "connect",
  "dup2"
}) and contains(l_0_4, {
  "subprocess",
  "os.system",
  "pty.spawn"
}) then
  return mp.INFECTED
end
if l_0_8 == "perl" and contains(l_0_4, "%s%-[a-z]*e[%s'\"]", false) and containsall(l_0_4, {
  "socket",
  "connect",
  "exec"
}) and contains(l_0_4, {"/bin/sh", "/bin/bash"}) then
  return mp.INFECTED
end
if l_0_8 and string.match(l_0_8, "^php[%d%.]*$") and contains(l_0_4, "%s%-r[%s'\"]", false) and contains(l_0_4, "fsockopen") and contains(l_0_4, {
  "proc_open",
  "popen",
  "shell_exec",
  "exec("
}) then
  return mp.INFECTED
end
return mp.CLEAN
