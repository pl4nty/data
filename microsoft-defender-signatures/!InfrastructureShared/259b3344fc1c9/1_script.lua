-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\259b3344fc1c9\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = {}
local l_0_8 = (bm.get_sig_count)()
for l_0_12 = 1, l_0_0 do
  local l_0_13 = (sigattr_tail[l_0_12]).attribute
  if l_0_13 == 16384 then
    local l_0_14 = ((sigattr_tail[l_0_12]).utf8p1):lower()
    local l_0_15 = l_0_14:match("%.[^%.]+$")
    if l_0_15 ~= nil then
      l_0_15 = l_0_15 .. "\""
      if (mp.GetExtensionClass)(l_0_15) ~= 0 then
        local l_0_16 = (mp.crc32)(0, l_0_14, 1, #l_0_14)
        if l_0_1[l_0_16] ~= nil then
          (table.insert)(l_0_1[l_0_16], l_0_12)
        else
          local l_0_17 = {}
          -- DECOMPILER ERROR at PC58: No list found for R17 , SetList fails

        end
      end
    end
  end
end
if l_0_6 < 5 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC67: Overwrote pending register: R6 in 'AssignReg'

for l_0_21 = 1, l_0_0 do
  local l_0_22 = (sigattr_tail[l_0_21]).attribute
  if l_0_22 == 16387 then
    local l_0_23 = ((sigattr_tail[l_0_21]).utf8p1):lower()
    -- DECOMPILER ERROR at PC86: Overwrote pending register: R18 in 'AssignReg'

    local l_0_24 = (mp.crc32)(0, l_0_23, l_0_12, #l_0_23)
    -- DECOMPILER ERROR at PC92: Overwrote pending register: R6 in 'AssignReg'

    do
      if not (string.find)(l_0_23, "\\[^\\]*$") then
        local l_0_25, l_0_26, l_0_27 = l_0_1[l_0_24] ~= nil or 0
      end
      -- DECOMPILER ERROR at PC105: Confused about usage of register: R16 in 'UnsetPending'

      local l_0_28 = nil
      if (string.find)(l_0_23, ".", l_0_25, true) ~= nil then
        local l_0_29 = nil
        if (string.sub)(l_0_23, l_0_28 + 1, (string.find)(l_0_23, ".", l_0_25, true) - 1) ~= nil then
          if l_0_2[(string.sub)(l_0_23, l_0_28 + 1, (string.find)(l_0_23, ".", l_0_25, true) - 1)] == nil then
            local l_0_30 = nil
            l_0_2[l_0_30] = {l_0_24, l_0_21}
          else
            do
              do
                -- DECOMPILER ERROR at PC129: Confused about usage of register: R18 in 'UnsetPending'

                ;
                (table.insert)(l_0_2[l_0_30], l_0_21)
                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end
if l_0_6 < 5 then
  return mp.CLEAN
end
for l_0_34,l_0_35 in pairs(l_0_1) do
  local l_0_36 = l_0_35[1]
  local l_0_37 = ((sigattr_tail[l_0_36]).utf8p1):lower()
  do
    local l_0_38, l_0_39, l_0_40, l_0_41 = (string.find)(l_0_37, "\\[^\\]*$") or 0
    -- DECOMPILER ERROR at PC160: Confused about usage of register: R16 in 'UnsetPending'

    local l_0_42 = nil
    if (string.find)(l_0_37, ".", l_0_38, true) ~= nil then
      local l_0_43 = nil
      local l_0_44 = (string.sub)(l_0_37, l_0_42 + 1, -1)
      local l_0_45 = ((string.sub)(l_0_37, l_0_42 + 1, l_0_43 - 1))
      -- DECOMPILER ERROR at PC183: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC190: Confused about usage of register: R20 in 'UnsetPending'

      if (l_0_44 == nil or l_0_45 ~= nil) and nil ~= nil and (mp.GetExtensionClass)(nil) ~= 0 and l_0_2[l_0_45] ~= nil then
        local l_0_46 = nil
        local l_0_47 = (l_0_2[l_0_45])[1]
        if l_0_1[l_0_47] == nil then
          local l_0_48 = nil
          if #l_0_37 < #((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower() and (((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower()):find(l_0_37, 1, true) == 1 and (((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower()):byte(#l_0_37 + 1) ~= 58 then
            local l_0_49 = nil
            -- DECOMPILER ERROR at PC239: Unhandled construct in 'MakeBoolean' P1

            if l_0_3[(string.sub)(((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower(), #l_0_37 + 1)] ~= nil and l_0_4[l_0_47] == nil then
              l_0_4[l_0_47] = 1
              ;
              (table.insert)(l_0_3[(string.sub)(((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower(), #l_0_37 + 1)], l_0_48)
              ;
              (table.insert)(l_0_3[(string.sub)(((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower(), #l_0_37 + 1)], l_0_36)
              if #l_0_3[(string.sub)(((sigattr_tail[(l_0_2[l_0_45])[2]]).utf8p1):lower(), #l_0_37 + 1)] >= 10 then
                local l_0_50 = nil
                for l_0_54,l_0_55 in pairs(l_0_3[l_0_50]) do
                  local l_0_51 = {count = 0}
                  -- DECOMPILER ERROR at PC263: Confused about usage of register: R30 in 'UnsetPending'

                  if (sysio.ReadFile)((sigattr_tail[R30_PC263]).utf8p1, 0, 4) ~= nil and l_0_51[(sysio.ReadFile)((sigattr_tail[R30_PC263]).utf8p1, 0, 4)] == nil then
                    l_0_51[(sysio.ReadFile)((sigattr_tail[R30_PC263]).utf8p1, 0, 4)] = 1
                    l_0_51.count = l_0_51.count + 1
                  end
                end
                ;
                (bm.add_related_string)("ransom_extension", l_0_50, bm.RelatedStringBMReport)
                local l_0_57 = nil
                local l_0_58 = {}
                local l_0_59 = {}
                local l_0_60 = {}
                -- DECOMPILER ERROR at PC309: Overwrote pending register: R30 in 'AssignReg'

                if not isnull((bm.get_imagepath)()) or (bm.get_current_process_startup_info)() ~= nil then
                  do
                    local l_0_61 = ("NA"):lower()
                    -- DECOMPILER ERROR at PC310: Confused about usage of register: R29 in 'UnsetPending'

                    l_0_58.proc_info = ((bm.get_current_process_startup_info)()).ppid
                    l_0_58.appended_ext = l_0_50
                    l_0_58.sig_count = l_0_8
                    l_0_58.debug_data = l_0_7
                    local l_0_62 = nil
                    for l_0_66,l_0_67 in pairs(l_0_3[l_0_50]) do
                      local l_0_63, l_0_64 = , "FileChain_MainSet:"
                      -- DECOMPILER ERROR at PC321: Confused about usage of register: R36 in 'UnsetPending'

                      do
                        local l_0_70, l_0_71 = , (string.find)((sigattr_tail[R36_PC321]).utf8p1, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC333: Confused about usage of register: R37 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC335: Confused about usage of register: R38 in 'UnsetPending'

                        local l_0_72 = nil
                        -- DECOMPILER ERROR at PC342: Confused about usage of register: R37 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC343: Confused about usage of register: R38 in 'UnsetPending'

                        do
                          if (string.find)(l_0_70, ".", l_0_71, true) ~= nil then
                            local l_0_73 = nil
                            l_0_64 = l_0_64 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_70, l_0_71 + 1, (string.find)(l_0_70, ".", l_0_71, true) - 1), 0, #(string.sub)(l_0_70, l_0_71 + 1, (string.find)(l_0_70, ".", l_0_71, true) - 1))
                            l_0_64 = l_0_64 .. ";" .. (string.sub)(l_0_73, (string.find)(l_0_70, ".", l_0_71, true) + 1) .. ";"
                          end
                          ;
                          (table.insert)(l_0_59, (sigattr_tail[l_0_72]).utf8p1)
                          local l_0_74 = nil
                          if l_0_5[l_0_72] ~= nil then
                            if sigattr_tail[l_0_5[l_0_72]] ~= nil then
                              local l_0_75 = nil
                              local l_0_76 = nil
                              -- DECOMPILER ERROR at PC397: Overwrote pending register: R40 in 'AssignReg'

                              if nil == nil then
                                do
                                  (table.insert)(l_0_60, ((sigattr_tail[l_0_5[l_0_72]]).utf8p1):lower())
                                  ;
                                  (table.insert)(l_0_60, -1)
                                  if sigattr_tail[l_0_72] ~= nil then
                                    local l_0_77 = nil
                                    local l_0_78 = nil
                                    if (string.match)(((sigattr_tail[l_0_72]).utf8p2):lower(), "fsize:(%d+)") == nil then
                                      do
                                        (table.insert)(l_0_60, ((sigattr_tail[l_0_72]).utf8p1):lower())
                                        ;
                                        (table.insert)(l_0_60, -1)
                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC444: LeaveBlock: unexpected jumping out DO_STMT

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
                    l_0_58.file_list = l_0_59
                    l_0_58.file_size = l_0_60
                    -- DECOMPILER ERROR at PC451: Confused about usage of register: R31 in 'UnsetPending'

                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_64, bm.RelatedStringBMReport)
                    local l_0_79 = nil
                    ;
                    (bm.add_related_string)("gendrv_ransom_meta", safeJsonSerialize(l_0_58), bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("sigcount_type4_rv", l_0_8, bm.RelatedStringBMReport)
                    reportSessionInformationInclusive()
                    do
                      local l_0_80, l_0_81 = nil
                      -- DECOMPILER ERROR at PC488: Overwrote pending register: R38 in 'AssignReg'

                      if not pcall(reportBmInfo) and reportBmInfo then
                        (bm.add_related_string)("bmInfoFailReason", tostring(R38_PC486), R38_PC486)
                      end
                      do return mp.INFECTED end
                      do
                        local l_0_82 = nil
                        l_0_3[l_0_82] = {l_0_48, l_0_36}
                        l_0_4[l_0_47] = 1
                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC500: LeaveBlock: unexpected jumping out DO_STMT

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
return mp.CLEAN

