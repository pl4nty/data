-- Threat: !InfrastructureShared
-- Name: 85d75e0a57d3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 < 20 or 4000 < #l_0_1 then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2 = string.gsub(l_0_1, "%^", "")
local l_0_3 = contains(l_0_2, {
  "mshta",
  "|cmd",
  "curl",
  "regsvr32.exe",
  "scrobj.dll"
})
if l_0_3 then
  return mp.INFECTED
end
if containsall(l_0_2, {
  ".dll",
  "--headless",
  "-i:http"
}) then
  return mp.INFECTED
end
return mp.LOWFI
