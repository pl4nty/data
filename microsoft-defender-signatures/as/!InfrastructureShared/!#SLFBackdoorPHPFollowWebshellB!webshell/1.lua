-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:PHP/FollowWebshell.B!webshell
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:JSPExt | Lua:PHPExt) & (Lua:Linux:ProcName_bash | Lua:Linux:ProcName_sh | Lua:Linux:ProcName_wget | Lua:Linux:ProcName_curl)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "/webapps/",
  "/apps/",
  "/work/catalina/",
  "/var/lib/tomcat",
  "/user_projects/domains/",
  "/standalone/deployments/",
  "/html/",
  "/login/",
  "/www/",
  "/htdocs/",
  "/public/",
  "/web/",
  "/uploads/",
  "/files/",
  "/media/",
  "/assets/",
  "/static/",
  "/cache/",
  "/sessions/",
  "/tmp/",
  "/dev/shm/"
}
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
for l_0_4, l_0_5 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_5, 1, true) then
    if mp.get_mpattribute("Lua:Linux:ProcName_wget") or mp.get_mpattribute("Lua:Linux:ProcName_curl") then
      if string.find(l_0_3, "-o ", 1, true) then
        return mp.INFECTED
      end
    elseif (mp.get_mpattribute("Lua:Linux:ProcName_bash") or mp.get_mpattribute("Lua:Linux:ProcName_sh")) and string.find(l_0_3, "-c ", 1, true) and (string.find(l_0_3, "echo ", 1, true) or string.find(l_0_3, "base64 -d ", 1, true)) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
