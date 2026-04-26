-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32SuspElectronS\1.luac 

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
  local l_0_7 = tostring((mp.readfile)(0, l_0_0))
  local l_0_9 = 0
  if not (string.find)(l_0_7, "child_process", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC120: Overwrote pending register: R4 in 'AssignReg'

  do
    if (string.find)(l_0_7, "execute-bof-node", 1, true) then
      local l_0_6 = false
    end
    -- DECOMPILER ERROR at PC131: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC142: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC153: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC164: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC175: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC186: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC197: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC208: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC219: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC238: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC249: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC260: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC271: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC282: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC302: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC322: Overwrote pending register: R4 in 'AssignReg'

    do
      do
        -- DECOMPILER ERROR at PC324: Unhandled construct in 'MakeBoolean' P3

        if (((((((((((((((((string.find)(l_0_7, "execute-assembly-node", 1, true) and not (string.find)(l_0_7, "execute-scexec-node", 1, true)) or (string.find)(l_0_7, "func_Command_Handler", 1, true)) and not (string.find)(l_0_7, "func_ProcessBof", 1, true)) or (string.find)(l_0_7, "func_ProcessAssembly", 1, true)) and not (string.find)(l_0_7, "func_ProcessScexec", 1, true)) or (string.find)(l_0_7, "func_ProcessSocks", 1, true)) and not (string.find)(l_0_7, "BeaconPack", 1, true)) or (string.find)(l_0_7, "socks-proxy", 1, true)) and (string.find)(l_0_7, ".node\')", 1, true)) or (string.find)(l_0_7, ".node\")", 1, true)) and not (string.find)(l_0_7, "coffloader", 1, true)) or (string.find)(l_0_7, "scexec", 1, true)) and not (string.find)(l_0_7, "blob.core.windows.net", 1, true)) or (string.find)(l_0_7, "x-ms-meta-", 1, true)) and not (string.find)(l_0_7, "storageAccount", 1, true)) or (string.find)(l_0_7, "ipcMain", 1, true)) and (string.find)(l_0_7, "ipcRenderer", 1, true) then
          local l_0_8 = true
        end
        -- DECOMPILER ERROR at PC333: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC343: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC362: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC381: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC409: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC412: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC414: Confused about usage of register: R5 in 'UnsetPending'

        if not l_0_8 and not (((((((string.find)(l_0_7, "execSync", 1, true) and not (string.find)(l_0_7, "new Function(", 1, true)) or not (string.find)(l_0_7, "require(\'net\')", 1, true)) and not (string.find)(l_0_7, "require(\"net\")", 1, true)) or not (string.find)(l_0_7, "require(\'tls\')", 1, true)) and not (string.find)(l_0_7, "require(\"tls\")", 1, true)) or (string.find)(l_0_7, "Buffer.from(", 1, true)) and not (string.find)(l_0_7, "\'base64\'", 1, true) and 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 >= 4 then
          return mp.CLEAN
        end
        if l_0_9 < 18 then
          return mp.CLEAN
        end
        set_research_data("electron_susp_js_path", l_0_1, false)
        set_research_data("electron_susp_js_score", tostring(l_0_9), false)
        set_research_data("electron_susp_js_size", tostring(l_0_0), false)
        do return mp.INFECTED end
        -- DECOMPILER ERROR: 3 unprocessed JMP targets
      end
    end
  end
end

