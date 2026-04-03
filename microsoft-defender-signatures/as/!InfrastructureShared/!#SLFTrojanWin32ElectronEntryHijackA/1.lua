-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ElectronEntryHijackA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 10 or l_0_0 > 100000 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "package.json", 1, true) or not (string.find)(l_0_1, "\\resources\\app\\", 1, true) then
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
l_0_2 = (string.lower)(tostring(l_0_2))
if not (string.find)(l_0_2, "\"main\"", 1, true) then
  return mp.CLEAN
end
do
  if (((((((((((((string.find)(l_0_2, "scexec", 1, true) and not (string.find)(l_0_2, "coffloader", 1, true)) or (string.find)(l_0_2, "assembly.node", 1, true)) and not (string.find)(l_0_2, "execute-bof-node", 1, true)) or (string.find)(l_0_2, "execute-assembly-node", 1, true)) and not (string.find)(l_0_2, "execute-scexec-node", 1, true)) or (string.find)(l_0_2, "func_command_handler", 1, true)) and not (string.find)(l_0_2, "shellcode", 1, true)) or (string.find)(l_0_2, "c2agent", 1, true)) and not (string.find)(l_0_2, "implant", 1, true)) or (string.find)(l_0_2, "beacon", 1, true)) and not (string.find)(l_0_2, "payload", 1, true)) or (string.find)(l_0_2, "\"main\"%s*:%s*\"", 1, false)) and not (string.find)(l_0_2, "\"main.js\"", 1, true) and not (string.find)(l_0_2, "\"index.js\"", 1, true) and not (string.find)(l_0_2, "\"app.js\"", 1, true) and not (string.find)(l_0_2, "\"electron.js\"", 1, true) and not (string.find)(l_0_2, "\"background.js\"", 1, true) then
    local l_0_3, l_0_4, l_0_5 = 0 + 4 + 4 + 4 + 5 + 5 + 5 + 5 + 3 + 3 + 3 + 2 + 2 + 2
  end
  -- DECOMPILER ERROR at PC273: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 < 4 then
    return mp.CLEAN
  end
  set_research_data("electron_pkgjson_path", l_0_1, false)
  -- DECOMPILER ERROR at PC286: Confused about usage of register: R3 in 'UnsetPending'

  set_research_data("electron_pkgjson_score", tostring(l_0_3), false)
  return mp.INFECTED
end

