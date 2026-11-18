-- Threat: !InfrastructureShared
-- Name: !#Lua:PackageSeedContext.V3
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnCloseNewlyCreatedHintRtpScan & RPF:TopLevelFile

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if type(r0_0) == "string" and r0_0 ~= "" then
  r0_0 = string.lower(r0_0)
  local r0_1 = {
    ["node.exe"] = true, ["npm.exe"] = true, ["pnpm.exe"] = true, ["yarn.exe"] = true,
    ["bun.exe"] = true
  }
  if r0_1[r0_0] then
    local r0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    if r0_2 == "package.json" then
      local r0_3, r0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
      if type(r0_3) == "string"
        and r0_3 ~= ""
        and type(r0_4) == "string"
        and string.lower(r0_4) == "package.json" then
        local r0_5 = "\\"
        r0_3 = MpCommon.PathToWin32Path(r0_3)
        if type(r0_3) == "string" and r0_3 ~= "" then
          if #r0_3 > 3 and string.sub(r0_3, -1) == "\\" then
            r0_3 = string.sub(r0_3, 1, -2)
          end
          local r0_6 = string.lower(r0_3)
          local r0_7 = string.find(r0_6, "\\node_modules\\", 1, true)
          r0_7 = r0_7 ~= nil or string.find(r0_6, "\\_npx\\", 1, true) ~= nil
          local r0_8 = r0_7 and "install-tree" or nil

          local function r0_9(p1_0)
            if type(p1_0) == "string" then
              return p1_0:match("([^/\\]+)$")
            end
            return nil
          end

          local r0_10 = { ["node.exe"] = true, ["bun.exe"] = true }
          local r0_11 = r0_0
          local r0_12 = mp.getfilesize()
          if type(r0_12) == "number" and not (r0_12 <= 0) then
            if r0_12 > 262144 then
              return mp.CLEAN
            end

            local function r0_13(p2_0, p2_1)
              if type(p2_0) == "string" and p2_0 ~= "" then
                return string.sub(p2_0, 1, p2_1)
              end
              return nil
            end

            local function r0_14(p3_0, p3_1)
              if type(p3_0) == "string" and p3_0 ~= "" and not (#p3_0 > p3_1) then
                return p3_0
              end
              return nil
            end

            local function r0_15(p4_0)
              if type(p4_0) == "string" then
                for r4_0 = 1, #p4_0 do
                  local r4_1 = string.byte(p4_0, r4_0)
                  if r4_1 <= 32 or r4_1 == 127 then
                    return true
                  end
                end
                return false
              end
              return true
            end

            local function r0_16(p5_0)
              local r5_0 = {}
              for r5_1 = 1, #p5_0 do
                local r5_2 = string.byte(p5_0, r5_1)
                local r5_3 = r5_2 >= 65 and r5_2 <= 90
                  or r5_2 >= 97 and r5_2 <= 122
                  or r5_2 >= 48 and r5_2 <= 57
                  or r5_2 == 45
                  or r5_2 == 46
                  or r5_2 == 95
                  or r5_2 == 126
                  or r5_2 == 58
                r5_0[#r5_0 + 1] = r5_3 and string.char(r5_2) or string.format("%%%02X", r5_2)
              end
              return table.concat(r5_0)
            end

            local function r0_17(p6_0, p6_1)
              if p6_0 ~= nil and not r0_15(p6_0) and (p6_1 == nil or not r0_15(p6_1)) then
                local r6_0 = nil
                local r6_1 = p6_0
                local r6_2 = string.find(p6_0, "/", 1, true)
                if string.sub(p6_0, 1, 1) == "@" then
                  if r6_2 == nil
                    or r6_2 <= 2
                    or #p6_0 <= r6_2
                    or string.find(p6_0, "/", r6_2 + 1, true) ~= nil then
                    return nil
                  end
                  r6_0 = string.sub(p6_0, 1, r6_2 - 1)
                  r6_1 = string.sub(p6_0, r6_2 + 1)
                elseif r6_2 ~= nil then
                  return nil
                end
                local r6_3 = r0_16(r6_1)
                if r6_0 ~= nil then
                  r6_3 = r0_16(r6_0) .. "/" .. r6_3
                end
                local r6_4 = "pkg:npm/" .. r6_3
                if p6_1 ~= nil then
                  r6_4 = r6_4 .. "@" .. r0_16(p6_1)
                end
                if #r6_4 > 1200 then
                  return nil
                end
                return r6_4
              end
              return nil
            end

            local r0_18 = false

            local function r0_19(p7_0, p7_1, p7_2)
              if not (type(p7_2) == "string" and p7_2 ~= "" and not p7_1[p7_2]) then
                return
              end
              if #p7_0 >= 32 then
                r0_18 = true
                return
              end
              p7_1[p7_2] = true
              p7_0[#p7_0 + 1] = p7_2
            end

            local r0_20 = {}
            local r0_21 = {}
            local r0_22 = {}
            local r0_23 = {}
            local r0_24 = {}
            local r0_25 = {}
            local r0_26 = 0
            local r0_27 = {}
            local r0_28 = false
            local r0_29 = {}
            local r0_30 = nil
            mp.readprotection(false)
            local r0_31, r0_32 = pcall(mp.readfile, 0, r0_12)
            mp.readprotection(true)
            if r0_31 and r0_32 ~= nil then
              local r0_33 = tostring(r0_32)
              r0_32 = r0_33
              if r0_32 == "" then
                return mp.CLEAN
              end
              if #r0_32 == r0_12 then
                local r0_34, r0_35 = pcall(crypto.Sha256Buffer, r0_32, 0, #r0_32)
                if r0_34 and type(r0_35) == "string" then
                  local r0_36 = string.lower(r0_35)
                  r0_35 = r0_36
                  if #r0_35 == 64 and string.find(r0_35, "^[0-9a-f]+$") ~= nil then
                    r0_30 = r0_35
                    r0_36 = safeJsonDeserialize(r0_32)
                    local r0_37 = r0_36
                    if type(r0_37) == "table" then
                      function r0_36(p8_0, p8_1)
                        if type(p8_0) == "string" then
                          local r8_0 = string.find(p8_0, "%S", p8_1 or 1)
                          if r8_0 == nil then
                            return nil, nil
                          end
                          local r8_1 = string.sub(p8_0, r8_0, r8_0)
                          if r8_1 ~= "&" and r8_1 ~= "|" then
                            if r8_1 == ";" then
                              return r8_1, r8_0 + 1
                            end
                            if r8_1 ~= '"' and r8_1 ~= "'" then
                              local r8_2 = r8_0
                              while #p8_0 >= r8_2 do
                                local r8_3 = string.sub(p8_0, r8_2, r8_2)
                                if r8_3:match("%s") or r8_3 == "&" or r8_3 == "|" then
                                  break
                                end
                                if r8_3 == ";" then
                                  break
                                end
                                r8_2 = r8_2 + 1
                              end
                              return string.sub(p8_0, r8_0, r8_2 - 1), r8_2
                            end
                            local r8_4 = string.find(p8_0, r8_1, r8_0 + 1, true)
                            if r8_4 == nil then
                              return nil, nil
                            end
                            return string.sub(p8_0, r8_0 + 1, r8_4 - 1), r8_4 + 1
                          end
                          if string.sub(p8_0, r8_0 + 1, r8_0 + 1) == r8_1 then
                            return r8_1 .. r8_1, r8_0 + 2
                          end
                          return r8_1, r8_0 + 1
                        end
                        return nil, nil
                      end

                      local r0_38 = {
                        node = true, ["node.exe"] = true, bun = true, ["bun.exe"] = true,
                        deno = true, ["deno.exe"] = true, npx = true, ["npx.cmd"] = true,
                        pnpx = true, bunx = true, pnpm = true, ["pnpm.cmd"] = true, yarn = true,
                        ["yarn.cmd"] = true, sh = true, bash = true, zsh = true, cmd = true,
                        ["cmd.exe"] = true, powershell = true, ["powershell.exe"] = true,
                        pwsh = true, ["pwsh.exe"] = true
                      }
                      local r0_39 = {
                        node = true, ["node.exe"] = true, bun = true, ["bun.exe"] = true,
                        deno = true, ["deno.exe"] = true, npx = true, ["npx.cmd"] = true,
                        pnpx = true, bunx = true, pnpm = true, ["pnpm.cmd"] = true, yarn = true,
                        ["yarn.cmd"] = true
                      }
                      local r0_40 = {
                        sh = true, bash = true, zsh = true, cmd = true, ["cmd.exe"] = true,
                        powershell = true, ["powershell.exe"] = true, pwsh = true,
                        ["pwsh.exe"] = true, ["shell-script"] = true
                      }

                      local function r0_41(p9_0)
                        local r9_0, r9_1
                        local r9_2 = 1
                        local r9_3, r9_4 = nil, nil
                        local r9_5 = p9_0
                        local r9_6, r9_7 = nil, nil
                        local r9_8, r9_9 = p9_0, false
                        local r9_10, r9_11 = false, false
                        r9_0, r9_1 = false, true
                        for r9_12 = 1, 16 do
                          local r9_13, r9_14 = r0_36(p9_0, r9_2)
                          if type(r9_13) ~= "string" then
                            break
                          end
                          if r9_13 == "" then
                            break
                          end
                          r9_13 = string.gsub(r9_13, "^@+", "")
                          local r9_15 = string.lower(r9_13)
                          if r9_13 == "&&"
                            or r9_13 == "||"
                            or r9_13 == "&"
                            or r9_13 == "|"
                            or r9_13 == ";" then
                            r9_1 = true
                            r9_11 = false
                          elseif r9_11
                            and (r9_15 == "-c"
                              or r9_15 == "/c"
                              or r9_15 == "/k"
                              or r9_15 == "-command") then
                            r9_0 = true
                            r9_1 = true
                          elseif r9_1 then
                            local r9_16 = string.lower(r0_9(r9_13) or r9_13)
                            if r0_38[r9_16] then
                              r9_11 = r0_40[r9_16] == true
                              r9_9 = r9_11 and true or r9_9
                              r9_10 = r9_16 == "bun"
                                or r9_16 == "bun.exe"
                                or r9_16 == "deno"
                                or r9_16 == "deno.exe"
                                or r9_10
                              if r0_39[r9_16] then
                                r9_3, r9_4, r9_5 = r9_16, r9_14, p9_0
                              elseif r9_6 == nil then
                                r9_6, r9_7, r9_8 = r9_16, r9_14, p9_0
                              end
                              r9_1 = false
                            elseif string.find(r9_13, "%s") == nil then
                              r9_1 = false
                            else
                              local r9_17, r9_18, r9_19, r9_20, r9_21, r9_22 = r0_41(r9_13)
                              r9_9 = r9_9 or r9_19
                              r9_0 = r9_0 or r9_22
                              r9_10 = r9_10 or r9_21
                              if r0_39[r9_17] then
                                r9_3, r9_4, r9_5 = r9_17, r9_18, r9_20
                              elseif r9_17 ~= "other" and r9_6 == nil then
                                r9_6, r9_7, r9_8 = r9_17, r9_18, r9_20
                              end
                              r9_1 = false
                            end
                            if r9_16:match("%.sh$") or r9_16:match("%.bash$") then
                              r9_9 = true
                              if r9_6 == nil then
                                r9_6, r9_7 = "shell-script", r9_14
                              end
                            end
                          end
                          r9_2 = r9_14
                        end
                        if r9_3 == nil then
                          if r9_6 == nil then
                            return "other", nil, r9_9, p9_0, r9_10, r9_0
                          end
                          return r9_6, r9_7, r9_9, r9_8, r9_10, r9_0
                        end
                        return r9_3, r9_4, r9_9, r9_5, r9_10, r9_0
                      end

                      local r0_42 = {
                        node = true, ["node.exe"] = true, bun = true, ["bun.exe"] = true,
                        deno = true, ["deno.exe"] = true
                      }
                      local r0_43 = { [".js"] = true, [".mjs"] = true, [".cjs"] = true }

                      local function r0_44(p10_0)
                        if type(p10_0) == "string" then
                          local r10_0 = string.lower(p10_0)
                          return r10_0 == "-e"
                            or r10_0 == "--eval"
                            or r10_0 == "-p"
                            or r10_0 == "--print"
                            or #r10_0 > 2 and string.sub(r10_0, 1, 2) == "-e"
                            or #r10_0 > 2 and string.sub(r10_0, 1, 2) == "-p"
                            or string.sub(r10_0, 1, 7) == "--eval="
                            or string.sub(r10_0, 1, 8) == "--print="
                        end
                        return false
                      end

                      local function r0_45(p11_0, p11_1, p11_2)
                        if p11_1 == nil then
                          return false
                        end
                        for r11_0 = 1, 8 do
                          local r11_1, r11_2 = r0_36(p11_0, p11_1)
                          if type(r11_1) ~= "string" or r11_1 == "" then
                            return false
                          end
                          if p11_2 == "runtime-eval" and r0_44(r11_1) then
                            return true
                          end
                          if p11_2 == "shell-command" then
                            local r11_3 = string.lower(r11_1)
                            if r11_3 == "-c"
                              or r11_3 == "/c"
                              or r11_3 == "/k"
                              or #r11_3 > 2 and string.sub(r11_3, 1, 2) == "-c"
                              or #r11_3 > 2 and string.sub(r11_3, 1, 2) == "/c"
                              or #r11_3 > 2 and string.sub(r11_3, 1, 2) == "/k" then
                              return true
                            end
                          end
                          local r11_4 = string.sub(r11_1, 1, 1)
                          if r11_4 ~= "-" and (p11_2 ~= "shell-command" or r11_4 ~= "/") then
                            return false
                          end
                          p11_1 = r11_2
                        end
                        return false
                      end

                      local function r0_46(p12_0, p12_1, p12_2)
                        if r0_42[p12_1] then
                          if p12_2 == nil then
                            return nil, false
                          end
                          local r12_0, r12_1 = nil, 0
                          while r12_1 <= 4 do
                            local r12_2, r12_3 = r0_36(p12_0, p12_2)
                            if type(r12_2) ~= "string" or r12_2 == "" then
                              return nil, false
                            end
                            if string.sub(r12_2, 1, 1) ~= "-" then
                              r12_0 = r12_2
                              break
                            end
                            if r0_44(r12_2) then
                              return nil, false
                            end
                            p12_2 = r12_3
                            r12_1 = r12_1 + 1
                          end
                          if r12_0 == nil then
                            return nil, false
                          end
                          local r12_4 = string.gsub(r12_0, "\\", "/")
                          if string.find(r12_4, "://", 1, true) == nil
                            and string.sub(r12_4, 1, 1) ~= "/"
                            and string.sub(r12_4, 1, 1) ~= "~"
                            and string.find(r12_4, "$", 1, true) == nil
                            and string.find(r12_4, "%", 1, true) == nil
                            and string.find(r12_4, "`", 1, true) == nil
                            and r12_4 ~= ".."
                            and string.sub(r12_4, 1, 3) ~= "../"
                            and string.find(r12_4, "/../", 1, true) == nil
                            and string.sub(r12_4, -3) ~= "/.."
                            and string.match(r12_4, "^%a:/") == nil then
                            local r12_5 = string.lower(r12_4)
                            r12_5 = r12_5:match("(%.[^%./]+)$")
                            if r0_43[r12_5] then
                              local r12_6 = r12_4
                              while string.sub(r12_6, 1, 2) == "./" do
                                r12_6 = string.sub(r12_6, 3)
                              end
                              local r12_7 = string.find(r12_6, "/", 1, true) == nil
                              return r12_5, r12_7
                            end
                            return nil, false
                          end
                          return nil, false
                        end
                        return nil, false
                      end

                      local r0_47 = {
                        "preinstall", "install", "postinstall", "preprepare", "prepare",
                        "postprepare", "prepack", "postpack", "prepublish", "prepublishOnly",
                        "publish", "postpublish", "preuninstall", "uninstall", "postuninstall",
                        "dependencies"
                      }
                      local r0_48 = { preinstall = true, install = true, postinstall = true }
                      local r0_49 = type(r0_37.scripts)
                      r0_49 = r0_49 == "table" and r0_37.scripts or {}
                      local r0_50, r0_51, r0_52 = ipairs(r0_47)
                      for r0_53, r0_54 in r0_50, r0_51, r0_52 do
                        local r0_55 = r0_49[r0_54]
                        if type(r0_55) == "string" and r0_55 ~= "" then
                          if #r0_24 >= 12 then
                            r0_18 = true
                            break
                          end
                          local r0_56 = string.sub(r0_55, 1, 4096)
                          local r0_57 = string.lower(r0_56)
                          local r0_58, r0_59, r0_60, r0_61, r0_62, r0_63 = r0_41(r0_56)
                          local r0_64, r0_65 = r0_46(r0_61, r0_58, r0_59)
                          local r0_66 = r0_64 ~= nil
                          local r0_67 = r0_48[r0_54] and r0_66
                          local r0_68 = r0_0 == "bun.exe"
                          local r0_69 = r0_58 == "bun" or r0_58 == "bun.exe"
                          local r0_70 = r0_58 == "deno" or r0_58 == "deno.exe"
                          local r0_71 = r0_70 or r0_69 and not r0_68 or r0_62 and not r0_68
                          local r0_72 = r0_60 or r0_40[r0_58] == true
                          local r0_73 = r0_57:find("curl ", 1, true)
                          r0_73 = r0_73 ~= nil
                            or r0_57:find("curl\t", 1, true) ~= nil
                            or r0_57:find("wget ", 1, true) ~= nil
                            or r0_57:find("wget\t", 1, true) ~= nil
                            or r0_57:find("certutil ", 1, true) ~= nil
                            or r0_57:find("bitsadmin ", 1, true) ~= nil
                            or r0_57:find("invoke-webrequest", 1, true) ~= nil
                            or r0_57:find("invoke-restmethod", 1, true) ~= nil
                          local r0_74
                          if r0_59 == nil then
                            r0_74 = nil
                          else
                            r0_74 = r0_36(r0_61, r0_59)
                          end
                          local r0_75 = string.lower
                          local r0_76 = r0_74 or ""
                          r0_74 = r0_75(r0_76)
                          local r0_77 = (r0_58 ~= "npx" and r0_58 ~= "npx.cmd"
                            or r0_74 ~= "only-allow")
                            and (r0_58 == "npx"
                              or r0_58 == "npx.cmd"
                              or r0_58 == "pnpx"
                              or r0_58 == "bunx"
                              or r0_58 == "pnpm"
                              or r0_58 == "pnpm.cmd"
                              or r0_58 == "yarn"
                              or r0_58 == "yarn.cmd")
                          local r0_78 = r0_42[r0_58] and r0_45(r0_61, r0_59, "runtime-eval")
                          local r0_79 = r0_78
                            or r0_63
                            or r0_72 and r0_45(r0_61, r0_59, "shell-command")
                          local r0_80 = r0_57:find("node-gyp", 1, true)
                          r0_80 = r0_80 ~= nil
                            or r0_57:find("node-pre-gyp", 1, true) ~= nil
                            or r0_57:find("node-gyp-build", 1, true) ~= nil
                            or r0_57:find("prebuild-install", 1, true) ~= nil
                          local r0_81 = r0_57:find("base64", 1, true)
                          r0_81 = r0_81 ~= nil
                            or r0_57:find("fromcharcode", 1, true) ~= nil
                            or r0_57:find("atob(", 1, true) ~= nil
                          local r0_82 = #r0_24
                          r0_24[r0_82 + 1] = {
                            hook = r0_54, runner = r0_58, localScript = r0_66,
                            localScriptExtension = r0_64, rootScript = r0_65,
                            alternateRuntime = r0_71, inlineEval = r0_79, shell = r0_72,
                            download = r0_73, packageExec = r0_77, nativeBuild = r0_80,
                            encodedOrObfuscated = r0_81
                          }
                          if r0_48[r0_54] then
                            r0_19(r0_20, r0_21, "lifecycle")
                            if r0_72 or r0_73 or r0_77 or r0_79 or r0_81 then
                              local r0_83 = r0_19
                              r0_83(r0_20, r0_21, "lifecycle-escalation")
                            end
                            if r0_67 then
                              local r0_84 = r0_19
                              r0_84(r0_20, r0_21, "install-hook-local-loader")
                            end
                            if r0_71 then
                              local r0_85 = r0_19
                              r0_85(r0_20, r0_21, "install-alternate-runtime")
                              r0_28 = true
                            end
                            if r0_80 then
                              local r0_86 = r0_19
                              r0_86(r0_20, r0_21, "native-build")
                              r0_86 = r0_19
                              r0_86(r0_22, r0_23, "lifecycle-native-helper")
                            end
                          end
                        end
                      end
                      local r0_87 = {
                        [".exe"] = true, [".dll"] = true, [".scr"] = true, [".bat"] = true,
                        [".cmd"] = true, [".ps1"] = true, [".vbs"] = true, [".so"] = true,
                        [".dylib"] = true, [".jar"] = true
                      }

                      local function r0_88(p13_0)
                        local r13_0 = MpCommon.PathToWin32Path(p13_0)
                        if type(r13_0) == "string" and r13_0 ~= "" then
                          r13_0 = string.lower(string.gsub(r13_0, "/", "\\"))
                          if #r13_0 > 3 and string.sub(r13_0, -1) == "\\" then
                            r13_0 = string.sub(r13_0, 1, -2)
                          end
                          local r13_1 = r13_0 == r0_6
                            or string.sub(r13_0, 1, #r0_6 + 1) == r0_6 .. "\\"
                          return r13_1
                        end
                        return false
                      end

                      local function r0_89(p14_0, p14_1, p14_2)
                        if not (type(p14_1) == "string" and p14_1 ~= "") then
                          return
                        end
                        if r0_26 >= 128 then
                          r0_18 = true
                          return
                        end
                        r0_26 = r0_26 + 1
                        local r14_0 = "relative"
                        local r14_1 = p14_1:find("://", 1, true)
                        r14_0 = r14_1 and "url"
                          or p14_1 == ".." and "parent-traversal"
                          or p14_1:sub(1, 3) == "../" and "parent-traversal"
                          or p14_1:sub(1, 3) == "..\\" and "parent-traversal"
                          or p14_1:find("/../", 1, true) and "parent-traversal"
                          or p14_1:find("\\..\\", 1, true) and "parent-traversal"
                          or p14_1:sub(-3) == "/.." and "parent-traversal"
                          or p14_1:sub(-3) == "\\.." and "parent-traversal"
                          or p14_1:sub(1, 1) == "/" and "absolute"
                          or p14_1:sub(1, 1) == "\\" and "absolute"
                          or p14_1:match("^%a:[/\\]") and "absolute"
                          or r14_0
                        if p14_2 and r14_0 == "url" then
                          r0_19(r0_20, r0_21, "entrypoint-url")
                          r0_28 = true
                        elseif p14_2 and r14_0 == "absolute" then
                          r0_19(r0_20, r0_21, "entrypoint-absolute")
                          if not r0_88(p14_1) then
                            r0_28 = true
                          end
                        elseif p14_2 and r14_0 == "parent-traversal" then
                          r0_19(r0_20, r0_21, "entrypoint-parent-traversal")
                        end
                        if p14_2 then
                          r14_1 = string.lower(p14_1):match("(%.[^%.\\/]+)$")
                        else
                          r14_1 = nil
                        end
                        if r14_1 ~= nil and r0_87[r14_1] then
                          if p14_0 == "bin" and r14_0 == "relative" then
                            r0_19(r0_20, r0_21, "bin-relative-executable")
                          else
                            r0_19(r0_20, r0_21, "entrypoint-suspicious-extension")
                            r0_28 = true
                          end
                        end
                        local r14_2 = nil
                        if r14_0 == "relative" then
                          r14_2 = r0_13(p14_1, 256)
                          if #p14_1 > 256 then
                            r0_18 = true
                          end
                        end
                        local r14_3 = p14_0 .. "\000" .. r14_0 .. "\000" .. (r14_2 or "")
                        if r0_27[r14_3] then
                          return
                        end
                        r0_27[r14_3] = true
                        if #r0_25 >= 12 then
                          r0_18 = true
                          return
                        end
                        r0_25[#r0_25 + 1] = { field = p14_0, kind = r14_0, path = r14_2 }
                      end

                      local function r0_90(p15_0, p15_1, p15_2, p15_3)
                        if not (p15_2 > 5) and not (r0_26 >= 128) then
                          if type(p15_1) == "string" then
                            r0_89(p15_0, p15_1, p15_3)
                          elseif type(p15_1) == "table" then
                            local r15_0 = {}
                            for r15_1, r15_2 in pairs(p15_1) do
                              r15_0[#r15_0 + 1] = { key = tostring(r15_1), value = r15_2 }
                            end
                            table.sort(r15_0,
                              function(p16_0, p16_1)
                                return p16_0.key < p16_1.key
                              end)
                            for r15_3, r15_4 in ipairs(r15_0) do
                              r0_90(p15_0, r15_4.value, p15_2 + 1, p15_3)
                              if r0_26 >= 128 then
                                break
                              end
                            end
                          end
                          return
                        end
                        r0_18 = true
                      end

                      r0_90("main", r0_37.main, 0, true)
                      local r0_91 = r0_90
                      r0_91("module", r0_37.module, 0, true)
                      r0_91 = r0_90
                      r0_91("bin", r0_37.bin, 0, true)
                      r0_91 = r0_90
                      r0_91("exports", r0_37.exports, 0, false)
                      r0_91 = r0_90
                      r0_91("browser", r0_37.browser, 0, false)
                      if not r0_7 then
                        local r0_92 = r0_21["install-hook-local-loader"]
                          or r0_21["install-alternate-runtime"]
                        if not (r0_10[r0_0] and r0_92) then
                          return mp.CLEAN
                        end
                        if not r0_28 then
                          return mp.CLEAN
                        end
                        local r0_93 = { "package-lock.json" }
                        local r0_94, r0_95, r0_96 = ipairs(r0_93)
                        for r0_97, r0_98 in r0_94, r0_95, r0_96 do
                          local r0_99 = sysio.IsFileExists
                          local r0_100 = r0_3
                          r0_100 = r0_100 .. r0_5 .. r0_98
                          if r0_99(r0_100) then
                            return mp.CLEAN
                          end
                        end
                        local r0_101 = r0_3 .. r0_5 .. ".git"
                        if sysio.IsFileExists(r0_101) or sysio.IsFolderExists(r0_101) then
                          return mp.CLEAN
                        end
                        r0_8 = "staging"
                      end
                      if r0_28 then
                        local r0_102, r0_103 = r0_3, r0_5
                        r0_102 = r0_102 .. r0_103 .. "binding.gyp"
                        r0_103 = sysio
                        if r0_103.IsFileExists(r0_102) then
                          r0_19(r0_22, r0_23, "binding.gyp")
                        end
                        if r0_37.gypfile == true then
                          r0_19(r0_22, r0_23, "gypfile=true")
                        end
                        table.sort(r0_20)
                        table.sort(r0_22)
                        table.sort(r0_24,
                          function(p17_0, p17_1)
                            return p17_0.hook < p17_1.hook
                          end)
                        table.sort(r0_25,
                          function(p18_0, p18_1)
                            local r18_0 = p18_0.field .. ":" .. p18_0.kind .. ":"
                              .. (p18_0.path or "")
                            local r18_1 = p18_1.field .. ":" .. p18_1.kind .. ":"
                              .. (p18_1.path or "")
                            return r18_0 < r18_1
                          end)
                        r0_103 = r0_14
                        r0_103 = r0_103(r0_37.name, 256) or ""
                        local r0_104 = r0_14
                        r0_104 = r0_104(r0_37.version, 128) or ""
                        local r0_105 = type(r0_37.name)
                        r0_105 = r0_105 == "string" and r0_37.name ~= "" and r0_103 == ""
                          or type(r0_37.version) == "string"
                            and r0_37.version ~= ""
                            and r0_104 == ""
                        if r0_105 then
                          r0_18 = true
                          r0_103, r0_104 = "", ""
                        end
                        local r0_106 = r0_17
                        local r0_107
                        if r0_103 == "" then
                          r0_107 = nil
                        else
                          r0_107 = r0_103 or nil
                        end
                        local r0_108
                        if r0_104 == "" then
                          r0_108 = nil
                        else
                          r0_108 = r0_104 or nil
                        end
                        r0_106 = r0_106(r0_107, r0_108)
                        r0_107 = "sha256:"
                        r0_108 = r0_30
                        local r0_109 = r0_107 .. r0_108
                        r0_108 = r0_106 == nil and "manifest-only" or "complete"
                        local r0_110
                        if r0_106 == nil then
                          r0_110 = r0_109
                        else
                          r0_110 = r0_106 .. "|" .. r0_109 or r0_109
                        end
                        local r0_111 = {}
                        r0_111.schemaVersion = 3
                        r0_111.source = "EPP-Lua"
                        r0_111.ecosystem = "npm"
                        r0_111.writeContext = r0_8
                        local r0_112 = r0_13
                        r0_112 = r0_112(r0_11, 64) or "unknown"
                        r0_111.managerProcessHint = r0_112
                        r0_111.packageName = r0_103
                        r0_111.packageVersion = r0_104
                        r0_111.identityStatus = r0_108
                        r0_111.seedKey = r0_110
                        r0_111.signals = r0_20
                        r0_111.oversized = false
                        r0_111.truncated = r0_18
                        if r0_106 ~= nil then
                          r0_111.packagePurl = r0_106
                        end
                        if r0_30 ~= nil then
                          r0_111.packageJsonSha256 = r0_30
                          r0_111.manifestHashAlgorithm = "sha256"
                          r0_111.manifestHashSource = "raw-package-json-bytes"
                        end
                        if #r0_24 > 0 then
                          r0_111.lifecycleHooks = r0_24
                        end
                        if #r0_25 > 0 then
                          r0_111.entryPoints = r0_25
                        end
                        if #r0_22 > 0 then
                          r0_111.nativeHints = r0_22
                        end
                        local r0_113 = safeJsonSerialize(r0_111)
                        if type(r0_113) == "string" and r0_113 ~= "" then
                          if #r0_113 > 16384 then
                            return mp.CLEAN
                          end
                          local r0_114 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
                          if r0_114 == nil then
                            return mp.CLEAN
                          end
                          MpCommon.BmTriggerSig(r0_114, "PackageSeedContextV3", r0_113)
                          return mp.CLEAN
                        end
                        return mp.CLEAN
                      end
                      return mp.CLEAN
                    end
                    return mp.CLEAN
                  end
                  return mp.CLEAN
                end
                return mp.CLEAN
              end
              return mp.CLEAN
            end
            return mp.CLEAN
          end
          return mp.CLEAN
        end
        return mp.CLEAN
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
