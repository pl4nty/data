-- Threat: !InfrastructureShared
-- Name: 4ed7c7e4b18d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
local l_0_2 = {
  "iex",
  "invoke-expression",
  "invoke-webrequest",
  "iwr",
  "irm",
  "invoke-restmethod"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {"curl", "wget"}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "writeallbytes",
  "frombase64string"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
