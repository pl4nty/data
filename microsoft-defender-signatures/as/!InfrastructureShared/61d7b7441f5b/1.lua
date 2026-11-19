-- Threat: !InfrastructureShared
-- Name: 61d7b7441f5b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "invoke-webrequest",
  "invoke-expression",
  "| invoke-expression",
  "|iex",
  "| iex",
  "iwr ",
  "downloaddata",
  "net.webclient",
  "iex(["
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {"w3wp.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
