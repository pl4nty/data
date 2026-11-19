-- Threat: !InfrastructureShared
-- Name: 6db3eb2f44fd
-- Type: 21

if mp.get_sigattr_event_count(16384) > 30 then
  return mp.CLEAN
end
local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = l_0_0:match("\\([^\\]+)$")
local l_0_2 = {
  ["explorer.exe"] = true,
  ["searchprotocolhost.exe"] = true,
  ["cmd.exe"] = true,
  ["powershell.exe"] = true,
  ["pwsh.exe"] = true,
  ["cscript.exe"] = true,
  ["wscript.exe"] = true,
  ["mshta.exe"] = true,
  ["git.exe"] = true,
  ["gvfs.mount.exe"] = true,
  ["devenv.exe"] = true,
  ["iisexpress.exe"] = true,
  ["sqlservr.exe"] = true,
  ["rdpinit.exe"] = true,
  ["scanstate.exe"] = true,
  ["robocopy.exe"] = true,
  ["veeamguesthelperctrl.exe"] = true,
  ["trimqueue.exe"] = true,
  ["netwrix.wsa.agentservice.exe"] = true
}
if l_0_2[l_0_1] then
  return mp.CLEAN
end
return mp.INFECTED
