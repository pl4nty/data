-- Threat: !InfrastructureShared
-- Name: !#Lua:NpmInstallHookScan.A
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & AGGR:NpmJsonHookLua

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  return p1_0 == " "
    or p1_0 == "\t"
    or p1_0 == "\n"
    or p1_0 == "\r"
    or p1_0 == "\011"
    or p1_0 == "\012"
end

local function r0_1(p2_0)
  if #p2_0 == 4 then
    for r2_0 = 1, 4 do
      local r2_1 = p2_0:byte(r2_0)
      if (not (r2_1 >= 48) or not (r2_1 <= 57))
        and (not (r2_1 >= 65) or not (r2_1 <= 70))
        and (not (r2_1 >= 97) or not (r2_1 <= 102)) then
        return false
      end
    end
    return true
  end
  return false
end

local function r0_2(p3_0)
  local r3_0 = {}
  local r3_1 = {}
  local r3_2 = 1
  local r3_3 = #p3_0
  local r3_4, r3_5 = false, nil
  while r3_2 <= r3_3 do
    local r3_6 = p3_0:sub(r3_2, r3_2)
    if r3_4 then
      if r3_6 == "\\" and r3_2 < r3_3 then
        local r3_7 = p3_0:sub(r3_2 + 1, r3_2 + 1)
        if r3_7 == r3_5 or r3_7 == "\\" then
          r3_1[#r3_1 + 1] = r3_7
          r3_2 = r3_2 + 2
        else
          r3_1[#r3_1 + 1] = r3_6
          r3_2 = r3_2 + 1
        end
      elseif r3_6 == r3_5 then
        r3_4 = false
        r3_5 = nil
        r3_2 = r3_2 + 1
      else
        r3_1[#r3_1 + 1] = r3_6
        r3_2 = r3_2 + 1
      end
    elseif r3_6 == '"' or r3_6 == "'" then
      r3_4 = true
      r3_5 = r3_6
      r3_2 = r3_2 + 1
    elseif r0_0(r3_6) then
      if #r3_1 > 0 then
        r3_0[#r3_0 + 1] = table.concat(r3_1)
        r3_1 = {}
      end
      r3_2 = r3_2 + 1
    else
      r3_1[#r3_1 + 1] = r3_6
      r3_2 = r3_2 + 1
    end
  end
  if #r3_1 > 0 then
    r3_0[#r3_0 + 1] = table.concat(r3_1)
  end
  return r3_0
end

local r0_3, r0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if r0_3 ~= nil and r0_4 ~= nil then
  local r0_5 = string.lower(r0_3)
  local r0_6 = string.lower(r0_4)
  local r0_7 = r0_3
  if r0_6 == "package.json" then
    local r0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    if type(r0_8) == "string" and r0_8 ~= "" then
      r0_8 = string.lower(r0_8)
      local r0_9 = versioning.GetHostOsType
      local r0_10 = r0_9() == 1
      local r0_11
      repeat
        if r0_10 then
          local r0_12 = { ["node.exe"] = true }
          if r0_12 then
            r0_11 = r0_12
            break
          end
        end
        r0_11 = { node = true, npm = true }
      until true
      if r0_11[r0_8] then
        if r0_10 then
          r0_7 = MpCommon.PathToWin32Path(r0_3)
          if r0_7 == nil then
            return mp.CLEAN
          end
          r0_5 = string.lower(r0_7)
        end
        local r0_13 = r0_10 and "\\node_modules\\" or "/node_modules/"
        if string.find(r0_5, r0_13, 1, true) == nil then
          return mp.CLEAN
        end
        local r0_14 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
        local r0_15 = mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true
        if r0_14 == mp.SCANREASON_ONOPEN then
          if not r0_15 then
            return mp.CLEAN
          end
        elseif r0_14 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
          return mp.CLEAN
        end
        local r0_16 = mp.getfilesize()
        if type(r0_16) == "number" and not (r0_16 <= 0) then
          local r0_17 = r0_16
          r0_17 = r0_17 > 51200 and 51200 or r0_17
          mp.readprotection(false)
          local r0_18 = mp.readfile(0, r0_17)
          mp.readprotection(true)
          if type(r0_18) == "string" and r0_18 ~= "" then
            local r0_19 = {
              preinstall = true, postinstall = true, install = true, preprepare = true,
              prepare = true
            }
            local r0_20 = 0
            for r0_21 in pairs(r0_19) do
              r0_20 = r0_20 + 1
            end
            local r0_22 = {
              node = 1504130729, python = 3232655123, python3 = 3081328517, bash = 701350438,
              npx = 3351487242
            }
            local r0_23 = { [".js"] = 544968205, [".cjs"] = 1467793051, [".mjs"] = 3463835425 }

            local function r0_24(p4_0, p4_1)
              return (p4_0 - p4_0 % p4_1) / p4_1
            end

            local function r0_25(p5_0, p5_1)
              p5_1 = (p5_1 < 0 or p5_1 > 1114111) and 65533 or p5_1
              if p5_1 <= 127 then
                p5_0[#p5_0 + 1] = string.char(p5_1)
              elseif p5_1 <= 2047 then
                local r5_0 = r0_24(p5_1, 64)
                r5_0 = 192 + r5_0
                local r5_1 = 128 + p5_1 % 64
                p5_0[#p5_0 + 1] = string.char(r5_0, r5_1)
              elseif p5_1 <= 65535 then
                local r5_2 = r0_24(p5_1, 4096)
                r5_2 = 224 + r5_2
                local r5_3 = 128 + r0_24(p5_1, 64) % 64
                local r5_4 = 128 + p5_1 % 64
                p5_0[#p5_0 + 1] = string.char(r5_2, r5_3, r5_4)
              else
                local r5_5 = r0_24(p5_1, 262144)
                r5_5 = 240 + r5_5
                local r5_6 = 128 + r0_24(p5_1, 4096) % 64
                local r5_7 = 128 + r0_24(p5_1, 64) % 64
                local r5_8 = 128 + p5_1 % 64
                p5_0[#p5_0 + 1] = string.char(r5_5, r5_6, r5_7, r5_8)
              end
            end

            local function r0_26(p6_0, p6_1)
              local r6_0 = p6_1
              local r6_1 = #p6_0
              local r6_2 = {}
              while r6_0 <= r6_1 do
                local r6_3 = p6_0:sub(r6_0, r6_0)
                if r6_3 == '"' then
                  return table.concat(r6_2), r6_0 + 1
                end
                if r6_3 == "\\" then
                  if r6_0 == r6_1 then
                    return nil, nil
                  end
                  local r6_4 = p6_0:sub(r6_0 + 1, r6_0 + 1)
                  if r6_4 == '"' then
                    r6_2[#r6_2 + 1] = '"'
                  elseif r6_4 == "\\" then
                    r6_2[#r6_2 + 1] = "\\"
                  elseif r6_4 == "/" then
                    r6_2[#r6_2 + 1] = "/"
                  elseif r6_4 == "b" then
                    r6_2[#r6_2 + 1] = "\008"
                  elseif r6_4 == "f" then
                    r6_2[#r6_2 + 1] = "\012"
                  elseif r6_4 == "n" then
                    r6_2[#r6_2 + 1] = "\n"
                  elseif r6_4 == "r" then
                    r6_2[#r6_2 + 1] = "\r"
                  elseif r6_4 == "t" then
                    r6_2[#r6_2 + 1] = "\t"
                  elseif r6_4 == "u" then
                    local r6_5 = p6_0:sub(r6_0 + 2, r6_0 + 5)
                    if r0_1(r6_5) then
                      local r6_6 = tonumber(r6_5, 16)
                      local r6_7 = 0
                      if r6_6 >= 55296 and r6_6 <= 56319 then
                        if r6_0 + 11 <= r6_1 and p6_0:sub(r6_0 + 6, r6_0 + 7) == "\\u" then
                          local r6_8 = p6_0:sub(r6_0 + 8, r6_0 + 11)
                          if r0_1(r6_8) then
                            local r6_9 = tonumber(r6_8, 16)
                            if r6_9 >= 56320 and r6_9 <= 57343 then
                              r6_6 = 65536 + (r6_6 - 55296) * 1024 + (r6_9 - 56320)
                              r6_7 = 6
                            else
                              r6_6 = 65533
                            end
                          else
                            r6_6 = 65533
                          end
                        else
                          r6_6 = 65533
                        end
                      elseif r6_6 >= 56320 and r6_6 <= 57343 then
                        r6_6 = 65533
                      end
                      r0_25(r6_2, r6_6)
                      r6_0 = r6_0 + 4 + r6_7
                    else
                      r6_2[#r6_2 + 1] = "u"
                    end
                  else
                    r6_2[#r6_2 + 1] = r6_4
                  end
                  r6_0 = r6_0 + 2
                else
                  r6_2[#r6_2 + 1] = r6_3
                  r6_0 = r6_0 + 1
                end
              end
              return nil, nil
            end

            local function r0_27(p7_0, p7_1, p7_2)
              local r7_0 = p7_1
              while r7_0 <= p7_2 and r0_0(p7_0:sub(r7_0, r7_0)) do
                r7_0 = r7_0 + 1
              end
              return r7_0
            end

            local function r0_28(p8_0, p8_1, p8_2, p8_3, p8_4)
              local r8_0 = p8_1 + 1
              local r8_1 = 1
              while r8_0 <= p8_2 do
                local r8_2 = p8_0:sub(r8_0, r8_0)
                if r8_2 == '"' then
                  local r8_3, r8_4 = r0_26(p8_0, r8_0 + 1)
                  if not r8_4 then
                    return nil
                  end
                  r8_0 = r8_4
                elseif r8_2 == p8_3 then
                  r8_1 = r8_1 + 1
                  r8_0 = r8_0 + 1
                elseif r8_2 == p8_4 then
                  r8_1 = r8_1 - 1
                  r8_0 = r8_0 + 1
                  if r8_1 == 0 then
                    return r8_0
                  end
                else
                  r8_0 = r8_0 + 1
                end
              end
              return nil
            end

            local function r0_29(p9_0, p9_1, p9_2)
              local r9_0 = r0_27(p9_0, p9_1, p9_2)
              if p9_2 < r9_0 then
                return nil
              end
              local r9_1 = p9_0:sub(r9_0, r9_0)
              if r9_1 == '"' then
                local r9_2, r9_3 = r0_26(p9_0, r9_0 + 1)
                return r9_3
              end
              if r9_1 == "{" then
                return r0_28(p9_0, r9_0, p9_2, "{", "}")
              end
              if r9_1 == "[" then
                return r0_28(p9_0, r9_0, p9_2, "[", "]")
              end
              while r9_0 <= p9_2 do
                local r9_4 = p9_0:sub(r9_0, r9_0)
                if r9_4 == "," or r9_4 == "}" or r9_4 == "]" then
                  return r9_0
                end
                r9_0 = r9_0 + 1
              end
              return r9_0
            end

            local function r0_30(p10_0)
              local r10_0 = 1
              local r10_1 = #p10_0
              while r10_0 <= r10_1 do
                local r10_2 = p10_0:sub(r10_0, r10_0)
                if r10_2 == '"' then
                  local r10_3, r10_4 = r0_26(p10_0, r10_0 + 1)
                  if not r10_4 then
                    return nil, nil
                  end
                  local r10_5 = r0_27(p10_0, r10_4, r10_1)
                  if r10_5 <= r10_1 and p10_0:sub(r10_5, r10_5) == ":" then
                    r10_5 = r0_27(p10_0, r10_5 + 1, r10_1)
                    if r10_3 == "scripts" and r10_5 <= r10_1 and p10_0:sub(r10_5, r10_5) == "{" then
                      local r10_6 = r0_28(p10_0, r10_5, r10_1, "{", "}")
                      if r10_6 then
                        return r10_5 + 1, r10_6 - 2
                      end
                      return nil, nil
                    end
                    local r10_7 = r0_29(p10_0, r10_5, r10_1)
                    if not r10_7 then
                      return nil, nil
                    end
                    r10_0 = r10_7
                  else
                    r10_0 = r10_4
                  end
                else
                  r10_0 = r10_0 + 1
                end
              end
              return nil, nil
            end

            local r0_31, r0_32 = r0_30(r0_18)
            if r0_31 and r0_32 then
              local r0_33 = r0_31
              while r0_33 <= r0_32 do
                r0_33 = r0_27(r0_18, r0_33, r0_32)
                if r0_32 < r0_33 then
                  break
                end
                if r0_18:sub(r0_33, r0_33) == "," then
                  r0_33 = r0_33 + 1
                  r0_33 = r0_27(r0_18, r0_33, r0_32)
                  if r0_32 < r0_33 then
                    break
                  end
                end
                if r0_18:sub(r0_33, r0_33) == '"' then
                  local r0_34, r0_35 = r0_26(r0_18, r0_33 + 1)
                  if not r0_35 then
                    break
                  end
                  local r0_36 = r0_19[r0_34] == true
                  if r0_36 then
                    r0_19[r0_34] = nil
                    r0_20 = r0_20 - 1
                  end
                  r0_33 = r0_27(r0_18, r0_35, r0_32)
                  if r0_32 < r0_33 then
                    break
                  end
                  if r0_18:sub(r0_33, r0_33) ~= ":" then
                    break
                  end
                  local r0_37 = r0_27(r0_18, r0_33 + 1, r0_32)
                  if r0_32 < r0_37 then
                    break
                  end
                  if r0_18:sub(r0_37, r0_37) == '"' and r0_36 then
                    local r0_38, r0_39 = r0_26(r0_18, r0_37 + 1)
                    if not r0_39 then
                      break
                    end
                    r0_37 = r0_39
                    if r0_38 ~= nil then
                      local r0_40, r0_41 = nil, nil
                      local r0_42 = r0_2
                      r0_42 = r0_42(r0_38)
                      local r0_43 = type(r0_42)
                      r0_42 = r0_43 ~= "table" and {} or r0_42
                      r0_43 = r0_42[1]
                      local r0_44 = nil
                      if type(r0_43) == "string" and r0_43 ~= "" then
                        local r0_45 = string.lower(r0_43)
                        r0_40 = r0_22[r0_45]
                        if r0_40 then
                          local r0_46 = r0_45 == "node"
                            and {
                              ["-r"] = true, ["--require"] = true, ["--loader"] = true,
                              ["--import"] = true, ["--experimental-loader"] = true,
                              ["--eval"] = true, ["-e"] = true, ["--print"] = true, ["-p"] = true
                            }
                            or r0_45 == "npx"
                              and {
                                ["-r"] = true, ["--require"] = true, ["--loader"] = true,
                                ["--import"] = true, ["--experimental-loader"] = true,
                                ["--eval"] = true, ["-e"] = true, ["--print"] = true, ["-p"] = true
                              }
                            or r0_45 == "python"
                              and {
                                ["-c"] = true, ["-m"] = true, ["-W"] = true, ["-X"] = true,
                                ["--check-hash-based-pycs"] = true
                              }
                            or r0_45 == "python3"
                              and {
                                ["-c"] = true, ["-m"] = true, ["-W"] = true, ["-X"] = true,
                                ["--check-hash-based-pycs"] = true
                              }
                            or nil
                          local r0_47 = false
                          local r0_48 = #r0_42
                          for r0_49 = 2, r0_48 do
                            local r0_50 = r0_42[r0_49]
                            if r0_47 then
                              r0_47 = false
                            else
                              if r0_50 == "--" then
                                if #r0_42 > r0_49 then
                                  r0_40, r0_41 = r0_40, r0_42[r0_49 + 1]
                                end
                                break
                              end
                              local r0_51 = r0_50
                              if r0_51:sub(1, 2) == "--" then
                                local r0_52 = r0_50:match("^([^=]+)=")
                                if (r0_52 == nil or not r0_46 or not r0_46[r0_52])
                                  and r0_46
                                  and r0_46[r0_50] then
                                  r0_47 = true
                                end
                              else
                                r0_51 = r0_50
                                if r0_51:sub(1, 1) ~= "-" then
                                  r0_41 = r0_50
                                  break
                                end
                                if r0_46 and r0_46[r0_50] then
                                  r0_47 = true
                                end
                              end
                            end
                          end
                        end
                      end
                      if r0_40 then
                        r0_41 = r0_41 or r0_38
                        local r0_53 = type(r0_41)
                        if not (r0_53 == "string" and r0_41 ~= "") then
                          r0_41 = r0_38
                        end
                        r0_53 = type
                        r0_53 = r0_53(r0_41)
                        if r0_53 == "string" and r0_41 ~= "" then
                          local r0_54 = r0_41:gsub("^%./", ""):gsub("^%.\\", "")
                          r0_41 = r0_54
                          r0_54 = string.lower
                          local r0_55 = r0_41
                          r0_54 = r0_54(r0_55)
                          r0_54 = r0_54:match("(%.[^%.\\/]+)$")
                          r0_55 = nil
                          if r0_10 then
                            local r0_56 = r0_41:gsub("/", "\\"):gsub("\\+", "\\")
                            local r0_57 = MpCommon.PathToWin32Path
                            local r0_58, r0_59 = r0_7, r0_56
                            r0_58 = r0_58 .. "\\" .. r0_59
                            r0_59 = nil
                            r0_59 = nil
                            r0_55 = r0_57(r0_58)
                          else
                            local r0_60 = r0_41:gsub("\\", "/"):gsub("/+", "/")
                            local r0_61 = r0_7
                            local r0_62 = r0_60
                            r0_55 = r0_61 .. "/" .. r0_62
                          end
                          if r0_55 and sysio.IsFileExists(r0_55) then
                            local r0_63 = r0_54 and r0_23[r0_54] or r0_40
                            if type(r0_63) == "number" then
                              MpCommon.ReportLowfi(r0_55, r0_63)
                            end
                          end
                        end
                      end
                    end
                    r0_33 = r0_37
                  else
                    r0_37 = r0_29(r0_18, r0_37, r0_32)
                    if not r0_37 then
                      break
                    end
                    r0_33 = r0_37
                  end
                  if r0_20 == 0 then
                    break
                  end
                else
                  r0_33 = r0_33 + 1
                end
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
