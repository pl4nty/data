-- Threat: !InfrastructureShared
-- Name: bed7a85aa39c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "conhost.exe",
  "control.exe",
  "wscript.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0, 2) then
  return mp.INFECTED
end
return mp.CLEAN
