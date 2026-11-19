-- Threat: !InfrastructureShared
-- Name: 72783d7eaca1
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:VirTool:Win32/Injector.gen!EE")
return mp.CLEAN
