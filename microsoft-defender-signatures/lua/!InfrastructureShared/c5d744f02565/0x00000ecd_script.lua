-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5d744f02565\0x00000ecd_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetProcessAttributeValue)(l_0_0, "inherit:PFApp_Parent")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.hstr_full_log)()
do
  if l_0_3 and ((l_0_3[2]).matched or (l_0_3[3]).matched) then
    local l_0_5, l_0_6 = (MpCommon.StringRegExpSearch)("(powershell|pwsh).exe.*-e(nc)?\\s+([-A-Za-z0-9+/]{10,}=*)", l_0_2)
    if not l_0_5 then
      return mp.CLEAN
    end
  end
  local l_0_4 = ""
  local l_0_7 = 1
  local l_0_8 = ""
  local l_0_9 = {}
  local l_0_10, l_0_11 = , (MpCommon.StringRegExpSearch)("(?:(?i)FromBase64String\\([\'\"]?)(\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})(?:[\'\"]?\\))", l_0_2)
  if l_0_11 and (string.find)(R12_PC70, "$", 1, true) then
    local l_0_12 = nil
    -- DECOMPILER ERROR at PC80: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC83: Overwrote pending register: R12 in 'AssignReg'

    if (string.match)(R12_PC70, "$([%w_]+)") then
      local l_0_13 = nil
      local l_0_14 = R12_PC70
      if (string.match)(l_0_2, R12_PC70) then
        if #(string.match)(l_0_2, R12_PC70) > 35 then
          l_0_7 = l_0_7 + 10
        end
        local l_0_15 = nil
        if (MpCommon.Base64Decode)((string.match)(l_0_2, R12_PC70)) then
          l_0_4 = (MpCommon.Base64Decode)((string.match)(l_0_2, R12_PC70))
        else
          l_0_7 = l_0_7 + 10
          l_0_8 = "obfuscated_var1"
        end
      else
        do
          do
            -- DECOMPILER ERROR at PC109: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC120: Confused about usage of register: R13 in 'UnsetPending'

            if (string.match)(l_0_2, l_0_14) and not (string.find)((string.match)(l_0_2, l_0_14), "[A-Za-z]:\\[^%s]+") then
              l_0_7 = l_0_7 + 10
              l_0_8 = "obfuscated_var2"
            end
            -- DECOMPILER ERROR at PC130: Confused about usage of register: R10 in 'UnsetPending'

            if l_0_11 then
              if #l_0_12 > 35 then
                l_0_7 = l_0_7 + 10
              end
              -- DECOMPILER ERROR at PC136: Confused about usage of register: R10 in 'UnsetPending'

              -- DECOMPILER ERROR at PC136: Overwrote pending register: R12 in 'AssignReg'

              local l_0_16 = nil
              if (MpCommon.Base64Decode)(l_0_14) then
                l_0_4 = (MpCommon.Base64Decode)(l_0_14)
              else
                l_0_7 = l_0_7 + 10
                l_0_8 = "obfuscated_var3"
              end
            else
              do
                if not l_0_11 then
                  l_0_10 = "-e (\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})"
                  if l_0_11 then
                    local l_0_17 = nil
                    if (MpCommon.Base64Decode)(R10_PC159) then
                      l_0_4 = (MpCommon.Base64Decode)(R10_PC159)
                    else
                      l_0_7 = l_0_7 + 10
                      l_0_8 = "obfuscated_var5"
                    end
                  else
                    do
                      l_0_7 = l_0_7 + 10
                      l_0_8 = "obfuscated_var4"
                      l_0_2 = (string.lower)(l_0_2)
                      l_0_4 = (string.lower)(l_0_4)
                      local l_0_18 = nil
                      local l_0_19 = l_0_2 .. l_0_4
                      for l_0_23,l_0_24 in pairs({["[io.file]::writeallbytes"] = 5, ["system.reflection.assembly"] = 5, ["iisy.invoke"] = 5, tcplistener = 5, accepttcpclient = 5, tcpclient = 5, downloadstring = 5, ["[^r]shell[^.]"] = 5, ["cmd.exe"] = 5, defender = 30, scriptblock = 5, webrequest = 5, ["user-agent"] = 10, webclient = 5, ["unicode.getstring"] = 5, whoami = 5, ["net user"] = 5}) do
                        local l_0_20 = nil
                        -- DECOMPILER ERROR at PC212: Confused about usage of register: R17 in 'UnsetPending'

                        if (string.find)(l_0_19, l_0_24) then
                          l_0_7 = l_0_7 + R17_PC212
                          l_0_8 = l_0_8 .. ";" .. l_0_24
                        end
                      end
                      local l_0_25 = nil
                      local l_0_26, l_0_27 = , (MpCommon.StringRegExpSearch)("((?i)(ftp|http[s]?)://[^\\\"\\s\\\']+)", l_0_19)
                      if l_0_27 then
                        l_0_9.uri = "((?i)(ftp|http[s]?)://[^\\\"\\s\\\']+)"
                        l_0_7 = l_0_7 + 10
                        l_0_8 = l_0_8 .. ";url"
                        l_0_27 = (MpCommon.StringRegExpSearch)(".(exe|dll|ps1|bat|rar)$", R18_PC236)
                        if l_0_27 then
                          l_0_7 = l_0_7 + 10
                          l_0_8 = l_0_8 .. ";file_extension"
                        end
                        if (string.find)(R17_PC249, R18_PC236) then
                          l_0_7 = l_0_7 + 10
                          l_0_8 = l_0_8 .. R17_PC249
                        end
                        local l_0_28 = nil
                        -- DECOMPILER ERROR at PC260: Overwrote pending register: R17 in 'AssignReg'

                        local l_0_29 = {SIG_CONTEXT = "CMD", FILELESS = "true", CMDLINE_URL = "true"}
                        local l_0_30 = R17_PC249
                        l_0_30, R18_PC236 = l_0_30(R18_PC236, l_0_29, false, 2000), {l_0_28}
                        if l_0_30 then
                          R18_PC236 = l_0_30.urls
                          R18_PC236 = R18_PC236[l_0_28]
                          if R18_PC236 then
                            R18_PC236 = l_0_30.urls
                            R18_PC236 = R18_PC236[l_0_28]
                            R18_PC236 = R18_PC236.determination
                            if R18_PC236 ~= 1 then
                              R18_PC236 = l_0_30.urls
                              R18_PC236 = R18_PC236[l_0_28]
                              R18_PC236 = R18_PC236.confidence
                              if R18_PC236 >= 60 then
                                l_0_9.detectorId = "BadUrlRep"
                                R18_PC236 = l_0_30.urls
                                R18_PC236 = R18_PC236[l_0_28]
                                R18_PC236 = R18_PC236.confidence
                                l_0_9.confidence = R18_PC236
                                R18_PC236 = l_0_30.urls
                                R18_PC236 = R18_PC236[l_0_28]
                                R18_PC236 = R18_PC236.determination
                                l_0_9.determination = R18_PC236
                                l_0_7 = l_0_7 + 10
                              end
                            end
                          end
                        end
                      end
                      do
                        if (string.find)(l_0_4, R18_PC236, 1, true) then
                          l_0_7 = l_0_7 + 10
                          l_0_8 = l_0_8 .. ";MultilayerEncoding"
                        end
                        l_0_9.Score = l_0_7
                        l_0_9.ProcessAttribute = l_0_1
                        l_0_9.Evidence = l_0_8
                        -- DECOMPILER ERROR at PC312: Overwrote pending register: R18 in 'AssignReg'

                        do
                          local l_0_32, l_0_33 = , function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_3
  if l_0_3 and ((l_0_3[2]).matched or (l_0_3[5]).matched or (l_0_3[3]).matched) then
    return false
  end
  local l_1_1 = {}
  -- DECOMPILER ERROR at PC25: No list found for R1 , SetList fails

  local l_1_2 = false
  -- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

  for l_1_6,l_1_7 in ("w3wp")("sqlservr") do
    if (string.find)(l_1_0, l_1_7) then
      l_1_2 = true
      break
    end
  end
  do
    return l_1_2
  end
end

                          -- DECOMPILER ERROR at PC327: Overwrote pending register: R18 in 'AssignReg'

                          -- DECOMPILER ERROR at PC328: Overwrote pending register: R17 in 'AssignReg'

                          if l_0_33(l_0_1) and l_0_7 > 30 then
                            set_research_data("Evidence", (MpCommon.Base64Encode)(nil), false)
                            set_research_data("Error", (MpCommon.Base64Encode)(R18_PC236), false)
                            return mp.INFECTED
                          end
                          l_0_9.Concrete = false
                          -- DECOMPILER ERROR at PC355: Overwrote pending register: R18 in 'AssignReg'

                          set_research_data("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_9, 150, nil, true)), false)
                          set_research_data("Error", (MpCommon.Base64Encode)(R18_PC236), false)
                          do return mp.LOWFI end
                          -- DECOMPILER ERROR at PC376: freeLocal<0 in 'ReleaseLocals'

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

