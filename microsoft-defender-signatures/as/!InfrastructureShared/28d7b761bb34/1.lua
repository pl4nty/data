-- Threat: !InfrastructureShared
-- Name: 28d7b761bb34
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.gsub(l_0_1, "[\"'`^()+#&]", "")
local l_0_3 = {
  "iex $",
  "invoke-expression $"
}
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
if not contains(l_0_2, {
  "[convert]::frombase64string($"
}) then
  return mp.CLEAN
end
if not contains(l_0_2, {".getstring"}) then
  return mp.CLEAN
end
return mp.INFECTED
