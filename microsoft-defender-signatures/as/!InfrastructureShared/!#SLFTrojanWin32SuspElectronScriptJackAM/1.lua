-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32SuspElectronScriptJackAM\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if l_0_0 < 50 or l_0_0 > 5000000 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
if (string.sub)(l_0_1, -3) ~= ".js" then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_1, "\\resources\\app\\", 1, true) then
    local l_0_2, l_0_3, l_0_4 = (string.find)(l_0_1, "\\resources\\app.asar", 1, true)
  end
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

  if isnull(l_0_2) then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  local l_0_5 = nil
  ;
  (mp.readprotection)(true)
  if isnull((mp.readfile)(0, l_0_0)) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  if not (string.find)(tostring((mp.readfile)(0, l_0_0)), "child_process", 1, true) then
    return mp.CLEAN
  end
  do
    -- DECOMPILER ERROR at PC392: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC392: Unhandled construct in 'MakeBoolean' P3

    if (((((((((((((((((((((((((string.find)(l_0_7, "execute-bof-node", 1, true) and not (string.find)(l_0_7, "execute-assembly-node", 1, true)) or (string.find)(l_0_7, "execute-scexec-node", 1, true)) and not (string.find)(l_0_7, "func_Command_Handler", 1, true)) or (string.find)(l_0_7, "func_ProcessBof", 1, true)) and not (string.find)(l_0_7, "func_ProcessAssembly", 1, true)) or (string.find)(l_0_7, "func_ProcessScexec", 1, true)) and not (string.find)(l_0_7, "func_ProcessSocks", 1, true)) or (string.find)(l_0_7, "BeaconPack", 1, true)) and not (string.find)(l_0_7, "socks-proxy", 1, true)) or not (string.find)(l_0_7, ".node\')", 1, true)) and not (string.find)(l_0_7, ".node\")", 1, true)) or (string.find)(l_0_7, "coffloader", 1, true)) and not (string.find)(l_0_7, "scexec", 1, true)) or (string.find)(l_0_7, "blob.core.windows.net", 1, true)) and not (string.find)(l_0_7, "x-ms-meta-", 1, true)) or (string.find)(l_0_7, "storageAccount", 1, true)) and not (string.find)(l_0_7, "ipcMain", 1, true)) or (string.find)(l_0_7, "execSync", 1, true)) and not (string.find)(l_0_7, "new Function(", 1, true)) or not (string.find)(l_0_7, "require(\'net\')", 1, true)) and not (string.find)(l_0_7, "require(\"net\")", 1, true)) or not (string.find)(l_0_7, "require(\'tls\')", 1, true)) and not (string.find)(l_0_7, "require(\"tls\")", 1, true)) or (string.find)(l_0_7, "Buffer.from(", 1, true)) and ((string.find)(l_0_7, "\'base64\'", 1, true) or (string.find)(l_0_7, "\"base64\"", 1, true)) then
      local l_0_6 = 0 + 3 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 3 + 4 + 4 + 3 + 3 + 2 + 3 + 2 + 1 + 2 + 1 + 1 + 2
    end
    -- DECOMPILER ERROR at PC392: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_6 < 15 then
      return mp.CLEAN
    end
    set_research_data("electron_susp_js_path", l_0_1, false)
    -- DECOMPILER ERROR at PC405: Confused about usage of register: R4 in 'UnsetPending'

    set_research_data("electron_susp_js_score", tostring(l_0_6), false)
    set_research_data("electron_susp_js_size", tostring(l_0_0), false)
    return mp.INFECTED
  end
end

