-- Threat: !InfrastructureShared
-- Name: c9d7e1d6419f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = 0
l_0_2 = str_count_match(l_0_1, {
  "powershell",
  "curl",
  "mshta",
  "http",
  "iex"
})
if 2 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
