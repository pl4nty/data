-- Threat: !InfrastructureShared
-- Name: 63d7b0f5c2d6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "CMD"
l_0_2.CONTENT_SOURCE = "DENO_CMDLINE"
l_0_2.PROCESS_CONTEXT = "deno.exe"
l_0_2.FILELESS = "true"
l_0_2.CMDLINE_URL = "true"
local l_0_3, l_0_4 = ExtractUrlGetReputation(l_0_1, l_0_2, true, 2, 60, false, 3000)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
