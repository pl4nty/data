-- Threat: !InfrastructureShared
-- Name: 2729d81001fa
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 4500 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("\"preinstall\"%s*:%s*\"(.-)\"%s*}%s*,%s*\"author\"%s*:")
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_2, "node -e", 1, true)
local l_0_4 = string.find(l_0_2, "execsync", 1, true) or string.find(l_0_2, "exec(", 1, true)
local l_0_5 = string.find(l_0_2, "invoke-webrequest -uri", 1, true)
local l_0_6 = string.find(l_0_2, "getcurrent().name", 1, true) or string.find(l_0_2, "(get-ciminstance win32_operatingsystem).caption", 1, true)
local l_0_7 = string.find(l_0_2, "-method post", 1, true) or string.find(l_0_2, "curl", 1, true)
local l_0_8 = string.find(l_0_2, ".oast.fun", 1, true) or string.find(l_0_2, ".oast.pro", 1, true) or string.find(l_0_2, ".oast.site", 1, true) or string.find(l_0_2, ".oast.live", 1, true) or string.find(l_0_2, ".oast.online", 1, true)
local l_0_9 = string.find(l_0_2, "whoami", 1, true) or string.find(l_0_2, "uname -a", 1, true) or string.find(l_0_2, "hostname", 1, true) or string.find(l_0_2, "username", 1, true) or string.find(l_0_2, "userinfo", 1, true) or string.find(l_0_2, "process.platform", 1, true)
local l_0_10 = string.find(l_0_2, "require('child_process')", 1, true) or string.find(l_0_2, "require(\"child_process\")", 1, true) or string.find(l_0_2, "require('https')", 1, true) or string.find(l_0_2, "require(\"https\")", 1, true) or string.find(l_0_2, "require('http')", 1, true) or string.find(l_0_2, "require(\"http\")", 1, true)
local l_0_11 = string.find(l_0_2, "'.ssh'", 1, true) or string.find(l_0_2, "'.ethereum'", 1, true) or string.find(l_0_2, "'.bash_history'", 1, true) or string.find(l_0_2, "'.zsh_history'", 1, true) or string.find(l_0_2, "'.git-credentials'", 1, true) or string.find(l_0_2, "'ci'", 1, true) or string.find(l_0_2, "'github_repository'", 1, true) or string.find(l_0_2, "'github_actor'", 1, true) or string.find(l_0_2, "'github_workflow'", 1, true) or string.find(l_0_2, "'github_run_id'", 1, true) or string.find(l_0_2, "'runner_environment'", 1, true) or string.find(l_0_2, "'jfrog_username'", 1, true) or string.find(l_0_2, "'nx_workspace_root'", 1, true) or string.find(l_0_2, "'npm_package_name'", 1, true) or string.find(l_0_2, "'hostname'", 1, true) or string.find(l_0_2, "'aws_region'", 1, true) or string.find(l_0_2, "'home'", 1, true) or string.find(l_0_2, "'path'", 1, true)
local l_0_12 = string.find(l_0_2, "/var/run/secrets/kubernetes.io/serviceaccount/token", 1, true)
local l_0_13 = string.find(l_0_2, "readfilesync", 1, true)
local l_0_14 = string.find(l_0_2, "process.env", 1, true) or string.find(l_0_2, "process.cwd", 1, true)
local l_0_15 = string.find(l_0_2, "buffer.from", 1, true) or string.find(l_0_2, "tostring", 1, true) or string.find(l_0_2, "--data", 1, true)
local l_0_16 = string.find(l_0_2, "grep -", 1, true)
local l_0_17 = string.find(l_0_2, "password", 1, true) or string.find(l_0_2, "pwd", 1, true) or string.find(l_0_2, "connection", 1, true) or string.find(l_0_2, "db_", 1, true) or string.find(l_0_2, "./tmp/app", 1, true)
if l_0_3 and l_0_4 and l_0_5 and l_0_6 and l_0_7 or l_0_3 and l_0_4 and l_0_5 and l_0_9 and l_0_7 then
  mp.set_mpattribute("LUA:Script/Stealer.PR1")
  return mp.INFECTED
end
if l_0_3 and l_0_4 and l_0_10 and l_0_13 and l_0_11 and l_0_14 then
  mp.set_mpattribute("LUA:Script/Stealer.PR2")
  return mp.INFECTED
end
if l_0_3 and l_0_10 and l_0_9 and l_0_14 then
  mp.set_mpattribute("LUA:Script/Stealer.PR3")
  return mp.INFECTED
end
if l_0_3 and l_0_10 and l_0_9 and l_0_15 and l_0_16 and l_0_17 then
  mp.set_mpattribute("LUA:Script/Stealer.PR4")
  return mp.INFECTED
end
if l_0_3 and l_0_10 and l_0_9 and l_0_15 then
  mp.set_mpattribute("LUA:Script/Stealer.PR5")
  return mp.INFECTED
end
if l_0_3 and l_0_13 and l_0_12 and l_0_15 and l_0_10 then
  mp.set_mpattribute("LUA:Script/Stealer.PR6")
  return mp.INFECTED
end
if l_0_7 and l_0_8 and l_0_9 and l_0_15 then
  mp.set_mpattribute("LUA:Script/Stealer.PR7")
  return mp.INFECTED
end
return mp.CLEAN
