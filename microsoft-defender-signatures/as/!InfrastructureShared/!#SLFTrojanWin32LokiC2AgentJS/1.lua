-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32LokiC2AgentJS\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 200 or l_0_0 > 5000000 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if (string.sub)(l_0_1, -3) ~= ".js" then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "\\resources\\app\\", 1, true) then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
do
  if ((((((((((((string.find)(l_0_2, "func_Command_Handler", 1, true) and not (string.find)(l_0_2, "func_ProcessBof", 1, true)) or (string.find)(l_0_2, "func_ProcessAssembly", 1, true)) and not (string.find)(l_0_2, "func_ProcessScexec", 1, true)) or (string.find)(l_0_2, "func_ProcessSocks", 1, true)) and not (string.find)(l_0_2, "func_ProcessSpawn", 1, true)) or (string.find)(l_0_2, "execute-bof-node", 1, true)) and not (string.find)(l_0_2, "execute-assembly-node", 1, true)) or (string.find)(l_0_2, "execute-scexec-node", 1, true)) and not (string.find)(l_0_2, "BeaconPack", 1, true)) or (string.find)(l_0_2, "blob.core.windows.net", 1, true)) and not (string.find)(l_0_2, "x-ms-meta-signature", 1, true)) or (string.find)(l_0_2, "x-ms-meta-hash", 1, true) then
    local l_0_3, l_0_4, l_0_5 = 0 + 5 + 5 + 5 + 5 + 5 + 5 + 4 + 4 + 4 + 4 + 3 + 3 + 2
  end
  -- DECOMPILER ERROR at PC214: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 < 5 then
    return mp.CLEAN
  end
  set_research_data("loki_agentjs_path", l_0_1, false)
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R3 in 'UnsetPending'

  set_research_data("loki_agentjs_score", tostring(l_0_3), false)
  return mp.INFECTED
end

