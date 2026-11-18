-- Threat: !InfrastructureShared
-- Name: 1e3d7fb9a4b4f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "cmd.exe",
  "powershell.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
