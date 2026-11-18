-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/SuspElectronEntryHijacked.MK
-- Type: 24
-- Includes: BMLuaLib, ResearchData

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 10 or 100000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if not string.find(l_0_1, "package.json", 1, true) or not string.find(l_0_1, "\\resources\\app\\", 1, true) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = string.lower(tostring(l_0_2))
if not string.find(l_0_2, "\"main\"", 1, true) then
  return mp.CLEAN
end
local l_0_3 = 0
local l_0_4 = false
if string.find(l_0_2, "scexec", 1, true) then
  l_0_3 = l_0_3 + 4
  l_0_4 = true
end
if string.find(l_0_2, "coffloader", 1, true) then
  l_0_3 = l_0_3 + 4
  l_0_4 = true
end
if string.find(l_0_2, "assembly.node", 1, true) then
  l_0_3 = l_0_3 + 4
  l_0_4 = true
end
if string.find(l_0_2, "execute-bof-node", 1, true) then
  l_0_3 = l_0_3 + 5
  l_0_4 = true
end
if string.find(l_0_2, "execute-assembly-node", 1, true) then
  l_0_3 = l_0_3 + 5
  l_0_4 = true
end
if string.find(l_0_2, "execute-scexec-node", 1, true) then
  l_0_3 = l_0_3 + 5
  l_0_4 = true
end
if string.find(l_0_2, "func_command_handler", 1, true) then
  l_0_3 = l_0_3 + 5
  l_0_4 = true
end
if string.find(l_0_2, "shellcode", 1, true) then
  l_0_3 = l_0_3 + 3
end
if string.find(l_0_2, "c2agent", 1, true) then
  l_0_3 = l_0_3 + 3
end
if string.find(l_0_2, "implant", 1, true) then
  l_0_3 = l_0_3 + 3
end
if string.find(l_0_2, "beacon", 1, true) then
  l_0_3 = l_0_3 + 2
end
if string.find(l_0_2, "payload", 1, true) then
  l_0_3 = l_0_3 + 2
end
if string.find(l_0_2, "\"main\"%s*:%s*\"", 1, false) and not string.find(l_0_2, "\"main.js\"", 1, true) and not string.find(l_0_2, "\"index.js\"", 1, true) and not string.find(l_0_2, "\"app.js\"", 1, true) and not string.find(l_0_2, "\"electron.js\"", 1, true) and not string.find(l_0_2, "\"background.js\"", 1, true) then
  l_0_3 = l_0_3 + 2
end
if not l_0_4 then
  return mp.CLEAN
end
if l_0_3 < 6 then
  return mp.CLEAN
end
set_research_data("electron_pkgjson_path", l_0_1, false)
set_research_data("electron_pkgjson_score", tostring(l_0_3), false)
return mp.INFECTED
