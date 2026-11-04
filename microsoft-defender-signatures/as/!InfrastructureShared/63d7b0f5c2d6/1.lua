-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\63d7b0f5c2d6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "CMD"
l_0_2.CONTENT_SOURCE = "DENO_CMDLINE"
l_0_2.PROCESS_CONTEXT = "deno.exe"
l_0_2.FILELESS = "true"
l_0_2.CMDLINE_URL = "true"
if ExtractUrlGetReputation(l_0_1, l_0_2, true, 2, 60, false, 3000) then
  return mp.INFECTED
end
return mp.CLEAN

