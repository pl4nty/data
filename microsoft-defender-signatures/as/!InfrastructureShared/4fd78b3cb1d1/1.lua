-- Threat: !InfrastructureShared
-- Name: 4fd78b3cb1d1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "SnippingTool.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
