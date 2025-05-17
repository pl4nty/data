-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95bb3b32d9b54\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0[".zzz"] = true
l_0_0[".couch"] = true
l_0_0[".___"] = true
l_0_0[".amq"] = true
l_0_0[".aaaa"] = true
l_0_0[".importing"] = true
l_0_0[".yyy"] = true
l_0_0[".____"] = true
l_0_0[".xxxx"] = true
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = (bm.get_sig_count)()
for l_0_7 = 1, l_0_1 do
  if (sigattr_tail[l_0_7]).attribute == 16385 then
    l_0_2[((sigattr_tail[l_0_7]).utf8p1):lower()] = l_0_7
  end
end
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
for l_0_14 = 1, l_0_1 do
  if (sigattr_tail[l_0_14]).attribute == 16386 then
    local l_0_15 = ((sigattr_tail[l_0_14]).utf8p2):lower()
    local l_0_16 = ((sigattr_tail[l_0_14]).utf8p1):lower()
    if (l_0_2[l_0_16] ~= nil or l_0_2[l_0_15] ~= nil) and l_0_9[l_0_15] == nil then
      local l_0_17 = l_0_16:match("%.[^%.]+$")
      if l_0_17 and l_0_0[l_0_17] == nil and (mp.GetExtensionClass)(l_0_17) == 0 then
        local l_0_18 = l_0_15:match("%.[^%.]+$")
        if l_0_18 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_18), 3) ~= 0 then
          local l_0_19 = l_0_15:match("^(.+)\\")
          local l_0_20 = l_0_16:match("^(.+)\\")
          local l_0_21 = l_0_15:match("[^\\]+$")
          local l_0_22 = l_0_16:match("[^\\]+$")
          local l_0_23 = (l_0_22:match("(.+)%..+")):lower()
          local l_0_24 = (l_0_21:match("(.+)%..+")):lower()
          if l_0_19 == l_0_20 and l_0_16:byte(#l_0_16 + 1) ~= 58 and l_0_23:find(l_0_24, 1, true) == nil then
            l_0_9[l_0_15] = 1
            if l_0_2[l_0_16] ~= nil then
              l_0_10[l_0_14] = l_0_2[l_0_16]
            else
              if l_0_2[l_0_15] ~= nil then
                l_0_10[l_0_14] = l_0_2[l_0_15]
              end
            end
            if l_0_8[l_0_17] ~= nil then
              (table.insert)(l_0_8[l_0_17], l_0_14)
            else
              local l_0_25 = {}
              -- DECOMPILER ERROR at PC152: No list found for R21 , SetList fails

            end
            do
              if #l_0_8[l_0_17] >= 5 then
                local l_0_26 = false
                local l_0_27 = {}
                l_0_27.count = 0
                for l_0_31,l_0_32 in pairs(l_0_8[l_0_17]) do
                  local l_0_33 = (sysio.ReadFile)((sigattr_tail[l_0_32]).utf8p1, 0, 4)
                  if l_0_33 ~= nil and l_0_27[l_0_33] == nil then
                    l_0_27[l_0_33] = 1
                    l_0_27.count = l_0_27.count + 1
                  end
                end
                if l_0_27.count > 4 then
                  l_0_26 = true
                end
                ;
                (bm.add_related_string)("magic_mismatch", tostring(l_0_26), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_17, bm.RelatedStringBMReport)
                local l_0_34 = {}
                local l_0_35 = {}
                local l_0_36 = ((bm.get_imagepath)()):lower()
                -- DECOMPILER ERROR at PC218: Overwrote pending register: R26 in 'AssignReg'

                if (bm.get_current_process_startup_info)() ~= nil then
                  do
                    local l_0_37 = ((bm.get_current_process_startup_info)()).ppid
                    l_0_34.cur_image_path = l_0_36
                    -- DECOMPILER ERROR at PC220: Confused about usage of register: R26 in 'UnsetPending'

                    l_0_34.proc_info = l_0_37
                    l_0_34.appended_ext = l_0_17
                    l_0_34.magic_mismatch = l_0_26
                    local l_0_38 = nil
                    for l_0_42,l_0_43 in pairs(l_0_8[l_0_17]) do
                      local l_0_39 = "FileChain_MainSet:"
                      -- DECOMPILER ERROR at PC229: Confused about usage of register: R32 in 'UnsetPending'

                      do
                        local l_0_45, l_0_46, l_0_47 = , (string.find)((sigattr_tail[R32_PC229]).utf8p1, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC241: Confused about usage of register: R33 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC243: Confused about usage of register: R34 in 'UnsetPending'

                        local l_0_48 = nil
                        -- DECOMPILER ERROR at PC251: Confused about usage of register: R34 in 'UnsetPending'

                        do
                          if (string.find)(l_0_45, ".", l_0_46, true) ~= nil then
                            local l_0_49 = nil
                            l_0_39 = l_0_39 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_48, l_0_46 + 1, (string.find)(l_0_45, ".", l_0_46, true) - 1), 0, #(string.sub)(l_0_48, l_0_46 + 1, (string.find)(l_0_45, ".", l_0_46, true) - 1))
                            l_0_39 = l_0_39 .. ";" .. (string.sub)(l_0_48, (string.find)(l_0_45, ".", l_0_46, true) + 1) .. ";"
                          end
                          l_0_48 = (sigattr_tail[l_0_44]).utf8p2
                          -- DECOMPILER ERROR at PC296: Confused about usage of register: R34 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC297: Confused about usage of register: R35 in 'UnsetPending'

                          do
                            do
                              if (string.find)(l_0_48, ".", (string.find)(l_0_48, "\\[^\\]*$") or 0, true) ~= nil then
                                local l_0_50 = nil
                                l_0_39 = l_0_39 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_48, ((string.find)(l_0_48, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_48, ".", (string.find)(l_0_48, "\\[^\\]*$") or 0, true) - 1), 0, #(string.sub)(l_0_48, ((string.find)(l_0_48, "\\[^\\]*$") or 0) + 1, (string.find)(l_0_48, ".", (string.find)(l_0_48, "\\[^\\]*$") or 0, true) - 1))
                                -- DECOMPILER ERROR at PC313: Confused about usage of register: R35 in 'UnsetPending'

                                l_0_39 = l_0_39 .. ";" .. (string.sub)(l_0_48, (string.find)(l_0_48, ".", (string.find)(l_0_48, "\\[^\\]*$") or 0, true) + 1) .. ";"
                              end
                              ;
                              (table.insert)(l_0_35, (sigattr_tail[l_0_44]).utf8p1)
                              ;
                              (table.insert)(l_0_35, (sigattr_tail[l_0_44]).utf8p2)
                              -- DECOMPILER ERROR at PC331: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC331: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC331: LeaveBlock: unexpected jumping out DO_STMT

                            end
                          end
                        end
                      end
                    end
                    l_0_34.file_list = l_0_35
                    local l_0_51, l_0_52 = , (bm.get_process_relationships)()
                    for l_0_56,l_0_57 in ipairs(l_0_52) do
                      local l_0_53 = nil
                      -- DECOMPILER ERROR at PC341: Confused about usage of register: R34 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC346: Confused about usage of register: R34 in 'UnsetPending'

                      if l_0_50.image_path ~= nil then
                        (bm.add_related_process)(l_0_50.ppid)
                      end
                    end
                    -- DECOMPILER ERROR at PC351: Confused about usage of register: R29 in 'UnsetPending'

                    for l_0_61,l_0_62 in ipairs(l_0_53) do
                      local l_0_58 = nil
                      -- DECOMPILER ERROR at PC354: Confused about usage of register: R34 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC359: Confused about usage of register: R34 in 'UnsetPending'

                      if l_0_50.image_path ~= nil then
                        (bm.add_related_process)(l_0_50.ppid)
                        -- DECOMPILER ERROR at PC362: Confused about usage of register: R34 in 'UnsetPending'

                        TrackPidAndTechniqueBM(l_0_50.ppid, "T1485", "susp_ransomware_childproc_type2")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_51, bm.RelatedStringBMReport)
                    do
                      local l_0_63 = nil
                      ;
                      (bm.add_related_string)("genf_ransom_meta", safeJsonSerialize(l_0_34), bm.RelatedStringBMReport)
                      ;
                      (bm.trigger_sig)("GenericRansomware:Type6", safeJsonSerialize(l_0_34))
                      sms_untrusted_process()
                      ;
                      (bm.add_action)("SmsAsyncScanEvent", 100)
                      TrackPidAndTechniqueBM(l_0_38, "T1486", "susp_ransomware_type6")
                      reportTimingData()
                      reportSessionInformationInclusive()
                      ;
                      (bm.add_related_string)("sigcount_type6", l_0_3, bm.RelatedStringBMReport)
                      do return mp.INFECTED end
                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC416: LeaveBlock: unexpected jumping out IF_STMT

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

