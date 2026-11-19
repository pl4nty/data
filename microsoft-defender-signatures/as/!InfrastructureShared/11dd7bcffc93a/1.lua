-- Threat: !InfrastructureShared
-- Name: 11dd7bcffc93a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "crashforexceptionexportthunk",
  "crashforexception_exportthunk",
  "crash",
  "scab",
  "huf_inc_var"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if StringEndsWith(l_0_1, l_0_4) then
    return mp.INFECTED
  end
end
return mp.CLEAN
