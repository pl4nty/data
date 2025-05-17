-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\38db374735597\1_luac 

-- params : ...
-- function num : 0
if (mp.IsHipsRuleEnabled)("c1db55ab-c21a-4637-bb3f-a12568109d35") ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
for l_0_5 = 1, l_0_0 do
  if (sigattr_tail[l_0_5]).attribute == 16384 then
    local l_0_6 = ((sigattr_tail[l_0_5]).utf8p1):lower()
    l_0_1[(mp.crc32)(0, l_0_6, 1, #l_0_6)] = 1
  end
end
local l_0_7 = {}
do
  local l_0_8 = {}
  for l_0_12 = 1, l_0_0 do
    if (sigattr_tail[l_0_12]).attribute == 16386 then
      local l_0_13 = ((sigattr_tail[l_0_12]).utf8p2):lower()
      local l_0_14 = ((sigattr_tail[l_0_12]).utf8p1):lower()
      local l_0_15 = (mp.crc32)(0, l_0_13, 1, #l_0_13)
      local l_0_16 = (mp.crc32)(0, l_0_14, 1, #l_0_14)
      if l_0_1[l_0_15] ~= nil and l_0_8[l_0_16] == nil then
        local l_0_17 = l_0_14:match("%.[^%.]+$")
        if l_0_17 ~= nil then
          local l_0_18 = (mp.GetExtensionClass)(l_0_17)
          if (l_0_18 == 2 or l_0_18 == 3 or l_0_17 == ".pdf") and #l_0_14 < #l_0_13 and l_0_13:find(l_0_14, 1, true) == 1 and l_0_13:byte(#l_0_14 + 1) ~= 58 then
            l_0_8[l_0_16] = 1
            local l_0_19 = l_0_13:match("%.[^%.]+$")
            if (mp.GetExtensionClass)(l_0_19) ~= 4 then
              local l_0_20 = (string.sub)(l_0_13, #l_0_14 + 1)
              if l_0_7[l_0_20] ~= nil then
                (table.insert)(l_0_7[l_0_20], l_0_12)
                if #l_0_7[l_0_20] >= 5 then
                  local l_0_21 = false
                  local l_0_22 = {}
                  l_0_22.count = 0
                  for l_0_26,l_0_27 in pairs(l_0_7[l_0_20]) do
                    local l_0_28 = (sysio.ReadFile)((sigattr_tail[l_0_27]).utf8p1, 0, 4)
                    if l_0_28 ~= nil and l_0_22[l_0_28] == nil then
                      l_0_22[l_0_28] = 1
                      l_0_22.count = l_0_22.count + 1
                    end
                  end
                  if l_0_22.count > 4 then
                    l_0_21 = true
                  end
                  ;
                  (bm.add_related_string)("magic_mismatch", tostring(l_0_21), bm.RelatedStringBMReport)
                  ;
                  (bm.add_related_string)("ransom_extension", l_0_20, bm.RelatedStringBMReport)
                  local l_0_29 = {}
                  local l_0_30 = ((bm.get_imagepath)()):lower()
                  -- DECOMPILER ERROR at PC195: Overwrote pending register: R20 in 'AssignReg'

                  if (bm.get_current_process_startup_info)() ~= nil then
                    do
                      local l_0_31, l_0_32, l_0_33, l_0_34, l_0_35, l_0_36 = ((bm.get_current_process_startup_info)()).ppid
                      ;
                      (table.insert)(l_0_29, l_0_30)
                      -- DECOMPILER ERROR at PC204: Confused about usage of register: R20 in 'UnsetPending'

                      ;
                      (table.insert)(l_0_29, l_0_31)
                      ;
                      (table.insert)(l_0_29, l_0_20)
                      ;
                      (table.insert)(l_0_29, l_0_21)
                      local l_0_37 = nil
                      for l_0_41,l_0_42 in pairs(l_0_7[l_0_20]) do
                        local l_0_38 = "FileChain_MainSet:"
                        -- DECOMPILER ERROR at PC222: Confused about usage of register: R26 in 'UnsetPending'

                        do
                          local l_0_44, l_0_45, l_0_46 = , (string.find)((sigattr_tail[4]).utf8p1, "\\[^\\]*$") or 0
                          -- DECOMPILER ERROR at PC234: Confused about usage of register: R27 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC236: Confused about usage of register: R28 in 'UnsetPending'

                          local l_0_47 = nil
                          -- DECOMPILER ERROR at PC244: Confused about usage of register: R28 in 'UnsetPending'

                          do
                            if (string.find)(l_0_44, ".", l_0_45, true) ~= nil then
                              local l_0_48 = nil
                              l_0_38 = l_0_38 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_47, l_0_45 + 1, (string.find)(l_0_44, ".", l_0_45, true) - 1), 0, #(string.sub)(l_0_47, l_0_45 + 1, (string.find)(l_0_44, ".", l_0_45, true) - 1))
                              l_0_38 = l_0_38 .. ";" .. (string.sub)(l_0_47, (string.find)(l_0_44, ".", l_0_45, true) + 1) .. ";"
                            end
                            l_0_47 = (sigattr_tail[l_0_43]).utf8p2
                            -- DECOMPILER ERROR at PC289: Confused about usage of register: R28 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC290: Confused about usage of register: R29 in 'UnsetPending'

                            do
                              do
                                if (string.find)(l_0_47, ".", (string.find)(l_0_47, "\\[^\\]*$") or 0, true) ~= nil then
                                  local l_0_49 = nil
                                  l_0_38 = l_0_38 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_47, ((string.find)(l_0_47, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_47, ".", (string.find)(l_0_47, "\\[^\\]*$") or 0, true) - 1), 0, #(string.sub)(l_0_47, ((string.find)(l_0_47, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_47, ".", (string.find)(l_0_47, "\\[^\\]*$") or 0, true) - 1))
                                  -- DECOMPILER ERROR at PC306: Confused about usage of register: R29 in 'UnsetPending'

                                  l_0_38 = l_0_38 .. ";" .. (string.sub)(l_0_47, (string.find)(l_0_47, ".", (string.find)(l_0_47, "\\[^\\]*$") or 0, true) + 1) .. ";"
                                end
                                ;
                                (table.insert)(l_0_29, (sigattr_tail[l_0_43]).utf8p1)
                                ;
                                (table.insert)(l_0_29, (sigattr_tail[l_0_43]).utf8p2)
                                -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out DO_STMT

                              end
                            end
                          end
                        end
                      end
                      local l_0_50, l_0_51 = , (bm.get_process_relationships)()
                      for l_0_55,l_0_56 in ipairs(l_0_51) do
                        local l_0_52 = nil
                        -- DECOMPILER ERROR at PC333: Confused about usage of register: R28 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC338: Confused about usage of register: R28 in 'UnsetPending'

                        if l_0_49.image_path ~= nil then
                          (bm.add_related_process)(l_0_49.ppid)
                        end
                      end
                      -- DECOMPILER ERROR at PC343: Confused about usage of register: R23 in 'UnsetPending'

                      for l_0_60,l_0_61 in ipairs(l_0_52) do
                        local l_0_57 = nil
                        -- DECOMPILER ERROR at PC346: Confused about usage of register: R28 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC351: Confused about usage of register: R28 in 'UnsetPending'

                        if l_0_49.image_path ~= nil then
                          (bm.add_related_process)(l_0_49.ppid)
                          -- DECOMPILER ERROR at PC354: Confused about usage of register: R28 in 'UnsetPending'

                          TrackPidAndTechniqueBM(l_0_49.ppid, "T1485", "susp_ransmware_childproc_type2")
                        end
                      end
                      ;
                      (bm.add_related_string)("ransom_files_main", l_0_50, bm.RelatedStringBMReport)
                      do
                        local l_0_62 = nil
                        ;
                        (bm.add_related_string)("genb2_ransom_meta", safeJsonSerialize(l_0_29), bm.RelatedStringBMReport)
                        ;
                        (bm.trigger_sig)("GenericRansomware:Type2.2", safeJsonSerialize(l_0_29))
                        sms_untrusted_process()
                        ;
                        (bm.add_action)("SmsAsyncScanEvent", 100)
                        TrackPidAndTechniqueBM(l_0_37, "T1486", "susp_ransomware_type2")
                        reportTimingData()
                        do return mp.INFECTED end
                        do
                          local l_0_63 = {}
                          -- DECOMPILER ERROR at PC402: No list found for R16 , SetList fails

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC404: LeaveBlock: unexpected jumping out IF_STMT

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
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

