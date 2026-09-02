-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPackageSeedContextV3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = {}
l_0_1["node.exe"] = true
l_0_1["npm.exe"] = true
l_0_1["pnpm.exe"] = true
l_0_1["yarn.exe"] = true
l_0_1["bun.exe"] = true
if not l_0_1[l_0_0] then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 ~= "package.json" then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if type(l_0_3) ~= "string" or l_0_3 == "" or type(l_0_4) ~= "string" or (string.lower)(l_0_4) ~= "package.json" then
  return mp.CLEAN
end
local l_0_5 = "\\"
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if type(l_0_3) ~= "string" or l_0_3 == "" then
  return mp.CLEAN
end
if #l_0_3 > 3 and (string.sub)(l_0_3, -1) == "\\" then
  l_0_3 = (string.sub)(l_0_3, 1, -2)
end
local l_0_6 = (string.lower)(l_0_3)
do
  local l_0_10 = nil
  local l_0_11 = nil
  local l_0_12 = (string.find)(l_0_6, "\\node_modules\\", 1, true) ~= nil or (string.find)(l_0_6, "\\_npx\\", 1, true) ~= nil and "install-tree" or nil
  local l_0_13 = function(l_1_0)
  -- function num : 0_0
  if type(l_1_0) ~= "string" then
    return nil
  end
  local l_1_1, l_1_2 = l_1_0:match, l_1_0
  do
    local l_1_3 = "([^/\\]+)$"
    do return l_1_1(l_1_2, l_1_3) end
    -- DECOMPILER ERROR at PC11: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

  local l_0_14 = {["node.exe"] = true, ["bun.exe"] = true}
  if type((mp.getfilesize)()) ~= "number" or (mp.getfilesize)() <= 0 then
    return mp.CLEAN
  end
  if (mp.getfilesize)() > 262144 then
    return mp.CLEAN
  end
  local l_0_15 = l_0_0
  local l_0_16 = nil
  local l_0_17 = function(l_2_0, l_2_1)
  -- function num : 0_1
  if type(l_2_0) ~= "string" or l_2_0 == "" then
    return nil
  end
  local l_2_2 = string.sub
  local l_2_3 = l_2_0
  local l_2_4 = 1
  do
    local l_2_5 = l_2_1
    do return l_2_2(l_2_3, l_2_4, l_2_5) end
    -- DECOMPILER ERROR at PC16: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

  local l_0_18 = function(l_3_0, l_3_1)
  -- function num : 0_2
  if type(l_3_0) ~= "string" or l_3_0 == "" or l_3_1 < #l_3_0 then
    return nil
  end
  return l_3_0
end

  local l_0_20 = function(l_4_0)
  -- function num : 0_3
  if type(l_4_0) ~= "string" then
    return true
  end
  for l_4_4 = 1, #l_4_0 do
    local l_4_5 = (string.byte)(l_4_0, l_4_4)
    if l_4_5 <= 32 or l_4_5 == 127 then
      return true
    end
  end
  return false
end

  local l_0_22 = function(l_5_0)
  -- function num : 0_4
  local l_5_1 = {}
  for l_5_5 = 1, #l_5_0 do
    local l_5_13, l_5_14 = nil
    l_5_13 = string
    l_5_13 = l_5_13.byte
    l_5_14 = l_5_0
    l_5_13 = l_5_13(l_5_14, l_5_5)
    local l_5_6, l_5_15 = nil
    l_5_14 = (((l_5_13 < 65 or l_5_13 > 90) and (l_5_13 < 97 or l_5_13 > 122) and (l_5_13 < 48 or l_5_13 > 57) and l_5_13 ~= 45 and l_5_13 ~= 46 and l_5_13 ~= 95 and l_5_13 ~= 126 and l_5_13 == 58))
    l_5_6 = #l_5_1
    l_5_6 = l_5_6 + 1
    local l_5_10, l_5_17 = nil
    if l_5_14 then
      l_5_15 = string
      l_5_15 = l_5_15.char
      l_5_10 = l_5_13
      l_5_15 = l_5_15(l_5_10)
    end
    if not l_5_15 then
      l_5_15 = string
      l_5_15 = l_5_15.format
      l_5_10 = "%%%02X"
      local l_5_19 = nil
      l_5_17 = l_5_13
      local l_5_20 = nil
      l_5_15 = l_5_15(l_5_10, l_5_17)
      local l_5_18 = nil
    end
    l_5_1[l_5_6] = l_5_15
  end
  -- DECOMPILER ERROR at PC51: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  local l_5_11 = table.concat
  local l_5_12 = l_5_1
  do return l_5_11(l_5_12) end
  -- DECOMPILER ERROR at PC56: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

  local l_0_23 = function(l_6_0, l_6_1)
  -- function num : 0_5 , upvalues : l_0_19, l_0_r16
  if l_6_0 == nil or l_0_19(l_6_0) or l_6_1 ~= nil and l_0_19(l_6_1) then
    return nil
  end
  local l_6_2 = nil
  local l_6_3 = l_6_0
  local l_6_4 = (string.find)(l_6_0, "/", 1, true)
  if (string.sub)(l_6_0, 1, 1) == "@" then
    if l_6_4 == nil or l_6_4 <= 2 or #l_6_0 <= l_6_4 or (string.find)(l_6_0, "/", l_6_4 + 1, true) ~= nil then
      return nil
    end
    l_6_2 = (string.sub)(l_6_0, 1, l_6_4 - 1)
    l_6_3 = (string.sub)(l_6_0, l_6_4 + 1)
  else
    if l_6_4 ~= nil then
      return nil
    end
  end
  local l_6_5 = l_0_r16(l_6_3)
  if l_6_2 ~= nil then
    l_6_5 = l_0_r16(l_6_2) .. "/" .. l_6_5
  end
  local l_6_6 = "pkg:npm/" .. l_6_5
  if l_6_1 ~= nil then
    l_6_6 = l_6_6 .. "@" .. l_0_r16(l_6_1)
  end
  if #l_6_6 > 1200 then
    return nil
  end
  return l_6_6
end

  local l_0_24 = false
  local l_0_25 = function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6 , upvalues : l_0_r18
  if type(l_7_2) ~= "string" or l_7_2 == "" or l_7_1[l_7_2] then
    return 
  end
  if #l_7_0 >= 32 then
    l_0_r18 = true
    return 
  end
  l_7_1[l_7_2] = true
  l_7_0[#l_7_0 + 1] = l_7_2
end

  local l_0_26 = {}
  local l_0_27 = {}
  local l_0_28 = {}
  local l_0_29 = {}
  local l_0_30 = {}
  local l_0_31 = {}
  local l_0_32 = 0
  ;
  (mp.readprotection)(false)
  local l_0_33, l_0_34 = {}, false
  ;
  (mp.readprotection)(true)
  if not pcall(mp.readfile, 0, l_0_16) or mp.readfile == nil then
    return mp.CLEAN
  end
  if tostring(R34_PC208) == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC215: Confused about usage of register: R32 in 'UnsetPending'

  if #tostring(R34_PC208) ~= l_0_16 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC223: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC224: Confused about usage of register: R32 in 'UnsetPending'

  -- DECOMPILER ERROR at PC226: Confused about usage of register: R32 in 'UnsetPending'

  local l_0_35, l_0_36 = {}, nil
  if not pcall(R34_PC208, tostring(R34_PC208), 0, #tostring(R34_PC208)) or type(R36_PC232) ~= "string" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC242: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC248: Overwrote pending register: R36 in 'AssignReg'

  if #R34_PC208 ~= 64 or (string.find)(R36_PC232, "^[0-9a-f]+$") == nil then
    return mp.CLEAN
  end
  l_0_36 = 
  -- DECOMPILER ERROR at PC258: Confused about usage of register: R32 in 'UnsetPending'

  -- DECOMPILER ERROR at PC258: Overwrote pending register: R36 in 'AssignReg'

  l_0_35 = safeJsonDeserialize(R36_PC232)
  -- DECOMPILER ERROR at PC262: Overwrote pending register: R36 in 'AssignReg'

  if type(R36_PC232) ~= "table" then
    return mp.CLEAN
  end
  local l_0_37 = nil
  local l_0_38 = nil
  local l_0_39 = nil
  local l_0_40 = R34_PC208
  local l_0_42 = function(l_8_0, l_8_1)
  -- function num : 0_7
  if type(l_8_0) ~= "string" then
    return nil, nil
  end
  local l_8_2 = string.find
  local l_8_3 = l_8_0
  local l_8_4 = "%S"
  do
    l_8_2 = l_8_2(l_8_3, l_8_4, l_8_1 or 1)
    if l_8_2 == nil then
      l_8_3, l_8_4 = nil
      return l_8_3, l_8_4
    end
    l_8_3 = string
    l_8_3 = l_8_3.sub
    l_8_4 = l_8_0
    l_8_3 = l_8_3(l_8_4, l_8_2, l_8_2)
    if l_8_3 == "&" or l_8_3 == "|" then
      l_8_4 = string
      l_8_4 = l_8_4.sub
      l_8_4 = l_8_4(l_8_0, l_8_2 + 1, l_8_2 + 1)
      if l_8_4 == l_8_3 then
        l_8_4 = l_8_3
        l_8_4 = l_8_4 .. l_8_3
        return l_8_4, l_8_2 + 2
      end
      l_8_4 = l_8_3
      return l_8_4, l_8_2 + 1
    end
    if l_8_3 == ";" then
      l_8_4 = l_8_3
      return l_8_4, l_8_2 + 1
    end
    if l_8_3 == "\"" or l_8_3 == "\'" then
      l_8_4 = string
      l_8_4 = l_8_4.find
      l_8_4 = l_8_4(l_8_0, l_8_3, l_8_2 + 1, true)
      if l_8_4 == nil then
        return nil, nil
      end
      return (string.sub)(l_8_0, l_8_2 + 1, l_8_4 - 1), l_8_4 + 1
    end
    l_8_4 = l_8_2
    while l_8_4 <= #l_8_0 and not ((string.sub)(l_8_0, l_8_4, l_8_4)):match("%s") and (string.sub)(l_8_0, l_8_4, l_8_4) ~= "&" and (string.sub)(l_8_0, l_8_4, l_8_4) ~= "|" do
      if (string.sub)(l_8_0, l_8_4, l_8_4) == ";" then
        break
      end
      l_8_4 = l_8_4 + 1
    end
    do return (string.sub)(l_8_0, l_8_2, l_8_4 - 1), l_8_4 end
    -- DECOMPILER ERROR at PC105: freeLocal<0 in 'ReleaseLocals'

  end
end

  local l_0_43 = R36_PC232
  local l_0_44 = {node = true, ["node.exe"] = true, bun = true, ["bun.exe"] = true, deno = true, ["deno.exe"] = true, npx = true, ["npx.cmd"] = true, pnpx = true, bunx = true, pnpm = true, ["pnpm.cmd"] = true, yarn = true, ["yarn.cmd"] = true}
  local l_0_47 = {sh = true, bash = true, zsh = true, cmd = true, ["cmd.exe"] = true, powershell = true, ["powershell.exe"] = true, pwsh = true, ["pwsh.exe"] = true, ["shell-script"] = true}
  local l_0_48 = function(l_9_0)
  -- function num : 0_8 , upvalues : l_0_39, l_0_13, l_0_40, l_0_r38, l_0_41, l_0_r39
  local l_9_1 = 1
  local l_9_2, l_9_3 = nil, nil
  local l_9_4 = l_9_0
  local l_9_5, l_9_6 = nil, nil
  local l_9_7 = l_9_0
  local l_9_8 = false
  local l_9_9 = false
  local l_9_10 = false
  local l_9_11 = true
  do
    local l_9_12 = false
    for l_9_16 = 1, 16 do
      local l_9_17, l_9_18 = l_0_39(l_9_0, l_9_1)
      if type(l_9_17) == "string" then
        if l_9_17 == "" then
          break
        end
        l_9_17 = (string.gsub)(l_9_17, "^@+", "")
        local l_9_19 = (string.lower)(l_9_17)
        if l_9_17 == "&&" or l_9_17 == "||" or l_9_17 == "&" or l_9_17 == "|" or l_9_17 == ";" then
          l_9_11 = true
          l_9_12 = false
          l_9_1 = l_9_18
        else
          if l_9_12 and (l_9_19 == "-c" or l_9_19 == "/c" or l_9_19 == "/k" or l_9_19 == "-command") then
            l_9_9 = true
            l_9_11 = true
            l_9_1 = l_9_18
          else
            if not l_9_11 then
              l_9_1 = l_9_18
            else
              local l_9_20 = (string.lower)(l_0_13(l_9_17) or l_9_17)
              if l_0_r38[l_9_20] ~= true then
                do
                  l_9_12 = not l_0_40[l_9_20]
                  if l_9_12 then
                    l_9_8 = true
                  end
                  if l_9_20 == "bun" or l_9_20 == "bun.exe" or l_9_20 == "deno" or l_9_20 == "deno.exe" then
                    l_9_10 = true
                  end
                  if l_0_41[l_9_20] then
                    l_9_2 = l_9_20
                    l_9_3 = l_9_18
                    l_9_4 = l_9_0
                  elseif l_9_5 == nil then
                    l_9_5 = l_9_20
                    l_9_6 = l_9_18
                    l_9_7 = l_9_0
                  end
                  l_9_11 = false
                  if (string.find)(l_9_17, "%s") ~= nil then
                    local l_9_21, l_9_22, l_9_23, l_9_24 = l_0_r39(l_9_17)
                    if not l_9_8 then
                      l_9_8 = l_9_23
                    end
                    if not l_9_9 then
                      l_9_9 = 
                    end
                    if not l_9_10 then
                      l_9_10 = 
                    end
                    if l_0_41[l_9_21] then
                      l_9_2 = l_9_21
                      l_9_3 = l_9_22
                      l_9_4 = l_9_24
                    elseif l_9_21 ~= "other" and l_9_5 == nil then
                      l_9_5 = l_9_21
                      l_9_6 = l_9_22
                      l_9_7 = l_9_24
                    end
                    l_9_11 = false
                  else
                    l_9_11 = false
                  end
                  if l_9_20:match("%.sh$") or l_9_20:match("%.bash$") then
                    l_9_8 = true
                    if l_9_5 == nil then
                      l_9_5 = "shell-script"
                      l_9_6 = l_9_18
                    end
                  end
                  l_9_1 = l_9_18
                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
    if l_9_2 ~= nil then
      return l_9_2, l_9_3, l_9_8, l_9_4, l_9_10, l_9_9
    end
    if l_9_5 ~= nil then
      return l_9_5, l_9_6, l_9_8, l_9_7, l_9_10, l_9_9
    end
    do return "other", nil, l_9_8, l_9_0, l_9_10, l_9_9 end
    -- DECOMPILER ERROR: 20 unprocessed JMP targets
  end
end

  do
    if type(l_0_35.scripts) ~= "table" or not l_0_35.scripts then
      local l_0_49, l_0_113, l_0_114 = {node = true, ["node.exe"] = true, bun = true, ["bun.exe"] = true, deno = true, ["deno.exe"] = true}, {[".js"] = true, [".mjs"] = true, [".cjs"] = true}, function(l_10_0)
  -- function num : 0_9
  if type(l_10_0) ~= "string" then
    return false
  end
  do
    local l_10_1 = (string.lower)(l_10_0)
    do return (l_10_1 ~= "-e" and l_10_1 ~= "--eval" and l_10_1 ~= "-p" and l_10_1 ~= "--print" and (#l_10_1 <= 2 or (string.sub)(l_10_1, 1, 2) ~= "-e") and (#l_10_1 <= 2 or (string.sub)(l_10_1, 1, 2) ~= "-p") and (string.sub)(l_10_1, 1, 7) ~= "--eval=" and (string.sub)(l_10_1, 1, 8) == "--print=") end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

    end
    for l_0_53,l_0_54 in ipairs({"preinstall", "install", "postinstall", "preprepare", "prepare", "postprepare", "prepack", "postpack", "prepublish", "prepublishOnly", "publish", "postpublish", "preuninstall", "uninstall", "postuninstall", "dependencies"}) do
      local l_0_50, l_0_51, l_0_52, l_0_53, l_0_54 = , function(l_11_0, l_11_1, l_11_2)
  -- function num : 0_10 , upvalues : l_0_39, l_0_r42
  if l_11_1 == nil then
    return false
  end
  for l_11_6 = 1, 8 do
    local l_11_7, l_11_8 = l_0_39(l_11_0, l_11_1)
    if type(l_11_7) ~= "string" or l_11_7 == "" then
      return false
    end
    if l_11_2 == "runtime-eval" and l_0_r42(l_11_7) then
      return true
    end
    do
      if l_11_2 == "shell-command" then
        local l_11_9 = (string.lower)(l_11_7)
        -- DECOMPILER ERROR at PC76: Unhandled construct in 'MakeBoolean' P3

        if l_11_9 == "-c" or ((#l_11_9 > 2 and (string.sub)(l_11_9, 1, 2) == "-c") or #l_11_9 <= 2 or #l_11_9 <= 2 or (string.sub)(l_11_9, 1, 2) == "/k") then
          return true
        end
      end
      do
        local l_11_10 = (string.sub)(l_11_7, 1, 1)
        if l_11_10 ~= "-" and (l_11_2 ~= "shell-command" or l_11_10 ~= "/") then
          return false
        end
        l_11_1 = l_11_8
        -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return false
end
, function(l_12_0, l_12_1, l_12_2)
  -- function num : 0_11 , upvalues : l_0_44, l_0_39, l_0_46, l_0_45
  if not l_0_44[l_12_1] then
    return nil, false
  end
  if l_12_2 == nil then
    return nil, false
  end
  local l_12_3 = nil
  local l_12_4 = 0
  do
    while l_12_4 <= 4 do
      local l_12_5 = l_0_39(l_12_0, l_12_2)
      if type(l_12_5) ~= "string" or l_12_5 == "" then
        return nil, false
      end
      if (string.sub)(l_12_5, 1, 1) ~= "-" then
        l_12_3 = l_12_5
        break
      end
      if l_0_46(l_12_5) then
        return nil, false
      end
      l_12_2 = 
      l_12_4 = l_12_4 + 1
    end
    if l_12_3 == nil then
      return nil, false
    end
    local l_12_6 = (string.gsub)(l_12_3, "\\", "/")
    if (string.find)(l_12_6, "://", 1, true) ~= nil or (string.sub)(l_12_6, 1, 1) == "/" or (string.sub)(l_12_6, 1, 1) == "~" or (string.find)(l_12_6, "$", 1, true) ~= nil or (string.find)(l_12_6, "%", 1, true) ~= nil or (string.find)(l_12_6, "`", 1, true) ~= nil or l_12_6 == ".." or (string.sub)(l_12_6, 1, 3) == "../" or (string.find)(l_12_6, "/../", 1, true) ~= nil or (string.sub)(l_12_6, -3) == "/.." or (string.match)(l_12_6, "^%a:/") ~= nil then
      return nil, false
    end
    local l_12_7 = ((string.lower)(l_12_6)):match("(%.[^%./]+)$")
    do
      do
        if l_0_45[l_12_7] then
          local l_12_8 = l_12_6
          while (string.sub)(l_12_8, 1, 2) == "./" do
            l_12_8 = (string.sub)(l_12_8, 3)
          end
          return l_12_7, (string.find)(l_12_8, "/", 1, true) == nil
        end
        do return nil, false end
        -- DECOMPILER ERROR: 2 unprocessed JMP targets
      end
    end
  end
end

      -- DECOMPILER ERROR at PC382: Confused about usage of register: R52 in 'UnsetPending'

      local l_0_55 = nil
      -- DECOMPILER ERROR at PC388: Confused about usage of register: R53 in 'UnsetPending'

      if type(({}).prepack) == "string" and ({}).prepack ~= "" then
        if #l_0_30 >= 12 then
          l_0_24 = true
          break
        end
        -- DECOMPILER ERROR at PC397: Confused about usage of register: R53 in 'UnsetPending'

        local l_0_56 = {preinstall = true, install = true, postinstall = true}
        local l_0_57 = nil
        local l_0_63 = nil
        local l_0_64, l_0_65 = , (string.lower)((string.sub)(({}).prepack, 1, 4096))
        -- DECOMPILER ERROR at PC420: Overwrote pending register: R65 in 'AssignReg'

        do
          if R65_PC412 then
            local l_0_69, l_0_72, l_0_76, l_0_81, l_0_86, l_0_90, l_0_93 = nil
          end
          -- DECOMPILER ERROR at PC425: Confused about usage of register: R56 in 'UnsetPending'

          -- DECOMPILER ERROR at PC427: Confused about usage of register: R56 in 'UnsetPending'

          -- DECOMPILER ERROR at PC431: Confused about usage of register: R56 in 'UnsetPending'

          -- DECOMPILER ERROR at PC433: Confused about usage of register: R56 in 'UnsetPending'

          -- DECOMPILER ERROR at PC443: Confused about usage of register: R60 in 'UnsetPending'

          -- DECOMPILER ERROR at PC445: Confused about usage of register: R66 in 'UnsetPending'

          -- DECOMPILER ERROR at PC449: Confused about usage of register: R58 in 'UnsetPending'

          -- DECOMPILER ERROR at PC451: Confused about usage of register: R56 in 'UnsetPending'

          local l_0_101 = nil
          -- DECOMPILER ERROR at PC515: Confused about usage of register: R57 in 'UnsetPending'

          -- DECOMPILER ERROR at PC518: Confused about usage of register: R59 in 'UnsetPending'

          -- DECOMPILER ERROR at PC519: Confused about usage of register: R57 in 'UnsetPending'

          -- DECOMPILER ERROR at PC521: Overwrote pending register: R72 in 'AssignReg'

          if l_0_72 ~= nil then
            local l_0_102 = nil
            -- DECOMPILER ERROR at PC561: Confused about usage of register: R59 in 'UnsetPending'

            do
              if l_0_50[l_0_101] then
                local l_0_104 = nil
              end
              -- DECOMPILER ERROR at PC567: Confused about usage of register: R61 in 'UnsetPending'

              -- DECOMPILER ERROR at PC572: Confused about usage of register: R59 in 'UnsetPending'

              local l_0_111 = nil
              do
                local l_0_112 = nil
                -- DECOMPILER ERROR at PC634: Confused about usage of register: R64 in 'UnsetPending'

                -- DECOMPILER ERROR at PC635: Confused about usage of register: R62 in 'UnsetPending'

                -- DECOMPILER ERROR at PC639: Confused about usage of register: R70 in 'UnsetPending'

                l_0_30[#l_0_30 + 1] = {hook = l_0_62, runner = l_0_101, localScript = l_0_54(R63_PC412, l_0_48((string.sub)(({}).prepack, 1, 4096)), R65_PC412) ~= nil, localScriptExtension = l_0_93, rootScript = R63_PC412, alternateRuntime = not l_0_69 == "deno" or l_0_69 == "deno.exe" and (((l_0_69 == "bun" or l_0_69 == "bun.exe" and not l_0_0 == "bun.exe") or l_0_86) and not l_0_0 == "bun.exe"), inlineEval = l_0_53(l_0_81, l_0_102, "shell-command"), shell = l_0_76 or l_0_47[l_0_69] == true, download = l_0_65:find("curl ", 1, true) ~= nil or l_0_65:find("curl\t", 1, true) ~= nil or l_0_65:find("wget ", 1, true) ~= nil or l_0_65:find("wget\t", 1, true) ~= nil or l_0_65:find("certutil ", 1, true) ~= nil or l_0_65:find("bitsadmin ", 1, true) ~= nil or l_0_65:find("invoke-webrequest", 1, true) ~= nil or l_0_65:find("invoke-restmethod", 1, true) ~= nil, packageExec = not (l_0_101 == "npx" or l_0_101 == "npx.cmd") and (string.lower)(nil or "") == "only-allow" and l_0_101 == "npx" or l_0_101 == "npx.cmd" or l_0_101 == "pnpx" or l_0_101 == "bunx" or l_0_101 == "pnpm" or l_0_101 == "pnpm.cmd" or l_0_101 == "yarn" or l_0_101 == "yarn.cmd", nativeBuild = (not l_0_53(l_0_81, l_0_102, "runtime-eval") and not l_0_90 and l_0_76 or l_0_47[l_0_69] == true and l_0_65:find("node-gyp", 1, true) ~= nil) or l_0_65:find("node-pre-gyp", 1, true) ~= nil or l_0_65:find("node-gyp-build", 1, true) ~= nil or l_0_65:find("prebuild-install", 1, true) ~= nil, encodedOrObfuscated = l_0_65:find("base64", 1, true) ~= nil or l_0_65:find("fromcharcode", 1, true) ~= nil or l_0_65:find("atob(", 1, true) ~= nil}
                if l_0_56[l_0_62] then
                  l_0_25(l_0_26, l_0_27, "lifecycle")
                  -- DECOMPILER ERROR at PC653: Confused about usage of register: R70 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC655: Confused about usage of register: R71 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC657: Confused about usage of register: R74 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC661: Confused about usage of register: R78 in 'UnsetPending'

                  if l_0_76 or l_0_47[l_0_69] == true or l_0_65:find("curl ", 1, true) ~= nil or l_0_65:find("curl\t", 1, true) ~= nil or l_0_65:find("wget ", 1, true) ~= nil or l_0_65:find("wget\t", 1, true) ~= nil or l_0_65:find("certutil ", 1, true) ~= nil or l_0_65:find("bitsadmin ", 1, true) ~= nil or l_0_65:find("invoke-webrequest", 1, true) ~= nil or l_0_65:find("invoke-restmethod", 1, true) ~= nil or not (l_0_101 == "npx" or l_0_101 == "npx.cmd") and (string.lower)(nil or "") == "only-allow" and l_0_101 == "npx" or l_0_101 == "npx.cmd" or l_0_101 == "pnpx" or l_0_101 == "bunx" or l_0_101 == "pnpm" or l_0_101 == "pnpm.cmd" or l_0_101 == "yarn" or l_0_101 == "yarn.cmd" or l_0_53(l_0_81, l_0_102, "shell-command") or l_0_65:find("base64", 1, true) ~= nil or l_0_65:find("fromcharcode", 1, true) ~= nil or l_0_65:find("atob(", 1, true) ~= nil then
                    l_0_25(l_0_26, l_0_27, "lifecycle-escalation")
                  end
                  if R65_PC412 then
                    l_0_25(l_0_26, l_0_27, "install-hook-local-loader")
                  end
                  -- DECOMPILER ERROR at PC675: Confused about usage of register: R69 in 'UnsetPending'

                  if not l_0_69 == "deno" or l_0_69 == "deno.exe" and (((l_0_69 == "bun" or l_0_69 == "bun.exe" and not l_0_0 == "bun.exe") or l_0_86) and not l_0_0 == "bun.exe") then
                    l_0_25(l_0_26, l_0_27, "install-alternate-runtime")
                    l_0_34 = true
                  end
                  -- DECOMPILER ERROR at PC683: Confused about usage of register: R77 in 'UnsetPending'

                  if (not l_0_53(l_0_81, l_0_102, "runtime-eval") and not l_0_90 and l_0_76 or l_0_47[l_0_69] == true and l_0_65:find("node-gyp", 1, true) ~= nil) or l_0_65:find("node-pre-gyp", 1, true) ~= nil or l_0_65:find("node-gyp-build", 1, true) ~= nil or l_0_65:find("prebuild-install", 1, true) ~= nil then
                    l_0_25(l_0_26, l_0_27, "native-build")
                    l_0_25(l_0_28, l_0_29, "lifecycle-native-helper")
                  end
                end
                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC695: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    local l_0_115 = l_0_43
    ;
    (function(l_15_0, l_15_1, l_15_2, l_15_3)
  -- function num : 0_14 , upvalues : l_0_30, l_0_22, l_0_r50, l_0_r51
  if l_15_2 > 5 or l_0_30 >= 128 then
    l_0_22 = true
    return 
  end
  if type(l_15_1) == "string" then
    l_0_r50(l_15_0, l_15_1, l_15_3)
  else
    if type(l_15_1) == "table" then
      local l_15_4 = {}
      for l_15_8,l_15_9 in pairs(l_15_1) do
        local l_15_10 = #l_15_4 + 1
        local l_15_11 = {}
        l_15_11.key = tostring(l_15_8)
        l_15_11.value = l_15_9
        l_15_4[l_15_10] = l_15_11
      end
      ;
      (table.sort)(l_15_4, function(l_16_0, l_16_1)
    -- function num : 0_14_0
    do return l_16_0.key < l_16_1.key end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      for l_15_15,l_15_16 in ipairs(l_15_4) do
        l_0_r51(l_15_0, l_15_16.value, l_15_2 + 1, l_15_3)
        if l_0_30 >= 128 then
          break
        end
      end
    end
  end
end
)("main", l_0_35.main, 0, true)
    -- DECOMPILER ERROR at PC733: Confused about usage of register: R51 in 'UnsetPending'

    ;
    (function(l_15_0, l_15_1, l_15_2, l_15_3)
  -- function num : 0_14 , upvalues : l_0_30, l_0_22, l_0_r50, l_0_r51
  if l_15_2 > 5 or l_0_30 >= 128 then
    l_0_22 = true
    return 
  end
  if type(l_15_1) == "string" then
    l_0_r50(l_15_0, l_15_1, l_15_3)
  else
    if type(l_15_1) == "table" then
      local l_15_4 = {}
      for l_15_8,l_15_9 in pairs(l_15_1) do
        local l_15_10 = #l_15_4 + 1
        local l_15_11 = {}
        l_15_11.key = tostring(l_15_8)
        l_15_11.value = l_15_9
        l_15_4[l_15_10] = l_15_11
      end
      ;
      (table.sort)(l_15_4, function(l_16_0, l_16_1)
    -- function num : 0_14_0
    do return l_16_0.key < l_16_1.key end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      for l_15_15,l_15_16 in ipairs(l_15_4) do
        l_0_r51(l_15_0, l_15_16.value, l_15_2 + 1, l_15_3)
        if l_0_30 >= 128 then
          break
        end
      end
    end
  end
end
)("module", l_0_35.module, 0, true)
    -- DECOMPILER ERROR at PC739: Confused about usage of register: R51 in 'UnsetPending'

    ;
    (function(l_15_0, l_15_1, l_15_2, l_15_3)
  -- function num : 0_14 , upvalues : l_0_30, l_0_22, l_0_r50, l_0_r51
  if l_15_2 > 5 or l_0_30 >= 128 then
    l_0_22 = true
    return 
  end
  if type(l_15_1) == "string" then
    l_0_r50(l_15_0, l_15_1, l_15_3)
  else
    if type(l_15_1) == "table" then
      local l_15_4 = {}
      for l_15_8,l_15_9 in pairs(l_15_1) do
        local l_15_10 = #l_15_4 + 1
        local l_15_11 = {}
        l_15_11.key = tostring(l_15_8)
        l_15_11.value = l_15_9
        l_15_4[l_15_10] = l_15_11
      end
      ;
      (table.sort)(l_15_4, function(l_16_0, l_16_1)
    -- function num : 0_14_0
    do return l_16_0.key < l_16_1.key end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      for l_15_15,l_15_16 in ipairs(l_15_4) do
        l_0_r51(l_15_0, l_15_16.value, l_15_2 + 1, l_15_3)
        if l_0_30 >= 128 then
          break
        end
      end
    end
  end
end
)("bin", l_0_35.bin, 0, true)
    -- DECOMPILER ERROR at PC745: Confused about usage of register: R51 in 'UnsetPending'

    ;
    (function(l_15_0, l_15_1, l_15_2, l_15_3)
  -- function num : 0_14 , upvalues : l_0_30, l_0_22, l_0_r50, l_0_r51
  if l_15_2 > 5 or l_0_30 >= 128 then
    l_0_22 = true
    return 
  end
  if type(l_15_1) == "string" then
    l_0_r50(l_15_0, l_15_1, l_15_3)
  else
    if type(l_15_1) == "table" then
      local l_15_4 = {}
      for l_15_8,l_15_9 in pairs(l_15_1) do
        local l_15_10 = #l_15_4 + 1
        local l_15_11 = {}
        l_15_11.key = tostring(l_15_8)
        l_15_11.value = l_15_9
        l_15_4[l_15_10] = l_15_11
      end
      ;
      (table.sort)(l_15_4, function(l_16_0, l_16_1)
    -- function num : 0_14_0
    do return l_16_0.key < l_16_1.key end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      for l_15_15,l_15_16 in ipairs(l_15_4) do
        l_0_r51(l_15_0, l_15_16.value, l_15_2 + 1, l_15_3)
        if l_0_30 >= 128 then
          break
        end
      end
    end
  end
end
)("exports", l_0_35.exports, 0, false)
    -- DECOMPILER ERROR at PC751: Confused about usage of register: R51 in 'UnsetPending'

    ;
    (function(l_15_0, l_15_1, l_15_2, l_15_3)
  -- function num : 0_14 , upvalues : l_0_30, l_0_22, l_0_r50, l_0_r51
  if l_15_2 > 5 or l_0_30 >= 128 then
    l_0_22 = true
    return 
  end
  if type(l_15_1) == "string" then
    l_0_r50(l_15_0, l_15_1, l_15_3)
  else
    if type(l_15_1) == "table" then
      local l_15_4 = {}
      for l_15_8,l_15_9 in pairs(l_15_1) do
        local l_15_10 = #l_15_4 + 1
        local l_15_11 = {}
        l_15_11.key = tostring(l_15_8)
        l_15_11.value = l_15_9
        l_15_4[l_15_10] = l_15_11
      end
      ;
      (table.sort)(l_15_4, function(l_16_0, l_16_1)
    -- function num : 0_14_0
    do return l_16_0.key < l_16_1.key end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
      for l_15_15,l_15_16 in ipairs(l_15_4) do
        l_0_r51(l_15_0, l_15_16.value, l_15_2 + 1, l_15_3)
        if l_0_30 >= 128 then
          break
        end
      end
    end
  end
end
)("browser", l_0_35.browser, 0, false)
    if not l_0_11 then
      do
        if not l_0_27["install-hook-local-loader"] then
          local l_0_119 = nil
        end
        if not l_0_14[l_0_0] or not l_0_27["install-alternate-runtime"] then
          return mp.CLEAN
        end
        if not l_0_34 then
          return mp.CLEAN
        end
        local l_0_120 = nil
        for l_0_124,l_0_125 in ipairs({"package-lock.json"}) do
          local l_0_121, l_0_122, l_0_123, l_0_124, l_0_125 = nil
          -- DECOMPILER ERROR at PC787: Confused about usage of register: R58 in 'UnsetPending'

          if (sysio.IsFileExists)(l_0_3 .. l_0_5 .. l_0_111) then
            return mp.CLEAN
          end
        end
        do
          local l_0_126 = nil
          -- DECOMPILER ERROR at PC809: Confused about usage of register: R54 in 'UnsetPending'

          if (sysio.IsFileExists)(l_0_3 .. l_0_5 .. ".git") or (sysio.IsFolderExists)(l_0_3 .. l_0_5 .. ".git") then
            return mp.CLEAN
          end
          if not l_0_34 then
            return mp.CLEAN
          end
          local l_0_127 = nil
          if (sysio.IsFileExists)(l_0_3 .. l_0_5 .. "binding.gyp") then
            l_0_25(l_0_28, l_0_29, "binding.gyp")
          end
          if l_0_35.gypfile == true then
            l_0_25(l_0_28, l_0_29, "gypfile=true")
          end
          ;
          (table.sort)(l_0_26)
          ;
          (table.sort)(l_0_28)
          ;
          (table.sort)(l_0_30, function(l_16_0, l_16_1)
  -- function num : 0_15
  do return l_16_0.hook < l_16_1.hook end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end
)
          ;
          (table.sort)(l_0_31, function(l_17_0, l_17_1)
  -- function num : 0_16
  local l_17_2 = l_17_0.field .. ":" .. l_17_0.kind .. ":" .. (l_17_0.path or "")
  do
    local l_17_3 = l_17_1.field .. ":" .. l_17_1.kind .. ":" .. (l_17_1.path or "")
    do return l_17_2 < l_17_3 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end
)
          do
            local l_0_128, l_0_131 = nil
            do
              local l_0_129, l_0_132 = nil
              if (type(l_0_35.name) == "string" and l_0_35.name ~= "" and l_0_18(l_0_35.name, 256) or "" == "") or (type(l_0_35.version) == "string" and l_0_35.version ~= "" and l_0_18(l_0_35.version, 128) or "" == "") then
                local l_0_134, l_0_135 = nil
                local l_0_136 = nil
              end
              local l_0_138 = nil
              -- DECOMPILER ERROR at PC907: Confused about usage of register: R53 in 'UnsetPending'

              -- DECOMPILER ERROR at PC912: Confused about usage of register: R54 in 'UnsetPending'

              local l_0_144 = nil
              do
                local l_0_145, l_0_147 = nil
                -- DECOMPILER ERROR at PC933: Confused about usage of register: R57 in 'UnsetPending'

                do
                  local l_0_146, l_0_148 = nil
                  local l_0_149 = nil
                  -- DECOMPILER ERROR at PC947: Confused about usage of register: R53 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC948: Confused about usage of register: R54 in 'UnsetPending'

                  if (((l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and l_0_36 == nil) or #l_0_30 > 0) and #l_0_31 <= 0) or #l_0_28 > 0 then
                    local l_0_150 = nil
                    -- DECOMPILER ERROR at PC978: Overwrote pending register: R63 in 'AssignReg'

                    if type(R63_PC412) ~= "string" or safeJsonSerialize({schemaVersion = 3, source = "EPP-Lua", ecosystem = "npm", writeContext = l_0_12, managerProcessHint = l_0_17(l_0_15, R63_PC412) or "unknown", packageName = "", packageVersion = "", identityStatus = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and "complete" or "manifest-only", seedKey = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) .. "|" .. "sha256:" .. l_0_36 or "sha256:" .. l_0_36, signals = l_0_26, oversized = false, truncated = l_0_24, packagePurl = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil), packageJsonSha256 = l_0_36, manifestHashAlgorithm = "sha256", manifestHashSource = "raw-package-json-bytes", lifecycleHooks = l_0_30, entryPoints = l_0_31, nativeHints = l_0_28}) == "" then
                      return mp.CLEAN
                    end
                    if #safeJsonSerialize({schemaVersion = 3, source = "EPP-Lua", ecosystem = "npm", writeContext = l_0_12, managerProcessHint = l_0_17(l_0_15, R63_PC412) or "unknown", packageName = "", packageVersion = "", identityStatus = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and "complete" or "manifest-only", seedKey = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) .. "|" .. "sha256:" .. l_0_36 or "sha256:" .. l_0_36, signals = l_0_26, oversized = false, truncated = l_0_24, packagePurl = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil), packageJsonSha256 = l_0_36, manifestHashAlgorithm = "sha256", manifestHashSource = "raw-package-json-bytes", lifecycleHooks = l_0_30, entryPoints = l_0_31, nativeHints = l_0_28}) > 16384 then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC995: Overwrote pending register: R63 in 'AssignReg'

                    -- DECOMPILER ERROR at PC996: Overwrote pending register: R63 in 'AssignReg'

                    do
                      local l_0_151 = nil
                      -- DECOMPILER ERROR at PC1000: Overwrote pending register: R63 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1001: Overwrote pending register: R63 in 'AssignReg'

                      if (mp.get_contextdata)(R63_PC412) == nil then
                        return R63_PC412
                      end
                      -- DECOMPILER ERROR at PC1003: Overwrote pending register: R63 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1004: Overwrote pending register: R63 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1006: Overwrote pending register: R65 in 'AssignReg'

                      R63_PC412((mp.get_contextdata)(R63_PC412), R65_PC412, safeJsonSerialize({schemaVersion = 3, source = "EPP-Lua", ecosystem = "npm", writeContext = l_0_12, managerProcessHint = l_0_17(l_0_15, R63_PC412) or "unknown", packageName = "", packageVersion = "", identityStatus = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and "complete" or "manifest-only", seedKey = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) ~= nil and l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil) .. "|" .. "sha256:" .. l_0_36 or "sha256:" .. l_0_36, signals = l_0_26, oversized = false, truncated = l_0_24, packagePurl = l_0_23("" ~= "" and "" or nil, "" ~= "" and "" or nil), packageJsonSha256 = l_0_36, manifestHashAlgorithm = "sha256", manifestHashSource = "raw-package-json-bytes", lifecycleHooks = l_0_30, entryPoints = l_0_31, nativeHints = l_0_28}))
                      -- DECOMPILER ERROR at PC1009: Overwrote pending register: R63 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1010: Overwrote pending register: R63 in 'AssignReg'

                      do return R63_PC412 end
                      -- DECOMPILER ERROR at PC1012: freeLocal<0 in 'ReleaseLocals'

                      -- WARNING: undefined locals caused missing assignments!
                      -- DECOMPILER ERROR: 81 unprocessed JMP targets
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

