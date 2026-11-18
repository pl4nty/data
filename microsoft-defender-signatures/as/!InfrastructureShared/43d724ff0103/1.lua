-- Threat: !InfrastructureShared
-- Name: 43d724ff0103
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
if not string.find(l_0_1, "--app=", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\temp\\",
  "\\tmp\\",
  "\\downloads\\",
  "\\appdata\\local\\temp\\",
  "\\public\\",
  "\\users\\public\\"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_5, 1, true) then
    l_0_3 = true
    break
  end
end
if not l_0_3 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1218.015", "ElectronAppOverride")
return mp.INFECTED
