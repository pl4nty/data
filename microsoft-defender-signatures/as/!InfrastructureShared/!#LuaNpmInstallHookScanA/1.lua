-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNpmInstallHookScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1 ~= "package.json" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = (versioning.GetHostOsType)()
if l_0_3 == 1 then
  local l_0_8 = nil
end
do
  if not {["node.exe"] = true} then
    local l_0_11, l_0_13, l_0_17, l_0_20 = {}
    l_0_11.node = true
    l_0_11.npm = true
  end
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R5 in 'UnsetPending'

  if not l_0_11[l_0_2] then
    return mp.CLEAN
  end
  if l_0_8 then
    l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
    if l_0_0 == nil then
      return mp.CLEAN
    end
  end
  do
    local l_0_18, l_0_21 = , l_0_8 and "\\node_modules\\" or "/node_modules/"
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R6 in 'UnsetPending'

    if (string.find)(l_0_0, l_0_21, 1, true) == nil then
      return mp.CLEAN
    end
    local l_0_22 = nil
    if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and not (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
      return mp.CLEAN
    end
    if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
      return mp.CLEAN
    end
    local l_0_26 = nil
    if (mp.getfilesize)() == nil or (mp.getfilesize)() == 0 or (mp.getfilesize)() > 51200 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_27 = nil
    ;
    (mp.readprotection)(true)
    if tostring((mp.readfile)(0, (mp.getfilesize)())) == nil then
      return mp.CLEAN
    end
    local l_0_28 = nil
    local l_0_29 = nil
    do
      local l_0_30 = nil
      for l_0_34,l_0_35 in (string.gmatch)(l_0_30, "\"([%w%-]+)\"%s*:%s*\"([^\"]+)\"") do
        local l_0_31, l_0_32, l_0_33 = {preinstall = true, postinstall = true, install = true, preuninstall = true, uninstall = true, postuninstall = true, preprepare = true, prepare = true, prepublish = true, prepublishOnly = true}, 1504130729
        -- DECOMPILER ERROR at PC176: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC180: Confused about usage of register: R18 in 'UnsetPending'

        if l_0_31[R17_PC176] then
          local l_0_39 = nil
          if R18_PC180:match("^(%S+)%s+(.+)$") then
            local l_0_40 = nil
            if (string.lower)(R18_PC180:match("^(%S+)%s+(.+)$")) == "node" then
              l_0_39 = true
              for l_0_44 in R18_PC180:gmatch("%S+") do
                local l_0_41, l_0_42, l_0_43 = nil
                -- DECOMPILER ERROR at PC196: Confused about usage of register: R27 in 'UnsetPending'

                if R27_PC196:sub(1, 1) ~= "-" then
                  l_0_40 = R27_PC196
                  break
                end
              end
            end
          end
          if l_0_39 then
            if not l_0_40 then
              l_0_40 = l_0_38
            end
            l_0_40 = (l_0_40:gsub("^%./", "")):gsub("^%.\\", "")
            local l_0_45 = nil
            if l_0_8 then
              local l_0_46 = nil
              -- DECOMPILER ERROR at PC238: Overwrote pending register: R23 in 'AssignReg'

            else
              local l_0_47 = nil
              -- DECOMPILER ERROR at PC251: Overwrote pending register: R23 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC256: Confused about usage of register: R23 in 'UnsetPending'

            -- DECOMPILER ERROR at PC262: Confused about usage of register: R23 in 'UnsetPending'

            if nil and (sysio.IsFileExists)(nil) then
              (MpCommon.ReportLowfi)(nil, l_0_32)
            end
          end
        end
      end
      do return mp.CLEAN end
      -- DECOMPILER ERROR: 20 unprocessed JMP targets
    end
  end
end

