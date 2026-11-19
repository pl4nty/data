-- Threat: !InfrastructureShared
-- Name: 51410dcd2e2f
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and mp.get_mpattribute("HSTR:VirTool:Win32/AscUrlExe") then
  return mp.INFECTED
end
return mp.CLEAN
