-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMSuspInstallLolbinA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "package.json" then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if type(l_0_1) ~= "number" or l_0_1 < 2 or l_0_1 > 262144 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
;
(mp.readprotection)(true)
if not l_0_2 or l_0_3 == nil then
  (mp.set_mpattribute)("Lua:SuspInstallLolbinReadFailed")
  return mp.CLEAN
end
local l_0_4 = tostring(l_0_3)
if #l_0_4 ~= l_0_1 then
  (mp.set_mpattribute)("Lua:SuspInstallLolbinPartialRead")
  return mp.CLEAN
end
if (string.sub)(l_0_4, 1, 3) == "ï»\191" then
  l_0_4 = (string.sub)(l_0_4, 4)
end
local l_0_5 = safeJsonDeserialize(l_0_4)
if type(l_0_5) ~= "table" or type(l_0_5.scripts) ~= "table" then
  return mp.CLEAN
end
local l_0_6 = {}
l_0_6.curl = true
l_0_6.wget = true
l_0_6.powershell = true
l_0_6.pwsh = true
l_0_6.certutil = true
l_0_6.bitsadmin = true
l_0_6.mshta = true
l_0_6.msiexec = true
l_0_6.rundll32 = true
l_0_6.regsvr32 = true
l_0_6.cscript = true
l_0_6.wscript = true
l_0_6.msbuild = true
l_0_6.installutil = true
l_0_6.regasm = true
l_0_6.regsvcs = true
l_0_6.wmic = true
local l_0_7 = {}
l_0_7[";"] = true
l_0_7["&"] = true
l_0_7["|"] = true
l_0_7["("] = true
l_0_7[")"] = true
l_0_7["\n"] = true
l_0_7["\r"] = true
local l_0_8 = {}
l_0_8.env = true
l_0_8.nohup = true
l_0_8.command = true
l_0_8.exec = true
l_0_8.call = true
l_0_8["cross-env"] = true
l_0_8["cross-env.cmd"] = true
l_0_8["if"] = true
l_0_8["then"] = true
l_0_8["else"] = true
l_0_8.elif = true
l_0_8["do"] = true
l_0_8["while"] = true
l_0_8["until"] = true
local l_0_9 = {}
l_0_9.cmd = true
l_0_9["%comspec%"] = true
l_0_9.sh = true
l_0_9.bash = true
l_0_9.dash = true
l_0_9.zsh = true
l_0_9.ksh = true
local l_0_10 = {}
l_0_10.env = true
l_0_10.nohup = true
l_0_10.command = true
l_0_10.exec = true
l_0_10.call = true
l_0_10["cross-env"] = true
l_0_10["cross-env.cmd"] = true
do
  local l_0_15, l_0_16 = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0 , upvalues : l_0_11
  if l_1_2 > 16 then
    return nil
  end
  local l_1_3 = (string.sub)(l_1_0, l_1_1, l_1_1)
  local l_1_4 = {}
  l_1_4["("] = ")"
  l_1_4["{"] = "}"
  l_1_4["`"] = "`"
  l_1_4 = l_1_4[l_1_3]
  if l_1_4 == nil then
    return nil
  end
  local l_1_5 = nil
  l_1_1 = l_1_1 + 1
  while 1 do
    while 1 do
      while 1 do
        while 1 do
          while 1 do
            while 1 do
              while 1 do
                while 1 do
                  while 1 do
                    while 1 do
                      if l_1_1 <= #l_1_0 then
                        local l_1_6 = (string.sub)(l_1_0, l_1_1, l_1_1)
                        local l_1_7 = (string.sub)(l_1_0, l_1_1 + 1, l_1_1 + 1)
                        if l_1_6 == "\\" and l_1_5 ~= "\'" then
                          l_1_1 = l_1_1 + 2
                          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
                    end
                    if l_1_5 == "\'" then
                      if l_1_6 == "\'" then
                        l_1_5 = nil
                      end
                      l_1_1 = l_1_1 + 1
                      -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                  if l_1_6 == "`" and l_1_4 == "`" then
                    do return l_1_1 end
                    -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
                if l_1_6 == "`" or l_1_6 == "$" and l_1_7 == "(" then
                  if l_1_6 ~= "`" or not l_1_1 then
                    do
                      local l_1_11 = nil
                      if l_0_11(l_1_0, l_1_1 + 1, l_1_2 + 1) == nil then
                        return nil
                      end
                      l_1_1 = l_0_11(l_1_0, l_1_1 + 1, l_1_2 + 1) + 1
                      -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
              if l_1_5 ~= nil then
                if l_1_6 == l_1_5 then
                  l_1_5 = nil
                end
                l_1_1 = l_1_1 + 1
                -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
            if l_1_6 == "\'" or l_1_6 == "\"" then
              l_1_5 = l_1_6
              l_1_1 = l_1_1 + 1
              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
          if l_1_6 == "#" then
            if (l_1_1 == 1 or (string.find)((string.sub)(l_1_0, l_1_1 - 1, l_1_1 - 1), "[%s;&|()]")) and not (string.find)(l_1_0, "[\r\n]", l_1_1) then
              l_1_1 = #l_1_0 + 1
              -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
        if l_1_6 == l_1_3 then
          do
            local l_1_12 = l_0_11(l_1_0, l_1_1, l_1_2 + 1)
            if l_1_12 == nil then
              return nil
            end
            l_1_1 = l_1_12 + 1
            -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
      if l_1_6 == l_1_4 then
        do return l_1_1 end
        -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    l_1_1 = l_1_1 + 1
  end
  do
    return nil
  end
end
, function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_11, l_0_7
  local l_2_2 = (string.sub)(l_2_0, l_2_1, l_2_1)
  if (string.sub)(l_2_0, l_2_1, l_2_1 + 1) == "((" then
    local l_2_3 = l_0_11(l_2_0, l_2_1, 0)
    if l_2_3 == nil then
      return nil, #l_2_0 + 1, false
    end
    local l_2_4 = (string.sub)(l_2_0, l_2_1 + 2, l_2_3 - 2)
    local l_2_5 = "$"
    local l_2_6 = l_2_3 + 1
    local l_2_7 = false
    local l_2_8 = {}
    local l_2_9 = {}
    l_2_9.text = l_2_4
    l_2_9.expression_only = true
    -- DECOMPILER ERROR at PC39: No list found for R8 , SetList fails

    return l_2_5, l_2_6, l_2_7, l_2_8
  end
  do
    if l_0_7[l_2_2] or (string.find)(l_2_2, "%s") then
      return l_2_2, l_2_1 + 1, true
    end
    if l_2_2 == "#" then
      local l_2_10 = (string.find)(l_2_0, "[\r\n]", l_2_1)
      local l_2_11 = "\n"
      if not l_2_10 then
        do
          do return l_2_11, #l_2_0 + 1, true end
          local l_2_13 = nil
          local l_2_14 = {}
          do
            local l_2_15 = {}
            while 1 do
              while 1 do
                while 1 do
                  while 1 do
                    while 1 do
                      while 1 do
                        while 1 do
                          while 1 do
                            if l_2_1 <= #l_2_0 then
                              local l_2_16 = nil
                              if l_2_13 == "\\" and l_2_16 ~= "\'" and (string.sub)(l_2_0, l_2_1 + 1, l_2_1 + 1) == "\n" then
                                l_2_1 = l_2_1 + 2
                                -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                          if l_2_13 == "\\" and l_2_16 ~= "\'" and (string.sub)(l_2_0, l_2_1 + 1, l_2_1 + 1) == "\r" and (string.sub)(l_2_0, l_2_1 + 2, l_2_1 + 2) == "\n" then
                            l_2_1 = l_2_1 + 3
                            -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

                        if (l_2_13 == "\\" and l_2_16 ~= "\'" and (string.sub)(l_2_0, l_2_1 + 1, l_2_1 + 1) == l_2_16) or l_2_16 ~= nil or l_2_13 == "^" and l_2_16 == nil then
                          l_2_14[#l_2_14 + 1] = (string.sub)(l_2_0, l_2_1 + 1, l_2_1 + 1)
                          l_2_1 = l_2_1 + 2
                          -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
                      if l_2_16 ~= "\'" and (l_2_13 == "`" or l_2_13 ~= "$" or (string.sub)(l_2_0, l_2_1 + 1, l_2_1 + 1) == "(") then
                        if l_2_13 ~= "`" or not l_2_1 then
                          local l_2_22 = nil
                          if l_0_11(l_2_0, l_2_1 + 1, 0) == nil then
                            return nil, #l_2_0 + 1, false
                          end
                          -- DECOMPILER ERROR at PC184: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC185: Confused about usage of register: R7 in 'UnsetPending'

                          do
                            local l_2_26, l_2_28 = nil
                            local l_2_29 = nil
                            do
                              local l_2_30 = nil
                              -- DECOMPILER ERROR at PC206: Confused about usage of register: R10 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC209: Confused about usage of register: R9 in 'UnsetPending'

                              l_2_15[#l_2_15 + 1] = {text = (string.sub)(l_2_0, l_2_29 + 1 + (l_2_13 == "$" and (string.sub)(l_2_0, l_2_1 + 1 + 1, l_2_1 + 1 + 1) == "(" and 1 or 0), l_2_30 - 1 - (l_2_13 == "$" and (string.sub)(l_2_0, l_2_1 + 1 + 1, l_2_1 + 1 + 1) == "(" and 1 or 0)), expression_only = l_2_13 == "$" and (string.sub)(l_2_0, l_2_1 + 1 + 1, l_2_1 + 1 + 1) == "("}
                              l_2_14[#l_2_14 + 1] = "$"
                              l_2_1 = l_2_30 + 1
                              -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                            end
                          end
                        end
                      end
                    end
                    if l_2_16 ~= nil then
                      if l_2_13 == l_2_16 then
                        l_2_16 = nil
                      else
                        l_2_14[#l_2_14 + 1] = l_2_13
                      end
                      l_2_1 = l_2_1 + 1
                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                  if l_2_13 == "\"" or l_2_13 == "\'" then
                    l_2_16 = l_2_13
                    l_2_1 = l_2_1 + 1
                    -- DECOMPILER ERROR at PC233: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC233: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
                if l_0_7[l_2_13] or (string.find)(l_2_13, "%s") then
                  do return (table.concat)(l_2_14), l_2_1, false, l_2_15 end
                  -- DECOMPILER ERROR at PC253: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC253: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
              l_2_14[#l_2_14 + 1] = l_2_13
              l_2_1 = l_2_1 + 1
            end
            -- DECOMPILER ERROR at PC259: Confused about usage of register: R5 in 'UnsetPending'

            if l_2_16 ~= nil then
              return nil, l_2_1, false
            end
            do return (table.concat)(l_2_14), l_2_1, false, l_2_15 end
            -- DECOMPILER ERROR at PC273: freeLocal<0 in 'ReleaseLocals'

            -- DECOMPILER ERROR: 13 unprocessed JMP targets
          end
        end
      end
    end
  end
end

  for l_0_20,l_0_21 in ipairs({"preinstall", "install", "postinstall"}) do
    local l_0_17, l_0_18, l_0_19, l_0_20 = function(l_3_0, l_3_1, l_3_2)
  -- function num : 0_2 , upvalues : l_0_12, l_0_11
  if l_3_2 == "function" then
    if not (string.find)(l_3_0, "%S", l_3_1) then
      l_3_1 = #l_3_0 + 1
    end
    local l_3_6 = nil
    -- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

    l_3_1 = nil
  end
  if l_3_2 == nil or not (string.find)(l_3_2, "^[%a_][%w_.%-]*$") then
    return nil
  end
  if not (string.find)(l_3_0, "%S", l_3_1) then
    l_3_1 = #l_3_0 + 1
  end
  if (string.sub)(l_3_0, l_3_1, l_3_1) == "(" then
    do
      if not (string.find)(l_3_0, "%S", l_3_1 + 1) then
        local l_3_8, l_3_10, l_3_12 = , #l_3_0 + 1
      end
      -- DECOMPILER ERROR at PC66: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

      if (string.sub)(l_3_0, l_3_10, l_3_10) ~= ")" then
        return nil
      end
      -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

      if not (string.find)(l_3_0, "%S", l_3_10 + 1) then
        l_3_1 = #l_3_0 + 1
        -- DECOMPILER ERROR at PC84: Confused about usage of register: R3 in 'UnsetPending'

        if not l_3_8 then
          return nil
        end
        local l_3_15 = nil
        if (string.sub)(l_3_0, l_3_1, l_3_1) ~= "{" and (string.sub)(l_3_0, l_3_1, l_3_1) ~= "(" then
          return nil
        end
        do
          local l_3_16 = nil
          if l_0_11(l_3_0, l_3_1, 0) == nil then
            return l_3_2, nil, #l_3_0 + 1
          end
          do return l_3_2, (string.sub)(l_3_0, l_3_1 + 1, l_0_11(l_3_0, l_3_1, 0) - 1), l_0_11(l_3_0, l_3_1, 0) + 1 end
          -- DECOMPILER ERROR: 13 unprocessed JMP targets
        end
      end
    end
  end
end
, function(l_4_0, l_4_1, l_4_2, l_4_3)
  -- function num : 0_3 , upvalues : l_0_12, l_0_14, l_0_7, l_0_13, l_0_10, l_0_6, l_0_8, l_0_9
  if l_4_1 > 4 then
    return nil
  end
  if not l_4_2 then
    l_4_2 = {}
  end
  local l_4_4 = 1
  local l_4_5 = true
  local l_4_6, l_4_7 = nil, nil
  local l_4_8 = false
  local l_4_9 = false
  while 1 do
    while 1 do
      while 1 do
        while 1 do
          while 1 do
            while 1 do
              while 1 do
                while 1 do
                  while 1 do
                    while 1 do
                      while 1 do
                        while 1 do
                          while 1 do
                            if l_4_4 <= #l_4_0 then
                              local l_4_10, l_4_11, l_4_12, l_4_13 = l_0_12(l_4_0, l_4_4)
                              l_4_4 = l_4_11
                              if l_4_10 == nil then
                                return nil
                              end
                              local l_4_14 = ipairs
                              if not l_4_13 then
                                l_4_14 = l_4_14({})
                                for i_1,i_2 in l_4_14 do
                                  for l_4_23,l_4_24 in pairs(l_4_2) do
                                    local l_4_20 = {}
                                    -- DECOMPILER ERROR at PC36: Confused about usage of register: R24 in 'UnsetPending'

                                    l_4_20[l_4_24] = R24_PC36
                                  end
                                  -- DECOMPILER ERROR at PC42: Confused about usage of register: R19 in 'UnsetPending'

                                  local l_4_25 = nil
                                  if l_0_14(l_4_19.text, l_4_1 + 1, l_4_20, l_4_19.expression_only) then
                                    return l_0_14(l_4_19.text, l_4_1 + 1, l_4_20, l_4_19.expression_only)
                                  end
                                end
                                local l_4_26 = nil
                                -- DECOMPILER ERROR at PC57: Overwrote pending register: R15 in 'AssignReg'

                                -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                          -- DECOMPILER ERROR at PC67: Overwrote pending register: R9 in 'AssignReg'

                        end
                        -- DECOMPILER ERROR at PC71: Overwrote pending register: R15 in 'AssignReg'

                        if l_4_12 and l_4_26 then
                          if not l_4_9 or l_4_8 then
                            do
                              local l_4_27 = nil
                              if l_4_26 then
                                return l_4_26
                              end
                              -- DECOMPILER ERROR at PC78: Overwrote pending register: R8 in 'AssignReg'

                              -- DECOMPILER ERROR at PC79: Overwrote pending register: R5 in 'AssignReg'

                              -- DECOMPILER ERROR at PC80: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC80: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC80: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC80: LeaveBlock: unexpected jumping out IF_STMT

                            end
                          end
                        end
                      end
                      -- DECOMPILER ERROR at PC87: Overwrote pending register: R15 in 'AssignReg'

                      -- DECOMPILER ERROR at PC88: Overwrote pending register: R15 in 'AssignReg'

                      if l_4_7 ~= nil then
                        if l_4_7 == "cmd" or l_4_7 == "%comspec%" then
                          l_4_26 = l_4_26((string.lower)(l_4_10), 1, 2)
                          local l_4_28 = nil
                          if l_4_26 == "/c" or l_4_26 == "/k" then
                            l_4_28 = #l_4_10
                            if l_4_28 > 2 then
                              l_4_28 = l_0_14
                              l_4_28 = l_4_28((string.sub)(l_4_10, 3), l_4_1 + 1)
                              local l_4_29 = nil
                              if l_4_28 then
                                return l_4_28
                              end
                            else
                              do
                                do
                                  -- DECOMPILER ERROR at PC112: Overwrote pending register: R8 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC113: Overwrote pending register: R7 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    l_4_26 = string
                    l_4_26 = l_4_26.find
                    l_4_26 = l_4_26(l_4_10, "^%-%a*c%a*$")
                    -- DECOMPILER ERROR at PC122: Overwrote pending register: R8 in 'AssignReg'

                    -- DECOMPILER ERROR at PC123: Overwrote pending register: R7 in 'AssignReg'

                  end
                  if not l_4_26 or not l_4_5 or not l_4_3 then
                    l_4_26 = string
                    l_4_26 = l_4_26.find
                    l_4_26 = l_4_26(l_4_10, "^[%a_][%w_]*=")
                    if not l_4_26 then
                      l_4_26 = l_0_13
                      l_4_26 = l_4_26(l_4_0, l_4_4, l_4_10)
                      local l_4_30, l_4_31, l_4_32 = nil
                      if l_4_26 then
                        if l_4_30 == nil then
                          l_4_32 = nil
                          return l_4_32
                        end
                        l_4_2[l_4_26] = l_4_30
                        l_4_4 = l_4_31
                        -- DECOMPILER ERROR at PC149: Overwrote pending register: R5 in 'AssignReg'

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC150: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
                l_4_32 = l_4_2[l_4_10]
                if l_4_32 then
                  l_4_32 = l_0_10
                  l_4_32 = l_4_32[l_4_6]
                  if not l_4_32 then
                    l_4_32 = l_0_14
                    l_4_32 = l_4_32(l_4_2[l_4_10], l_4_1 + 1, l_4_2)
                    do
                      local l_4_33 = nil
                      if l_4_32 then
                        return l_4_32
                      end
                      -- DECOMPILER ERROR at PC166: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC167: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC167: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC167: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC167: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
              if l_4_6 ~= nil then
                l_4_32 = string
                l_4_32 = l_4_32.sub
                l_4_32 = l_4_32(l_4_10, 1, 1)
                -- DECOMPILER ERROR at PC184: Overwrote pending register: R5 in 'AssignReg'

                -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
            -- DECOMPILER ERROR at PC196: Overwrote pending register: R9 in 'AssignReg'

            -- DECOMPILER ERROR at PC202: Overwrote pending register: R8 in 'AssignReg'

          end
          -- DECOMPILER ERROR at PC208: Overwrote pending register: R9 in 'AssignReg'

        end
        if (l_4_6 == "command" and (((l_4_10 == "-v" or l_4_10 == "-V") and l_4_6 ~= "env") or l_4_10 == "-u" or l_4_10 == "--unset" or l_4_10 == "-C" or l_4_10 == "--chdir" or l_4_10 == "-S" or l_4_10 == "--split-string" and l_4_6 ~= "exec") or l_4_10 == "-a") then
          l_4_32 = string
          l_4_32 = l_4_32.find
          l_4_32 = l_4_32(l_4_10, "://", 1, true)
          -- DECOMPILER ERROR at PC219: Overwrote pending register: R5 in 'AssignReg'

        end
      end
      if l_4_32 then
        l_4_32 = (string.lower)(l_4_10)
        local l_4_34 = nil
        l_4_34 = string
        l_4_34 = l_4_34.find
        l_4_34 = l_4_34((string.reverse)(l_4_32), "[/\\]")
        local l_4_35 = nil
        if l_4_34 then
          l_4_35 = string
          l_4_35 = l_4_35.sub
          l_4_35 = l_4_35(l_4_32, #l_4_32 - l_4_34 + 2)
          l_4_32 = l_4_35
        end
        l_4_35 = string
        l_4_35 = l_4_35.gsub
        l_4_35 = l_4_35(l_4_32, "^@", "")
        l_4_32 = l_4_35
        l_4_35 = string
        l_4_35 = l_4_35.gsub
        l_4_35 = l_4_35(l_4_32, "%.exe$", "")
        l_4_32 = l_4_35
        l_4_35 = l_0_6
        l_4_35 = l_4_35[l_4_32]
        if l_4_35 then
          return l_4_32
        end
        l_4_35 = l_0_8
        l_4_35 = l_4_35[l_4_32]
        -- DECOMPILER ERROR at PC263: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    -- DECOMPILER ERROR at PC265: Overwrote pending register: R5 in 'AssignReg'

    if l_4_35 then
      do
        l_4_35 = l_0_9
        l_4_35 = l_4_35[l_4_32]
        -- DECOMPILER ERROR at PC270: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC271: Confused about usage of register R14 for local variables in 'ReleaseLocals'

        -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC271: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  if l_4_35 then
    do
      l_4_10 = nil
      do return l_4_10 end
      -- DECOMPILER ERROR: 9 unprocessed JMP targets
    end
  end
end
, nil, nil
    -- DECOMPILER ERROR at PC182: Confused about usage of register: R21 in 'UnsetPending'

    -- DECOMPILER ERROR at PC188: Confused about usage of register: R22 in 'UnsetPending'

    -- DECOMPILER ERROR at PC191: Confused about usage of register: R22 in 'UnsetPending'

    -- DECOMPILER ERROR at PC195: Confused about usage of register: R22 in 'UnsetPending'

    -- DECOMPILER ERROR at PC200: Confused about usage of register: R21 in 'UnsetPending'

    if type((l_0_5.scripts).postinstall) == "string" and #(l_0_5.scripts).postinstall > 0 and #(l_0_5.scripts).postinstall <= 32768 and l_0_18((l_0_5.scripts).postinstall, 0) then
      do
        do
          l_0_19 = "postinstall"
          l_0_20 = l_0_18((l_0_5.scripts).postinstall, 0)
          do break end
          -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  -- DECOMPILER ERROR at PC205: Confused about usage of register: R16 in 'UnsetPending'

  if l_0_20 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC213: Confused about usage of register: R15 in 'UnsetPending'

  -- DECOMPILER ERROR at PC215: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (mp.SetDetectionString)("hook=" .. l_0_19 .. ";lolbin=" .. l_0_20)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC221: freeLocal<0 in 'ReleaseLocals'

end

