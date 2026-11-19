-- Threat: !InfrastructureShared
-- Name: 29d71d8e86cc
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "wmic", 1, true) or not string.find(l_0_1, "/format:", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  "/format:csv",
  "/format:list",
  "/format:table",
  "/format:value",
  "/format:rawxml",
  "/format:htable",
  "/format:hform",
  "/format:textvaluelist",
  "/format:xml"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = string.match(l_0_1, "/format:(%S+)")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6 = string.find(l_0_5, "http", 1, true)
local l_0_7 = string.find(l_0_5, ".xsl", 1, true)
local l_0_8 = string.find(l_0_5, "\\\\", 1, true)
if not l_0_6 and not l_0_7 and not l_0_8 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1220", "SuspWmicXslProcess")
return mp.INFECTED
