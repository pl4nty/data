-- Threat: !InfrastructureShared
-- Name: 88b3eae10a08
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[3].matched then
  return mp.CLEAN
end
if this_sigattrlog[3].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
if string.len(l_0_0) < 10 then
  return mp.CLEAN
end
local l_0_1 = 0
if contains(l_0_0, "sekurlsa") then
  l_0_1 = l_0_1 + 5
end
if contains(l_0_0, "mimikatz") then
  l_0_1 = l_0_1 + 5
end
if contains(l_0_0, "lsass") then
  l_0_1 = l_0_1 + 3
end
if containsall(l_0_0, {"reg query", "\\sam"}) then
  l_0_1 = l_0_1 + 4
end
if containsall(l_0_0, {"procdump", "lsass"}) then
  l_0_1 = l_0_1 + 5
end
if containsall(l_0_0, {"schtasks", "/create"}) then
  l_0_1 = l_0_1 + 3
end
if containsall(l_0_0, {"reg add", "\\run"}) then
  l_0_1 = l_0_1 + 3
end
if contains(l_0_0, "sc create") then
  l_0_1 = l_0_1 + 3
end
if containsall(l_0_0, {"startup", "copy"}) then
  l_0_1 = l_0_1 + 2
end
if contains(l_0_0, "-encodedcommand") then
  l_0_1 = l_0_1 + 3
end
if containsall(l_0_0, {
  "set-mppreference",
  "-disablerealtimemonitoring"
}) then
  l_0_1 = l_0_1 + 5
end
if containsall(l_0_0, {
  "add-mppreference",
  "-exclusionpath"
}) then
  l_0_1 = l_0_1 + 4
end
if containsall(l_0_0, {"wevtutil", "cl "}) then
  l_0_1 = l_0_1 + 3
end
if contains(l_0_0, "operator.admin") then
  l_0_1 = l_0_1 + 5
end
if containsall(l_0_0, {"pair", "approve"}) then
  l_0_1 = l_0_1 + 4
end
if containsall(l_0_0, {
  "device-pair",
  "scope"
}) then
  l_0_1 = l_0_1 + 4
end
if containsall(l_0_0, {
  ".openclaw",
  "credentials"
}) then
  l_0_1 = l_0_1 + 4
end
if l_0_1 < 3 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059", "Execution")
add_parents()
return mp.INFECTED
