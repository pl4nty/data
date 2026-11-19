-- Threat: !InfrastructureShared
-- Name: 5fd78b8c8b49
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = {"w3wp.exe"}
if not IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetScannedPPID()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
l_0_2 = string.lower(l_0_2)
local l_0_3 = {
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
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 ~= nil then
  local l_0_5 = l_0_4.ppid
  if l_0_5 ~= "" and l_0_5 ~= nil then
    if IsTacticObservedForPid(l_0_5, "webshell_parent") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
