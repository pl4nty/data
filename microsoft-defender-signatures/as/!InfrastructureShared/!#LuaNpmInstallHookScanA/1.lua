-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNpmInstallHookScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  do return l_1_0 == " " or l_1_0 == "\t" or l_1_0 == "\n" or l_1_0 == "\r" or l_1_0 == "\v" or l_1_0 == "\f" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  if #l_2_0 ~= 4 then
    return false
  end
  for l_2_4 = 1, 4 do
    local l_2_5 = l_2_0:byte(l_2_4)
    if ((l_2_5 >= 48 and l_2_5 <= 57) or (l_2_5 >= 65 and l_2_5 <= 70) or (l_2_5 < 97 or l_2_5 > 102)) then
      return false
    end
  end
  return true
end

local l_0_3, l_0_4 = function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_0
  local l_3_1 = {}
  local l_3_2 = {}
  local l_3_3 = 1
  local l_3_4 = #l_3_0
  local l_3_5 = false
  local l_3_6 = nil
  while 1 do
    while 1 do
      while 1 do
        while 1 do
          while 1 do
            while 1 do
              while 1 do
                if l_3_3 <= l_3_4 then
                  local l_3_7 = l_3_0:sub(l_3_3, l_3_3)
                  if l_3_5 then
                    if l_3_7 == "\\" and l_3_3 < l_3_4 then
                      local l_3_8 = l_3_0:sub(l_3_3 + 1, l_3_3 + 1)
                      if l_3_8 == l_3_6 or l_3_8 == "\\" then
                        l_3_2[#l_3_2 + 1] = l_3_8
                        l_3_3 = l_3_3 + 2
                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
              l_3_2[#l_3_2 + 1] = l_3_7
              l_3_3 = l_3_3 + 1
            end
            do
              if l_3_7 == l_3_6 then
                l_3_5 = false
                l_3_6 = nil
                l_3_3 = l_3_3 + 1
                -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
          l_3_2[#l_3_2 + 1] = l_3_7
          l_3_3 = l_3_3 + 1
        end
        if l_3_7 == "\"" or l_3_7 == "\'" then
          l_3_5 = true
          l_3_6 = l_3_7
          l_3_3 = l_3_3 + 1
          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      if l_0_0(l_3_7) then
        do
          if #l_3_2 > 0 then
            local l_3_9 = #l_3_1 + 1
            l_3_1[l_3_9] = (table.concat)(l_3_2)
            l_3_2, l_3_9 = l_3_9, {}
          end
          l_3_3 = l_3_3 + 1
          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    l_3_2[#l_3_2 + 1] = l_3_7
    l_3_3 = l_3_3 + 1
  end
  do
    do
      if #l_3_2 > 0 then
        local l_3_10 = #l_3_1 + 1
        l_3_1[l_3_10] = (table.concat)(l_3_2)
      end
      return l_3_1
    end
  end
end
, (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if l_0_4 == nil or (mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH) == nil then
  return mp.CLEAN
end
local l_0_5 = nil
local l_0_6 = (string.lower)(l_0_4)
local l_0_7 = (string.lower)(l_0_5)
if l_0_7 ~= "package.json" then
  return mp.CLEAN
end
local l_0_8 = l_0_4
if type((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) ~= "string" or (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) == "" then
  return mp.CLEAN
end
local l_0_9 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if (versioning.GetHostOsType)() == 1 then
  local l_0_14 = nil
end
do
  if not {["node.exe"] = true} then
    local l_0_17, l_0_19, l_0_23, l_0_26 = , {}
    l_0_19.node = true
    l_0_19.npm = true
  end
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R11 in 'UnsetPending'

  if not l_0_19[l_0_9] then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R10 in 'UnsetPending'

  if l_0_17 then
    l_0_8 = (MpCommon.PathToWin32Path)(l_0_4)
    if l_0_8 == nil then
      return mp.CLEAN
    end
    l_0_6 = (string.lower)(l_0_8)
  end
  -- DECOMPILER ERROR at PC94: Confused about usage of register: R10 in 'UnsetPending'

  do
    local l_0_24, l_0_27 = nil
    if (string.find)(l_0_6, l_0_17 and "\\node_modules\\" or "/node_modules/", 1, true) == nil then
      return mp.CLEAN
    end
    local l_0_28 = nil
    if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and not (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
      return mp.CLEAN
    end
    if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
      return mp.CLEAN
    end
    local l_0_32 = nil
    if type((mp.getfilesize)()) ~= "number" or (mp.getfilesize)() <= 0 then
      return mp.CLEAN
    end
    do
      if (mp.getfilesize)() > 51200 then
        local l_0_33, l_0_34, l_0_35 = nil
      end
      ;
      (mp.readprotection)(false)
      local l_0_36 = nil
      ;
      (mp.readprotection)(true)
      if type((mp.readfile)(0, 51200)) ~= "string" or (mp.readfile)(0, 51200) == "" then
        return mp.CLEAN
      end
      local l_0_37 = nil
      local l_0_38 = nil
      for l_0_42 in pairs({preinstall = true, postinstall = true, install = true, preprepare = true, prepare = true}) do
        local l_0_39, l_0_40, l_0_41, l_0_42 = nil
      end
      local l_0_43 = nil
      local l_0_44 = nil
      local l_0_45 = nil
      local l_0_52, l_0_53 = , 0 + 1
      if not (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45) or not l_0_45 then
        return mp.CLEAN
      end
      do
        local l_0_54 = {node = 1504130729, python = 3232655123, python3 = 3081328517, bash = 701350438, sh = 1590358704, npx = 3351487242}
        while 1 do
          while 1 do
            -- DECOMPILER ERROR at PC242: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC250: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC251: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC255: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC256: Confused about usage of register: R25 in 'UnsetPending'

            -- DECOMPILER ERROR at PC259: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC266: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC267: Confused about usage of register: R31 in 'UnsetPending'

            -- DECOMPILER ERROR at PC267: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC271: Confused about usage of register: R31 in 'UnsetPending'

          end
          if (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45) <= l_0_45 then
            -- DECOMPILER ERROR at PC277: Unhandled construct in 'MakeBoolean' P3

            if (l_0_45 < (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45), R35_PC244) and l_0_45:sub((function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45), R35_PC244), R35_PC244) ~= ",") or l_0_45:sub((function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45), R35_PC244) + 1, R35_PC244), R35_PC244) ~= "\"" then
              local l_0_55, l_0_56 = {[".js"] = 544968205, [".cjs"] = 1467793051, [".mjs"] = 3463835425}, function(l_4_0, l_4_1)
  -- function num : 0_3
  return (l_4_0 - l_4_0 % l_4_1) / l_4_1
end

              if not l_0_45 then
                break
              end
              -- DECOMPILER ERROR at PC289: Confused about usage of register: R25 in 'UnsetPending'

              -- DECOMPILER ERROR at PC289: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC297: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC298: Confused about usage of register: R31 in 'UnsetPending'

              -- DECOMPILER ERROR at PC299: Confused about usage of register: R31 in 'UnsetPending'

              if not l_0_52[(function(l_6_0, l_6_1)
  -- function num : 0_5 , upvalues : l_0_1, l_0_r23
  local l_6_2 = l_6_1
  local l_6_3 = #l_6_0
  local l_6_4 = {}
  while 1 do
    while 1 do
      if l_6_2 <= l_6_3 then
        local l_6_5 = l_6_0:sub(l_6_2, l_6_2)
        if l_6_5 == "\"" then
          return (table.concat)(l_6_4), l_6_2 + 1
        end
        if l_6_5 == "\\" then
          if l_6_2 == l_6_3 then
            return nil, nil
          end
          local l_6_6 = l_6_0:sub(l_6_2 + 1, l_6_2 + 1)
          if l_6_6 == "\"" then
            l_6_4[#l_6_4 + 1] = "\""
          else
            if l_6_6 == "\\" then
              l_6_4[#l_6_4 + 1] = "\\"
            else
              if l_6_6 == "/" then
                l_6_4[#l_6_4 + 1] = "/"
              else
                if l_6_6 == "b" then
                  l_6_4[#l_6_4 + 1] = "\b"
                else
                  if l_6_6 == "f" then
                    l_6_4[#l_6_4 + 1] = "\f"
                  else
                    if l_6_6 == "n" then
                      l_6_4[#l_6_4 + 1] = "\n"
                    else
                      if l_6_6 == "r" then
                        l_6_4[#l_6_4 + 1] = "\r"
                      else
                        if l_6_6 == "t" then
                          l_6_4[#l_6_4 + 1] = "\t"
                        else
                          if l_6_6 == "u" then
                            local l_6_7 = l_6_0:sub(l_6_2 + 2, l_6_2 + 5)
                            if l_0_1(l_6_7) then
                              local l_6_8 = tonumber(l_6_7, 16)
                              local l_6_9 = 0
                              if l_6_8 >= 55296 and l_6_8 <= 56319 then
                                if l_6_2 + 11 <= l_6_3 and l_6_0:sub(l_6_2 + 6, l_6_2 + 7) == "\\u" then
                                  local l_6_10 = l_6_0:sub(l_6_2 + 8, l_6_2 + 11)
                                  if l_0_1(l_6_10) then
                                    local l_6_11 = tonumber(l_6_10, 16)
                                    if l_6_11 >= 56320 and l_6_11 <= 57343 then
                                      l_6_8 = 65536 + (l_6_8 - 55296) * 1024 + (l_6_11 - 56320)
                                      l_6_9 = 6
                                    else
                                      l_6_8 = 65533
                                    end
                                  else
                                    do
                                      do
                                        do
                                          do
                                            do
                                              l_6_8 = 65533
                                              l_6_8 = 65533
                                              if l_6_8 >= 56320 and l_6_8 <= 57343 then
                                                l_6_8 = 65533
                                              end
                                              l_0_r23(l_6_4, l_6_8)
                                              l_6_2 = l_6_2 + 4 + l_6_9
                                              l_6_4[#l_6_4 + 1] = "u"
                                              l_6_4[#l_6_4 + 1] = l_6_6
                                              l_6_2 = l_6_2 + 2
                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    l_6_4[#l_6_4 + 1] = l_6_5
    l_6_2 = l_6_2 + 1
  end
  do
    return nil, nil
  end
end
)(l_0_45, (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45), R35_PC244) + 1, R35_PC244) + 1 + 1)] == true or l_0_45 >= R35_PC244 then
                if R35_PC244 ~= ":" then
                  break
                end
                -- DECOMPILER ERROR at PC304: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC304: Overwrote pending register: R35 in 'AssignReg'

                -- DECOMPILER ERROR at PC306: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC306: Overwrote pending register: R37 in 'AssignReg'

                -- DECOMPILER ERROR at PC307: Overwrote pending register: R38 in 'AssignReg'

              end
              if l_0_45 < R35_PC244 then
                break
              end
              -- DECOMPILER ERROR at PC313: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC314: Confused about usage of register: R31 in 'UnsetPending'

              -- DECOMPILER ERROR at PC314: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC315: Confused about usage of register: R31 in 'UnsetPending'

              -- DECOMPILER ERROR at PC315: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC319: Confused about usage of register: R34 in 'UnsetPending'

              -- DECOMPILER ERROR at PC321: Confused about usage of register: R24 in 'UnsetPending'

              -- DECOMPILER ERROR at PC321: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC323: Confused about usage of register: R31 in 'UnsetPending'

              -- DECOMPILER ERROR at PC323: Overwrote pending register: R37 in 'AssignReg'

              if R35_PC244 == "\"" and l_0_52[(function(l_6_0, l_6_1)
  -- function num : 0_5 , upvalues : l_0_1, l_0_r23
  local l_6_2 = l_6_1
  local l_6_3 = #l_6_0
  local l_6_4 = {}
  while 1 do
    while 1 do
      if l_6_2 <= l_6_3 then
        local l_6_5 = l_6_0:sub(l_6_2, l_6_2)
        if l_6_5 == "\"" then
          return (table.concat)(l_6_4), l_6_2 + 1
        end
        if l_6_5 == "\\" then
          if l_6_2 == l_6_3 then
            return nil, nil
          end
          local l_6_6 = l_6_0:sub(l_6_2 + 1, l_6_2 + 1)
          if l_6_6 == "\"" then
            l_6_4[#l_6_4 + 1] = "\""
          else
            if l_6_6 == "\\" then
              l_6_4[#l_6_4 + 1] = "\\"
            else
              if l_6_6 == "/" then
                l_6_4[#l_6_4 + 1] = "/"
              else
                if l_6_6 == "b" then
                  l_6_4[#l_6_4 + 1] = "\b"
                else
                  if l_6_6 == "f" then
                    l_6_4[#l_6_4 + 1] = "\f"
                  else
                    if l_6_6 == "n" then
                      l_6_4[#l_6_4 + 1] = "\n"
                    else
                      if l_6_6 == "r" then
                        l_6_4[#l_6_4 + 1] = "\r"
                      else
                        if l_6_6 == "t" then
                          l_6_4[#l_6_4 + 1] = "\t"
                        else
                          if l_6_6 == "u" then
                            local l_6_7 = l_6_0:sub(l_6_2 + 2, l_6_2 + 5)
                            if l_0_1(l_6_7) then
                              local l_6_8 = tonumber(l_6_7, 16)
                              local l_6_9 = 0
                              if l_6_8 >= 55296 and l_6_8 <= 56319 then
                                if l_6_2 + 11 <= l_6_3 and l_6_0:sub(l_6_2 + 6, l_6_2 + 7) == "\\u" then
                                  local l_6_10 = l_6_0:sub(l_6_2 + 8, l_6_2 + 11)
                                  if l_0_1(l_6_10) then
                                    local l_6_11 = tonumber(l_6_10, 16)
                                    if l_6_11 >= 56320 and l_6_11 <= 57343 then
                                      l_6_8 = 65536 + (l_6_8 - 55296) * 1024 + (l_6_11 - 56320)
                                      l_6_9 = 6
                                    else
                                      l_6_8 = 65533
                                    end
                                  else
                                    do
                                      do
                                        do
                                          do
                                            do
                                              l_6_8 = 65533
                                              l_6_8 = 65533
                                              if l_6_8 >= 56320 and l_6_8 <= 57343 then
                                                l_6_8 = 65533
                                              end
                                              l_0_r23(l_6_4, l_6_8)
                                              l_6_2 = l_6_2 + 4 + l_6_9
                                              l_6_4[#l_6_4 + 1] = "u"
                                              l_6_4[#l_6_4 + 1] = l_6_6
                                              l_6_2 = l_6_2 + 2
                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    l_6_4[#l_6_4 + 1] = l_6_5
    l_6_2 = l_6_2 + 1
  end
  do
    return nil, nil
  end
end
)(l_0_45, (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_0
  local l_7_3 = l_7_1
  while l_7_3 <= l_7_2 and l_0_0(l_7_0:sub(l_7_3, l_7_3)) do
    l_7_3 = l_7_3 + 1
  end
  return l_7_3
end
)(l_0_45, (function(l_10_0)
  -- function num : 0_9 , upvalues : l_0_r24, l_0_r25, l_0_r26, l_0_r27
  local l_10_1 = 1
  local l_10_2 = #l_10_0
  while 1 do
    while 1 do
      while 1 do
        if l_10_1 <= l_10_2 then
          local l_10_3 = l_10_0:sub(l_10_1, l_10_1)
          if l_10_3 == "\"" then
            local l_10_4, l_10_5 = l_0_r24(l_10_0, l_10_1 + 1)
            if not l_10_5 then
              return nil, nil
            end
            local l_10_6 = l_0_r25(l_10_0, l_10_5, l_10_2)
            if l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == ":" then
              l_10_6 = l_0_r25(l_10_0, l_10_6 + 1, l_10_2)
              do
                if l_10_4 == "scripts" and l_10_6 <= l_10_2 and l_10_0:sub(l_10_6, l_10_6) == "{" then
                  local l_10_7 = l_0_r26(l_10_0, l_10_6, l_10_2, "{", "}")
                  if not l_10_7 then
                    return nil, nil
                  end
                  return l_10_6 + 1, l_10_7 - 2
                end
                do
                  local l_10_8 = l_0_r27(l_10_0, l_10_6, l_10_2)
                  if not l_10_8 then
                    return nil, nil
                  end
                  l_10_1 = l_10_8
                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_10_1 = l_10_5
    end
    do
      do
        l_10_1 = l_10_1 + 1
        -- DECOMPILER ERROR at PC75: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return nil, nil
end
)(l_0_45), R35_PC244) + 1, R35_PC244) + 1 + 1)] == true then
                local l_0_61, l_0_62 = function(l_5_0, l_5_1)
  -- function num : 0_4 , upvalues : l_0_r22
  if l_5_1 < 0 or l_5_1 > 1114111 then
    l_5_1 = 65533
  end
  if l_5_1 <= 127 then
    local l_5_2 = #l_5_0 + 1
    l_5_0[l_5_2] = (string.char)(l_5_1)
  else
    do
      if l_5_1 <= 2047 then
        local l_5_3 = 192 + l_0_r22(l_5_1, 64)
        local l_5_4 = 128 + l_5_1 % 64
        local l_5_5 = #l_5_0 + 1
        l_5_0[l_5_5] = (string.char)(l_5_3, l_5_4)
      else
        do
          if l_5_1 <= 65535 then
            local l_5_6 = 224 + l_0_r22(l_5_1, 4096)
            local l_5_7 = 128 + l_0_r22(l_5_1, 64) % 64
            local l_5_8 = 128 + l_5_1 % 64
            local l_5_9 = #l_5_0 + 1
            l_5_0[l_5_9] = (string.char)(l_5_6, l_5_7, l_5_8)
          else
            do
              local l_5_10 = 240 + l_0_r22(l_5_1, 262144)
              local l_5_11 = 128 + l_0_r22(l_5_1, 4096) % 64
              local l_5_12 = 128 + l_0_r22(l_5_1, 64) % 64
              local l_5_13 = 128 + l_5_1 % 64
              local l_5_14 = #l_5_0 + 1
              l_5_0[l_5_14] = (string.char)(l_5_10, l_5_11, l_5_12, l_5_13)
            end
          end
        end
      end
    end
  end
end

                if not l_0_45 then
                  break
                end
                -- DECOMPILER ERROR at PC331: Overwrote pending register: R38 in 'AssignReg'

                -- DECOMPILER ERROR at PC331: Overwrote pending register: R37 in 'AssignReg'

                if R35_PC244 ~= nil then
                  local l_0_63, l_0_64 = , function(l_8_0, l_8_1, l_8_2, l_8_3, l_8_4)
  -- function num : 0_7 , upvalues : l_0_r24
  local l_8_5 = l_8_1 + 1
  local l_8_6 = 1
  while 1 do
    while 1 do
      while 1 do
        while 1 do
          if l_8_5 <= l_8_2 then
            local l_8_7 = l_8_0:sub(l_8_5, l_8_5)
            if l_8_7 == "\"" then
              do
                local l_8_8, l_8_9 = l_0_r24(l_8_0, l_8_5 + 1)
                if not l_8_9 then
                  return nil
                end
                l_8_5 = l_8_9
                -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        if l_8_7 == l_8_3 then
          l_8_6 = l_8_6 + 1
          l_8_5 = l_8_5 + 1
          -- DECOMPILER ERROR at PC24: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC24: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      if l_8_7 == l_8_4 then
        l_8_6 = l_8_6 - 1
        l_8_5 = l_8_5 + 1
        if l_8_6 == 0 then
          return l_8_5
        end
        -- DECOMPILER ERROR at PC32: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC32: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    l_8_5 = l_8_5 + 1
  end
  do
    return nil
  end
end

                  local l_0_65 = function(l_9_0, l_9_1, l_9_2)
  -- function num : 0_8 , upvalues : l_0_r25, l_0_r24, l_0_r26
  local l_9_3 = l_0_r25(l_9_0, l_9_1, l_9_2)
  if l_9_2 < l_9_3 then
    return nil
  end
  local l_9_4 = l_9_0:sub(l_9_3, l_9_3)
  if l_9_4 == "\"" then
    local l_9_5, l_9_6, l_9_7 = l_0_r24(l_9_0, l_9_3 + 1)
    return l_9_6
  else
    do
      if l_9_4 == "{" then
        local l_9_8 = l_0_r26
        local l_9_9 = l_9_0
        local l_9_10 = l_9_3
        local l_9_11 = l_9_2
        do
          local l_9_12 = "{"
          do return l_9_8(l_9_9, l_9_10, l_9_11, l_9_12, "}") end
          -- DECOMPILER ERROR at PC31: Confused about usage of register R6 for local variables in 'ReleaseLocals'

          if l_9_4 == "[" then
            local l_9_13 = nil
            local l_9_14 = nil
            local l_9_15 = nil
            local l_9_16 = nil
            local l_9_17 = nil
            do
              local l_9_18 = nil
              do return l_0_r26(l_9_13, l_9_14, l_9_15, l_9_16, l_9_17) end
              -- DECOMPILER ERROR at PC42: Confused about usage of register R6 for local variables in 'ReleaseLocals'

              while 1 do
                -- DECOMPILER ERROR at PC46: Overwrote pending register: R7 in 'AssignReg'

                -- DECOMPILER ERROR at PC47: Overwrote pending register: R8 in 'AssignReg'

                if l_9_3 <= l_9_2 then
                  l_9_4 = l_9_0:sub(l_9_14, l_9_15)
                  if l_9_4 == "," or l_9_4 == "}" or l_9_4 == "]" then
                    return l_9_3
                  end
                  l_9_3 = l_9_3 + 1
                  -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
              do return l_9_3 end
              -- DECOMPILER ERROR at PC60: Confused about usage of register R5 for local variables in 'ReleaseLocals'

            end
          end
        end
      end
    end
  end
end

                  if type(l_0_3(R35_PC244)) ~= "table" then
                    local l_0_66 = nil
                    local l_0_67 = nil
                    -- DECOMPILER ERROR at PC349: Confused about usage of register: R40 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC353: Confused about usage of register: R40 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC355: Overwrote pending register: R41 in 'AssignReg'

                    -- DECOMPILER ERROR at PC356: Overwrote pending register: R37 in 'AssignReg'

                    if type(({})[1]) == "string" and ({})[1] ~= "" and R37_PC293 then
                      local l_0_68 = nil
                      -- DECOMPILER ERROR at PC360: Confused about usage of register: R41 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC362: Confused about usage of register: R41 in 'UnsetPending'

                      if nil == "node" or nil == "npx" then
                        local l_0_69 = R31_PC365
                        -- DECOMPILER ERROR at PC374: Overwrote pending register: R42 in 'AssignReg'

                      else
                        -- DECOMPILER ERROR at PC376: Confused about usage of register: R41 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC378: Confused about usage of register: R41 in 'UnsetPending'

                        if nil == "python" or nil == "python3" then
                          local l_0_70 = nil
                          -- DECOMPILER ERROR at PC386: Overwrote pending register: R42 in 'AssignReg'

                        end
                      end
                      local l_0_71 = nil
                      -- DECOMPILER ERROR at PC389: Confused about usage of register: R39 in 'UnsetPending'

                      for l_0_75 = 2, #{} do
                        local l_0_72, l_0_73, l_0_74, l_0_75 = , R35_PC244
                        -- DECOMPILER ERROR at PC392: Confused about usage of register: R47 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC392: Confused about usage of register: R39 in 'UnsetPending'

                        do
                          do
                            local l_0_76 = nil
                            -- DECOMPILER ERROR at PC399: Confused about usage of register: R39 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC403: Confused about usage of register: R39 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC403: Overwrote pending register: R38 in 'AssignReg'

                            -- DECOMPILER ERROR at PC404: Unhandled construct in 'MakeBoolean' P1

                            if (not false or ({})[R47_PC392] == "--") and R47_PC392 < #{} then
                              do break end
                              -- DECOMPILER ERROR at PC406: Confused about usage of register: R48 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC412: Confused about usage of register: R48 in 'UnsetPending'

                              if (({})[R47_PC392]):sub(1, 2) == "--" then
                                local l_0_77 = R37_PC293
                                -- DECOMPILER ERROR at PC419: Confused about usage of register: R42 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC422: Confused about usage of register: R42 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC424: Confused about usage of register: R48 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC424: Confused about usage of register: R42 in 'UnsetPending'

                              else
                                -- DECOMPILER ERROR at PC429: Confused about usage of register: R48 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC435: Confused about usage of register: R42 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC437: Confused about usage of register: R48 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC437: Confused about usage of register: R42 in 'UnsetPending'

                              end
                              -- DECOMPILER ERROR at PC442: Confused about usage of register: R48 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC442: Overwrote pending register: R38 in 'AssignReg'

                            end
                            -- DECOMPILER ERROR at PC443: Unhandled construct in 'MakeBoolean' P1

                            if ((({})[R47_PC392]):match("^([^=]+)=") == nil or not nil or not (nil)[(({})[R47_PC392]):match("^([^=]+)=")]) and nil and (nil)[({})[R47_PC392]] and (({})[R47_PC392]):sub(1, 1) == "-" and nil and (nil)[({})[R47_PC392]] then
                              break
                            end
                            -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out DO_STMT

                          end
                        end
                      end
                    end
                    -- DECOMPILER ERROR at PC449: Overwrote pending register: R38 in 'AssignReg'

                    -- DECOMPILER ERROR at PC451: Overwrote pending register: R43 in 'AssignReg'

                    -- DECOMPILER ERROR at PC457: Confused about usage of register: R35 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC457: Overwrote pending register: R38 in 'AssignReg'

                    -- DECOMPILER ERROR at PC473: Overwrote pending register: R38 in 'AssignReg'

                    if (((R38_PC293 or type(true) == "string") and R38_PC293 ~= "") or type(R38_PC293) == "string") and R38_PC293 ~= "" then
                      local l_0_78 = nil
                      local l_0_79 = nil
                      if l_0_28 then
                        local l_0_80 = nil
                        -- DECOMPILER ERROR at PC499: Overwrote pending register: R43 in 'AssignReg'

                      else
                        local l_0_81 = nil
                        -- DECOMPILER ERROR at PC512: Overwrote pending register: R43 in 'AssignReg'

                      end
                      -- DECOMPILER ERROR at PC517: Confused about usage of register: R43 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC526: Confused about usage of register: R37 in 'UnsetPending'

                      do
                        do
                          do
                            if not (((string.lower)(R38_PC293)):match("(%.[^%.\\/]+)$")) or not l_0_55[(((string.lower)(R38_PC293)):match("(%.[^%.\\/]+)$"))] then
                              local l_0_82, l_0_83, l_0_84 = nil
                            end
                            -- DECOMPILER ERROR at PC534: Confused about usage of register: R43 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC535: Confused about usage of register: R44 in 'UnsetPending'

                            if type(not nil or not (sysio.IsFileExists)(nil) or l_0_77) == "number" then
                              (MpCommon.ReportLowfi)(nil, not nil or not (sysio.IsFileExists)(nil) or l_0_77)
                            end
                            -- DECOMPILER ERROR at PC538: Confused about usage of register: R27 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC540: Confused about usage of register: R31 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC541: Confused about usage of register: R30 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC541: Overwrote pending register: R38 in 'AssignReg'

                            if not l_0_65(l_0_45, l_0_79, R38_PC293) then
                              break
                            end
                            if l_0_53 == 0 then
                              break
                            end
                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC550: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC554: freeLocal<0 in 'ReleaseLocals'

        -- DECOMPILER ERROR: 52 unprocessed JMP targets
      end
    end
  end
end

