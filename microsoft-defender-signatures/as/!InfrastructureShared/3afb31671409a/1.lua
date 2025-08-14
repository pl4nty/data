-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3afb31671409a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = 0
local l_0_9 = {}
local l_0_10 = (bm.get_sig_count)()
for l_0_14 = 1, l_0_0 do
  local l_0_15 = (sigattr_tail[l_0_14]).attribute
  if l_0_15 == 16384 then
    local l_0_16 = ((sigattr_tail[l_0_14]).utf8p1):lower()
    local l_0_17 = l_0_16:match("%.[^%.]+$")
    if l_0_17 ~= nil and ((mp.GetExtensionClass)(l_0_17) ~= 4 or isKnownRansomExtension(l_0_17)) then
      local l_0_18 = (mp.crc32)(0, l_0_16, 1, #l_0_16)
      if l_0_1[l_0_18] ~= nil then
        (table.insert)(l_0_1[l_0_18], l_0_14)
      else
        local l_0_19 = {}
        -- DECOMPILER ERROR at PC62: No list found for R19 , SetList fails

      end
    end
  end
end
if l_0_8 < 5 then
  return mp.CLEAN
end
for l_0_23 = 1, l_0_0 do
  local l_0_24 = (sigattr_tail[l_0_23]).attribute
  if l_0_24 == 16389 and (sigattr_tail[l_0_23]).utf8p2 == "ATTR_c09458eb" then
    local l_0_25 = ((sigattr_tail[l_0_23]).utf8p1):lower()
    -- DECOMPILER ERROR at PC94: Overwrote pending register: R20 in 'AssignReg'

    local l_0_26 = (mp.crc32)(0, l_0_25, l_0_14, #l_0_25)
    if l_0_3[l_0_26] ~= nil then
      (table.insert)(l_0_3[l_0_26], l_0_23)
    else
      local l_0_27 = {}
      -- DECOMPILER ERROR at PC108: No list found for R18 , SetList fails

    end
    do
      -- DECOMPILER ERROR at PC115: Overwrote pending register: R19 in 'AssignReg'

      do
        if not (string.find)(l_0_23, "\\[^\\]*$") then
          local l_0_28, l_0_29, l_0_30 = l_0_1[l_0_26] == nil or 0
        end
        -- DECOMPILER ERROR at PC125: Confused about usage of register: R18 in 'UnsetPending'

        local l_0_31 = nil
        if (string.find)(l_0_25, ".", l_0_28, true) ~= nil then
          local l_0_32 = nil
          if (string.sub)(l_0_25, l_0_31 + 1, (string.find)(l_0_25, ".", l_0_28, true) - 1) ~= nil then
            if l_0_4[(string.sub)(l_0_25, l_0_31 + 1, (string.find)(l_0_25, ".", l_0_28, true) - 1)] == nil then
              local l_0_33 = nil
              l_0_4[l_0_33] = {l_0_26, l_0_23}
            else
              do
                do
                  -- DECOMPILER ERROR at PC149: Confused about usage of register: R20 in 'UnsetPending'

                  ;
                  (table.insert)(l_0_4[l_0_33], l_0_23)
                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
end
-- DECOMPILER ERROR at PC153: Overwrote pending register: R8 in 'AssignReg'

local l_0_34 = {}
for l_0_38 = 1, l_0_0 do
  local l_0_39 = (sigattr_tail[l_0_38]).attribute
  if l_0_39 == 16387 then
    local l_0_40 = ((sigattr_tail[l_0_38]).utf8p1):lower()
    local l_0_41 = (mp.crc32)(0, l_0_40, 1, #l_0_40)
    if l_0_1[l_0_41] == nil then
      (table.insert)(l_0_2, l_0_38)
    else
      l_0_3[l_0_41] = nil
    end
    -- DECOMPILER ERROR at PC189: Overwrote pending register: R8 in 'AssignReg'

    if l_0_34[l_0_41] == nil then
      l_0_34[l_0_41] = 1
    end
  end
end
if l_0_8 < 5 then
  return mp.CLEAN
end
for l_0_45,l_0_46 in pairs(l_0_2) do
  local l_0_47 = ((sigattr_tail[l_0_46]).utf8p1):lower()
  do
    local l_0_48, l_0_49, l_0_50, l_0_51 = (string.find)(l_0_47, "\\[^\\]*$") or 0
    -- DECOMPILER ERROR at PC218: Confused about usage of register: R18 in 'UnsetPending'

    local l_0_52 = nil
    if (string.find)(l_0_47, ".", l_0_48, true) ~= nil then
      local l_0_53 = nil
      local l_0_54 = (string.sub)(l_0_47, l_0_52 + 1, -1)
      local l_0_55 = ((string.sub)(l_0_47, l_0_52 + 1, l_0_53 - 1))
      -- DECOMPILER ERROR at PC241: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC250: Confused about usage of register: R22 in 'UnsetPending'

      if (l_0_54 == nil or l_0_55 ~= nil) and nil ~= nil and (mp.bitand)((mp.GetExtensionClass)(nil), 3) ~= 0 and l_0_4[l_0_55] ~= nil then
        local l_0_56 = nil
        -- DECOMPILER ERROR at PC265: Confused about usage of register: R23 in 'UnsetPending'

        if l_0_3[(l_0_4[l_0_55])[1]] ~= nil then
          local l_0_57 = nil
          if (l_0_1[l_0_57] == nil or not (l_0_1[l_0_57])[1] or #l_0_47 < #((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower()) and (((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower()):find(l_0_47, 1, true) == 1 and (((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower()):byte(#l_0_47 + 1) ~= 58 then
            local l_0_58 = nil
            -- DECOMPILER ERROR at PC310: Unhandled construct in 'MakeBoolean' P1

            if l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower(), #l_0_47 + 1)] ~= nil and l_0_6[l_0_57] == nil then
              l_0_6[l_0_57] = 1
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower(), #l_0_47 + 1)], (l_0_3[l_0_57])[1])
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower(), #l_0_47 + 1)], l_0_46)
              if #l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_55])[1]])[1]]).utf8p1):lower(), #l_0_47 + 1)] >= 10 then
                local l_0_59 = nil
                local l_0_60 = false
                for l_0_64,l_0_65 in pairs(l_0_5[l_0_59]) do
                  local l_0_61 = {count = 0}
                  -- DECOMPILER ERROR at PC336: Confused about usage of register: R32 in 'UnsetPending'

                  if (sysio.ReadFile)((sigattr_tail[R32_PC336]).utf8p1, 0, 4) ~= nil and l_0_61[(sysio.ReadFile)((sigattr_tail[R32_PC336]).utf8p1, 0, 4)] == nil then
                    l_0_61[(sysio.ReadFile)((sigattr_tail[R32_PC336]).utf8p1, 0, 4)] = 1
                    l_0_61.count = l_0_61.count + 1
                  end
                end
                -- DECOMPILER ERROR at PC352: Confused about usage of register: R27 in 'UnsetPending'

                if l_0_61.count > 4 then
                  l_0_60 = true
                end
                ;
                (bm.add_related_string)("magic_mismatch", tostring(l_0_60), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_59, bm.RelatedStringBMReport)
                local l_0_67 = nil
                local l_0_68 = {}
                local l_0_69 = {}
                local l_0_70 = {}
                -- DECOMPILER ERROR at PC395: Overwrote pending register: R32 in 'AssignReg'

                if not isnull((bm.get_imagepath)()) or (bm.get_current_process_startup_info)() ~= nil then
                  do
                    local l_0_71 = ("NA"):lower()
                    -- DECOMPILER ERROR at PC396: Confused about usage of register: R31 in 'UnsetPending'

                    l_0_68.proc_info = ((bm.get_current_process_startup_info)()).ppid
                    l_0_68.appended_ext = l_0_59
                    l_0_68.magic_mismatch = l_0_60
                    l_0_68.sig_count = l_0_10
                    l_0_68.debug_data = l_0_9
                    local l_0_72 = nil
                    for l_0_76,l_0_77 in pairs(l_0_5[l_0_59]) do
                      local l_0_73, l_0_74 = , "FileChain_MainSet:"
                      -- DECOMPILER ERROR at PC408: Confused about usage of register: R38 in 'UnsetPending'

                      do
                        local l_0_80, l_0_81 = , (string.find)((sigattr_tail[R38_PC408]).utf8p1, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC420: Confused about usage of register: R39 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC422: Confused about usage of register: R40 in 'UnsetPending'

                        local l_0_82 = nil
                        -- DECOMPILER ERROR at PC429: Confused about usage of register: R39 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC430: Confused about usage of register: R40 in 'UnsetPending'

                        do
                          if (string.find)(l_0_80, ".", l_0_81, true) ~= nil then
                            local l_0_83 = nil
                            l_0_74 = l_0_74 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_80, l_0_81 + 1, (string.find)(l_0_80, ".", l_0_81, true) - 1), 0, #(string.sub)(l_0_80, l_0_81 + 1, (string.find)(l_0_80, ".", l_0_81, true) - 1))
                            l_0_74 = l_0_74 .. ";" .. (string.sub)(l_0_83, (string.find)(l_0_80, ".", l_0_81, true) + 1) .. ";"
                          end
                          ;
                          (table.insert)(l_0_69, (sigattr_tail[l_0_82]).utf8p1)
                          local l_0_84 = nil
                          if l_0_7[l_0_82] ~= nil then
                            if sigattr_tail[l_0_7[l_0_82]] ~= nil then
                              local l_0_85 = nil
                              local l_0_86 = nil
                              -- DECOMPILER ERROR at PC484: Overwrote pending register: R42 in 'AssignReg'

                              if nil == nil then
                                do
                                  (table.insert)(l_0_70, ((sigattr_tail[l_0_7[l_0_82]]).utf8p1):lower())
                                  ;
                                  (table.insert)(l_0_70, -1)
                                  if sigattr_tail[l_0_82] ~= nil then
                                    local l_0_87 = nil
                                    local l_0_88 = nil
                                    if (string.match)(((sigattr_tail[l_0_82]).utf8p2):lower(), "fsize:(%d+)") == nil then
                                      do
                                        (table.insert)(l_0_70, ((sigattr_tail[l_0_82]).utf8p1):lower())
                                        ;
                                        (table.insert)(l_0_70, -1)
                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC531: LeaveBlock: unexpected jumping out DO_STMT

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
                    l_0_68.file_list = l_0_69
                    l_0_68.file_size = l_0_70
                    local l_0_89, l_0_90 = nil
                    for l_0_94,l_0_95 in ipairs((bm.get_process_relationships)()) do
                      local l_0_91, l_0_92 = nil
                      -- DECOMPILER ERROR at PC542: Confused about usage of register: R40 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC547: Confused about usage of register: R40 in 'UnsetPending'

                      if l_0_87.image_path ~= nil then
                        (bm.add_related_process)(l_0_87.ppid)
                      end
                    end
                    -- DECOMPILER ERROR at PC552: Confused about usage of register: R35 in 'UnsetPending'

                    for l_0_99,l_0_100 in ipairs(l_0_92) do
                      local l_0_96, l_0_97 = nil
                      -- DECOMPILER ERROR at PC555: Confused about usage of register: R40 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC560: Confused about usage of register: R40 in 'UnsetPending'

                      if l_0_87.image_path ~= nil then
                        (bm.add_related_process)(l_0_87.ppid)
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_90, bm.RelatedStringBMReport)
                    do
                      local l_0_101 = nil
                      ;
                      (bm.add_related_string)("gend_ransom_meta", safeJsonSerialize(l_0_68), bm.RelatedStringBMReport)
                      ;
                      (bm.add_related_string)("sigcount_type4", l_0_10, bm.RelatedStringBMReport)
                      do return mp.INFECTED end
                      do
                        local l_0_102 = nil
                        l_0_5[l_0_102] = {(l_0_3[l_0_57])[1], l_0_46}
                        l_0_6[l_0_57] = 1
                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out DO_STMT

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

