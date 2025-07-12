-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\715b3bc953bf2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 150000000
if l_0_1 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = ((bm.get_imagepath)()):lower()
if l_0_3 == nil or l_0_3 == "" or IsExcludedByImagePath(l_0_3) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC36: Overwrote pending register: R4 in 'AssignReg'

if (bm.get_current_process_startup_info)() ~= nil then
  do
    local l_0_4, l_0_5, l_0_11 = ((bm.get_current_process_startup_info)()).ppid
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

    if isParentPackageManager(l_0_4, true) then
      return mp.CLEAN
    end
    for l_0_9 = 1, l_0_0 do
      local l_0_6 = nil
      -- DECOMPILER ERROR at PC51: Confused about usage of register: R8 in 'UnsetPending'

      if (sigattr_tail[R8_PC51]).attribute == 16385 then
        l_0_2[(mp.crc32)(0, ((sigattr_tail[R8_PC51]).utf8p1):lower(), 1, #((sigattr_tail[R8_PC51]).utf8p1):lower())] = 1
      end
    end
    local l_0_12 = nil
    local l_0_13 = {}
    for l_0_17 = 1, l_0_0 do
      local l_0_14 = {}
      if (sigattr_tail[(mp.crc32)(0, ((sigattr_tail[R8_PC51]).utf8p1):lower(), 1, #((sigattr_tail[R8_PC51]).utf8p1):lower())]).attribute == 16386 then
        local l_0_19 = ((sigattr_tail[(mp.crc32)(0, ((sigattr_tail[R8_PC51]).utf8p1):lower(), 1, #((sigattr_tail[R8_PC51]).utf8p1):lower())]).utf8p2):lower()
        local l_0_20 = ((sigattr_tail[l_0_18]).utf8p1):lower()
        local l_0_21 = (mp.crc32)(0, l_0_19, 1, #l_0_19)
        if (l_0_2[(mp.crc32)(0, l_0_20, 1, #l_0_20)] ~= nil or l_0_2[l_0_21] ~= nil) and l_0_14[l_0_21] == nil then
          local l_0_22 = nil
          if l_0_19:match("%.[^/%.]+$") ~= nil and (mp.GetExtensionClass)(l_0_19:match("%.[^/%.]+$")) ~= 3 and #l_0_19 < #l_0_20 and l_0_20:find(l_0_19, 1, true) == 1 and l_0_20:byte(#l_0_19 + 1) == 46 and l_0_20:byte(#l_0_19 + 1) ~= 58 then
            l_0_14[l_0_21] = 1
            local l_0_23 = nil
            if l_0_20:match("%.[^/%.]+$") ~= nil and (mp.GetExtensionClass)(l_0_20:match("%.[^/%.]+$")) ~= 4 and IsExcludedByImagePathFileExtension(l_0_3, l_0_20:match("%.[^/%.]+$")) == false and IsExcludedByImagePathFileExtensionRegEx(l_0_3, l_0_20:match("%.[^/%.]+$")) == false and IsExcludedByImagePathFileExtensionSuffix(l_0_3, l_0_20:match("%.[^/%.]+$")) == false and IsExtensionDatePattern(l_0_20:match("%.[^/%.]+$")) == false then
              local l_0_24 = nil
              if l_0_13[(string.sub)(l_0_20, #l_0_19 + 1)] ~= nil then
                (table.insert)(l_0_13[(string.sub)(l_0_20, #l_0_19 + 1)], l_0_18)
                if #l_0_13[(string.sub)(l_0_20, #l_0_19 + 1)] >= 10 then
                  (bm.add_related_string)("ransom_extension", (string.sub)(l_0_20, #l_0_19 + 1), bm.RelatedStringBMReport)
                  local l_0_25 = nil
                  local l_0_26 = "genj_linux_ransom_meta"
                  AppendToRollingQueue(l_0_26, "cur_image_path", l_0_3)
                  AppendToRollingQueue(l_0_26, "proc_info", l_0_12)
                  AppendToRollingQueue(l_0_26, "appended_ext", l_0_25)
                  for l_0_30,l_0_31 in pairs(l_0_13[l_0_25]) do
                    local l_0_27 = {}
                    -- DECOMPILER ERROR at PC231: Confused about usage of register: R24 in 'UnsetPending'

                    ;
                    (bm.add_related_file)((sigattr_tail[R24_PC231]).utf8p1)
                    ;
                    (table.insert)(l_0_27, (sigattr_tail[R24_PC231]).utf8p1)
                  end
                  -- DECOMPILER ERROR at PC245: Confused about usage of register: R19 in 'UnsetPending'

                  local l_0_32 = nil
                  AppendToRollingQueue(l_0_26, "renamed_file_path", (table.concat)(l_0_27, ","))
                  ;
                  (bm.add_related_string)("file_metadata", (table.concat)(l_0_27, ","), bm.RelatedStringBMReport)
                  addRelatedProcess()
                  reportRelatedBmHits()
                  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
                  return mp.INFECTED
                end
              else
                do
                  do
                    local l_0_33 = nil
                    l_0_13[l_0_33] = {l_0_18}
                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC277: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
    return mp.CLEAN
  end
end

