-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32SuspElectronE\1.luac 

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
local l_0_4 = 0
do
  if (string.find)(l_0_2, "scexec", 1, true) then
    local l_0_3 = false
    l_0_3 = true
  end
  -- DECOMPILER ERROR at PC119: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC141: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC205: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC215: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC225: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC280: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC285: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC285: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC285: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC285: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC285: Unhandled construct in 'MakeBoolean' P3

  if ((((((((((((string.find)(l_0_2, "coffloader", 1, true) and not (string.find)(l_0_2, "assembly.node", 1, true)) or (string.find)(l_0_2, "execute-bof-node", 1, true)) and not (string.find)(l_0_2, "execute-assembly-node", 1, true)) or (string.find)(l_0_2, "execute-scexec-node", 1, true)) and not (string.find)(l_0_2, "func_command_handler", 1, true)) or (string.find)(l_0_2, "shellcode", 1, true)) and not (string.find)(l_0_2, "c2agent", 1, true)) or (string.find)(l_0_2, "implant", 1, true)) and not (string.find)(l_0_2, "beacon", 1, true)) or (string.find)(l_0_2, "payload", 1, true)) and not (string.find)(l_0_2, "\"main\"%s*:%s*\"", 1, false)) or not true then
    return mp.CLEAN
  end
  if l_0_4 < 6 then
    return mp.CLEAN
  end
  set_research_data("electron_pkgjson_path", l_0_1, false)
  set_research_data("electron_pkgjson_score", tostring(l_0_4), false)
  return mp.INFECTED
end

