-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/SuspElectronScriptsJacked.AM
-- Type: 24
-- Includes: BMLuaLib, ResearchData

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 50 or 5000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if string.sub(l_0_1, -3) ~= ".js" then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "\\resources\\app\\", 1, true) or string.find(l_0_1, "\\resources\\app.asar", 1, true)
if isnull(l_0_2) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = tostring(l_0_3)
local l_0_4 = 0
local l_0_5 = false
local l_0_6 = 0
local l_0_7 = string.find(l_0_3, "child_process", 1, true)
if not l_0_7 then
  return mp.CLEAN
end
l_0_4 = l_0_4 + 3
if string.find(l_0_3, "execute-bof-node", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "execute-assembly-node", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "execute-scexec-node", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "func_Command_Handler", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "func_ProcessBof", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "func_ProcessAssembly", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "func_ProcessScexec", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "func_ProcessSocks", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "BeaconPack", 1, true) then
  l_0_4 = l_0_4 + 5
  l_0_5 = true
end
if string.find(l_0_3, "socks-proxy", 1, true) then
  l_0_4 = l_0_4 + 3
end
if string.find(l_0_3, ".node')", 1, true) or string.find(l_0_3, ".node\")", 1, true) then
  l_0_4 = l_0_4 + 4
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "coffloader", 1, true) then
  l_0_4 = l_0_4 + 4
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "scexec", 1, true) then
  l_0_4 = l_0_4 + 3
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "blob.core.windows.net", 1, true) then
  l_0_4 = l_0_4 + 3
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "x-ms-meta-", 1, true) then
  l_0_4 = l_0_4 + 2
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "storageAccount", 1, true) and string.find(l_0_3, "containerName", 1, true) then
  l_0_4 = l_0_4 + 3
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "ipcMain", 1, true) and string.find(l_0_3, "ipcRenderer", 1, true) then
  l_0_4 = l_0_4 + 2
  l_0_6 = l_0_6 + 1
end
if string.find(l_0_3, "execSync", 1, true) then
  l_0_4 = l_0_4 + 1
end
if string.find(l_0_3, "new Function(", 1, true) then
  l_0_4 = l_0_4 + 2
end
if string.find(l_0_3, "require('net')", 1, true) or string.find(l_0_3, "require(\"net\")", 1, true) then
  l_0_4 = l_0_4 + 1
end
if string.find(l_0_3, "require('tls')", 1, true) or string.find(l_0_3, "require(\"tls\")", 1, true) then
  l_0_4 = l_0_4 + 1
end
if string.find(l_0_3, "Buffer.from(", 1, true) and (string.find(l_0_3, "'base64'", 1, true) or string.find(l_0_3, "\"base64\"", 1, true)) then
  l_0_4 = l_0_4 + 2
end
local l_0_9 = 4 <= l_0_6
if not l_0_5 and not l_0_9 then
  return mp.CLEAN
end
if l_0_4 < 18 then
  return mp.CLEAN
end
set_research_data("electron_susp_js_path", l_0_1, false)
set_research_data("electron_susp_js_score", tostring(l_0_4), false)
set_research_data("electron_susp_js_size", tostring(l_0_0), false)
return mp.INFECTED
