-- Threat: !InfrastructureShared
-- Name: 3578485af432
-- Type: 21

if mp.get_mpattribute("Lua:VirTool:Win32/VMProtect.A") and mp.get_mpattribute("Lua:Win32/FileExports.A!?injectdlls@@yaxxz") and mp.get_mpattribute("Lua:Win32/FileExports.A!getskinidfromplayer") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
