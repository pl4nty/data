-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/LokiC2AgentJS.A
-- Type: 24
-- Includes: BMLuaLib, ResearchData

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 200 or 5000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if string.sub(l_0_1, -3) ~= ".js" then
  return mp.CLEAN
end
if not string.find(l_0_1, "\\resources\\app\\", 1, true) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
local l_0_3 = 0
if string.find(l_0_2, "func_Command_Handler", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "func_ProcessBof", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "func_ProcessAssembly", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "func_ProcessScexec", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "func_ProcessSocks", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "func_ProcessSpawn", 1, true) then
  l_0_3 = l_0_3 + 5
end
if string.find(l_0_2, "execute-bof-node", 1, true) then
  l_0_3 = l_0_3 + 4
end
if string.find(l_0_2, "execute-assembly-node", 1, true) then
  l_0_3 = l_0_3 + 4
end
if string.find(l_0_2, "execute-scexec-node", 1, true) then
  l_0_3 = l_0_3 + 4
end
if string.find(l_0_2, "BeaconPack", 1, true) then
  l_0_3 = l_0_3 + 4
end
if string.find(l_0_2, "blob.core.windows.net", 1, true) then
  l_0_3 = l_0_3 + 3
end
if string.find(l_0_2, "x-ms-meta-signature", 1, true) then
  l_0_3 = l_0_3 + 3
end
if string.find(l_0_2, "x-ms-meta-hash", 1, true) then
  l_0_3 = l_0_3 + 2
end
if l_0_3 < 5 then
  return mp.CLEAN
end
set_research_data("loki_agentjs_path", l_0_1, false)
set_research_data("loki_agentjs_score", tostring(l_0_3), false)
return mp.INFECTED
