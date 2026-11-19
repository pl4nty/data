-- Threat: !InfrastructureShared
-- Name: 111d7351e5b1d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = l_0_2:match("%.downloaddata%s*%(%s*(%$[%w_]+)%s*%)")
if l_0_3 then
  local l_0_4 = l_0_2:match(l_0_3 .. "%s*=%s*['\"]([^'\"]+)['\"]")
  if l_0_4 and l_0_4:match("https?://[^%s\"']+%.png[\"']?$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
