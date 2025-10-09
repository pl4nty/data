-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\405b3b99109ec\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = (bm.get_sig_count)()
for l_0_6 = 1, l_0_0 do
  if (sigattr_tail[l_0_6]).attribute == 16385 then
    local l_0_7 = ((sigattr_tail[l_0_6]).utf8p1):lower()
    l_0_1[(mp.crc32)(0, l_0_7, 1, #l_0_7)] = l_0_6
  end
end
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
local l_0_11 = {}
local l_0_12 = false
for l_0_16 = 1, l_0_0 do
  if (sigattr_tail[l_0_16]).attribute == 16386 then
    local l_0_17 = ((sigattr_tail[l_0_16]).utf8p2):lower()
    local l_0_18 = ((sigattr_tail[l_0_16]).utf8p1):lower()
    local l_0_19 = (mp.crc32)(0, l_0_17, 1, #l_0_17)
    local l_0_20 = (mp.crc32)(0, l_0_18, 1, #l_0_18)
    if (l_0_1[l_0_20] ~= nil or l_0_1[l_0_19] ~= nil) and l_0_10[l_0_19] == nil then
      local l_0_21 = l_0_17:match("%.[^%.]+$")
      if l_0_21 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_21), 3) ~= 0 and #l_0_17 < #l_0_18 and l_0_18:find(l_0_17, 1, true) == 1 and l_0_18:byte(#l_0_17 + 1) ~= 58 then
        l_0_10[l_0_19] = 1
        local l_0_22 = l_0_18:match("%.[^%.]+$")
        if (mp.GetExtensionClass)(l_0_22) ~= 4 or isKnownRansomExtension(l_0_22) then
          if l_0_1[l_0_20] ~= nil then
            l_0_11[l_0_16] = l_0_1[l_0_20]
          else
            if l_0_1[l_0_19] ~= nil then
              l_0_11[l_0_16] = l_0_1[l_0_19]
            end
          end
          local l_0_23 = (string.sub)(l_0_18, #l_0_17 + 1)
          if l_0_8[l_0_23] ~= nil then
            (table.insert)(l_0_8[l_0_23], l_0_16)
          else
            local l_0_24 = {}
            -- DECOMPILER ERROR at PC151: No list found for R19 , SetList fails

          end
          do
            -- DECOMPILER ERROR at PC153: Overwrote pending register: R20 in 'AssignReg'

            local l_0_25 = l_0_23:match("%.[^%.]+$", 1, true)
            if l_0_25 ~= nil then
              if l_0_9[l_0_25] ~= nil then
                (table.insert)(l_0_9[l_0_25], l_0_16)
              else
                local l_0_26 = {}
                -- DECOMPILER ERROR at PC171: No list found for R20 , SetList fails

              end
              do
                do
                  if #l_0_9[l_0_25] >= 5 then
                    local l_0_27 = 0
                    -- DECOMPILER ERROR at PC178: Overwrote pending register: R21 in 'AssignReg'

                    for l_0_31,l_0_32 in l_0_16(l_0_8) do
                      if #l_0_8[l_0_31] == 1 then
                        l_0_27 = l_0_27 + 1
                      end
                    end
                    if l_0_27 >= 5 then
                      l_0_8 = l_0_9
                      l_0_23 = l_0_25
                      l_0_12 = true
                    end
                  end
                  if #l_0_8[l_0_23] >= 5 then
                    local l_0_33 = false
                    local l_0_34 = {}
                    l_0_34.count = 0
                    for l_0_38,l_0_39 in pairs(l_0_8[l_0_23]) do
                      local l_0_40 = (sysio.ReadFile)((sigattr_tail[l_0_39]).utf8p1, 0, 4)
                      if l_0_40 ~= nil and l_0_34[l_0_40] == nil then
                        l_0_34[l_0_40] = 1
                        l_0_34.count = l_0_34.count + 1
                      end
                    end
                    if l_0_34.count > 4 then
                      l_0_33 = true
                    end
                    ;
                    (bm.add_related_string)("magic_mismatch", tostring(l_0_33), bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("ransom_extension", l_0_23, bm.RelatedStringBMReport)
                    local l_0_41 = {}
                    local l_0_42 = {}
                    local l_0_43 = (bm.get_imagepath)()
                    if isnull(l_0_43) then
                      l_0_43 = "NA"
                    else
                      l_0_43 = l_0_43:lower()
                    end
                    -- DECOMPILER ERROR at PC266: Overwrote pending register: R25 in 'AssignReg'

                    if (bm.get_current_process_startup_info)() ~= nil then
                      do
                        local l_0_44 = ((bm.get_current_process_startup_info)()).ppid
                        l_0_41.cur_image_path = l_0_43
                        -- DECOMPILER ERROR at PC268: Confused about usage of register: R25 in 'UnsetPending'

                        l_0_41.proc_info = l_0_44
                        l_0_41.appended_ext = l_0_23
                        l_0_41.magic_mismatch = l_0_33
                        l_0_41.is_double_ext = l_0_12
                        l_0_41.sig_count = l_0_2
                        local l_0_45 = nil
                        for l_0_49,l_0_50 in pairs(l_0_8[l_0_23]) do
                          local l_0_46 = "FileChain_MainSet:"
                          -- DECOMPILER ERROR at PC279: Confused about usage of register: R31 in 'UnsetPending'

                          do
                            local l_0_52, l_0_53, l_0_54 = , (string.find)((sigattr_tail[R31_PC279]).utf8p1, "\\[^\\]*$") or 0
                            -- DECOMPILER ERROR at PC291: Confused about usage of register: R32 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC293: Confused about usage of register: R33 in 'UnsetPending'

                            local l_0_55 = nil
                            -- DECOMPILER ERROR at PC301: Confused about usage of register: R33 in 'UnsetPending'

                            do
                              if (string.find)(l_0_52, ".", l_0_53, true) ~= nil then
                                local l_0_56 = nil
                                l_0_46 = l_0_46 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_55, l_0_53 + 1, (string.find)(l_0_52, ".", l_0_53, true) - 1), 0, #(string.sub)(l_0_55, l_0_53 + 1, (string.find)(l_0_52, ".", l_0_53, true) - 1))
                                l_0_46 = l_0_46 .. ";" .. (string.sub)(l_0_55, (string.find)(l_0_52, ".", l_0_53, true) + 1) .. ";"
                              end
                              l_0_55 = (sigattr_tail[l_0_51]).utf8p2
                              -- DECOMPILER ERROR at PC346: Confused about usage of register: R33 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC347: Confused about usage of register: R34 in 'UnsetPending'

                              do
                                do
                                  if (string.find)(l_0_55, ".", (string.find)(l_0_55, "\\[^\\]*$") or 0, true) ~= nil then
                                    local l_0_57 = nil
                                    l_0_46 = l_0_46 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_55, ((string.find)(l_0_55, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_55, ".", (string.find)(l_0_55, "\\[^\\]*$") or 0, true) - 1), 0, #(string.sub)(l_0_55, ((string.find)(l_0_55, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_55, ".", (string.find)(l_0_55, "\\[^\\]*$") or 0, true) - 1))
                                    -- DECOMPILER ERROR at PC363: Confused about usage of register: R34 in 'UnsetPending'

                                    l_0_46 = l_0_46 .. ";" .. (string.sub)(l_0_55, (string.find)(l_0_55, ".", (string.find)(l_0_55, "\\[^\\]*$") or 0, true) + 1) .. ";"
                                  end
                                  ;
                                  (table.insert)(l_0_42, (sigattr_tail[l_0_51]).utf8p1)
                                  ;
                                  (table.insert)(l_0_42, (sigattr_tail[l_0_51]).utf8p2)
                                  -- DECOMPILER ERROR at PC381: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC381: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC381: LeaveBlock: unexpected jumping out DO_STMT

                                end
                              end
                            end
                          end
                        end
                        l_0_41.file_list = l_0_42
                        local l_0_58, l_0_59 = , (bm.get_process_relationships)()
                        for l_0_63,l_0_64 in ipairs(l_0_59) do
                          local l_0_60 = nil
                          -- DECOMPILER ERROR at PC391: Confused about usage of register: R33 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC396: Confused about usage of register: R33 in 'UnsetPending'

                          if l_0_57.image_path ~= nil then
                            (bm.add_related_process)(l_0_57.ppid)
                          end
                        end
                        -- DECOMPILER ERROR at PC401: Confused about usage of register: R28 in 'UnsetPending'

                        for l_0_68,l_0_69 in ipairs(l_0_60) do
                          local l_0_65 = nil
                          -- DECOMPILER ERROR at PC404: Confused about usage of register: R33 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC409: Confused about usage of register: R33 in 'UnsetPending'

                          if l_0_57.image_path ~= nil then
                            (bm.add_related_process)(l_0_57.ppid)
                          end
                        end
                        ;
                        (bm.add_related_string)("ransom_files_main", l_0_58, bm.RelatedStringBMReport)
                        do
                          local l_0_70 = nil
                          ;
                          (bm.add_related_string)("genb_ransom_meta", safeJsonSerialize(l_0_41), bm.RelatedStringBMReport)
                          ;
                          (bm.add_related_string)("sigcount_type2", l_0_2, bm.RelatedStringBMReport)
                          do return mp.INFECTED end
                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC440: LeaveBlock: unexpected jumping out IF_STMT

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
return mp.CLEAN

