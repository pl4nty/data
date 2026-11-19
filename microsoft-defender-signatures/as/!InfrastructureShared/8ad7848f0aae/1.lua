-- Threat: !InfrastructureShared
-- Name: 8ad7848f0aae
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.len(l_0_1) > 350 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.gsub(l_0_1, "powershell", "")
if l_0_3 < 2 then
  return mp.CLEAN
end
local l_0_4 = {
  " iex",
  "invoke-expression",
  "iwr",
  "invoke-webrequest",
  " irm",
  "invoke-restmethod"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
