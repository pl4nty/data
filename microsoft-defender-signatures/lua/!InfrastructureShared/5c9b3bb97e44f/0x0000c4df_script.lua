-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5c9b3bb97e44f\0x0000c4df_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 5
local l_0_3 = {}
local l_0_4 = 0
for l_0_8 = 1, l_0_0 do
  local l_0_9 = (sigattr_tail[l_0_8]).utf8p2
  if (sigattr_tail[l_0_8]).attribute == 16385 and (string.len)((sigattr_tail[l_0_8]).utf8p1) > 5 and ((sigattr_tail[l_0_8]).utf8p1):byte(1) ~= 37 and l_0_9:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_10 = ((sigattr_tail[l_0_8]).utf8p1):lower()
    local l_0_11 = l_0_10:match("%.[^%.]+$")
    if l_0_11 ~= nil then
      local l_0_12 = (mp.crc32)(0, l_0_10, 1, #l_0_10)
      local l_0_13 = {}
      if l_0_1[l_0_12] == nil then
        l_0_1[l_0_12] = l_0_8
        for l_0_17,l_0_18 in (string.gmatch)(l_0_9, "(%w+):(%w+)") do
          l_0_13[l_0_17] = l_0_18
        end
        do
          do
            local l_0_19, l_0_24, l_0_26, l_0_30, l_0_31, l_0_32, l_0_39 = l_0_13.TotalSizeAppend and tonumber(l_0_13.TotalSizeAppend) or 0
            -- DECOMPILER ERROR at PC81: Confused about usage of register: R14 in 'UnsetPending'

            if l_0_19 > 16 then
              return mp.CLEAN
            end
            do
              local l_0_20, l_0_25, l_0_27, l_0_33, l_0_40 = , l_0_13.LastOff and tonumber(l_0_13.LastOff) or 0
              do
                local l_0_21, l_0_28, l_0_34, l_0_41 = , l_0_13.FirstOff and tonumber(l_0_13.FirstOff) or 0
                do
                  local l_0_22, l_0_29, l_0_35, l_0_42 = , l_0_13.NumWrites and tonumber(l_0_13.NumWrites) or 0
                  do
                    local l_0_23, l_0_36, l_0_43 = nil
                    do
                      local l_0_37, l_0_44 = nil
                      do
                        do
                          local l_0_38, l_0_45 = nil
                          -- DECOMPILER ERROR at PC142: Confused about usage of register: R16 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC146: Confused about usage of register: R15 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC146: Confused about usage of register: R18 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC148: Confused about usage of register: R15 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC151: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC153: Confused about usage of register: R14 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC155: Confused about usage of register: R14 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC157: Confused about usage of register: R20 in 'UnsetPending'

                          if l_0_13.BiggestOff and tonumber(l_0_13.BiggestOff) or 0 ~= 0 and l_0_43 == 0 and l_0_13.SmallestOff and tonumber(l_0_13.SmallestOff) or 0 == 0 and l_0_13.BiggestOff and tonumber(l_0_13.BiggestOff) or 0 == l_0_45 and l_0_45 + 1 == l_0_13.TotalSizeWrite and tonumber(l_0_13.TotalSizeWrite) or 0 and l_0_42 > 0 and l_0_38 > 0 and l_0_38 < 16 and (l_0_13.TotalSizeWrite and tonumber(l_0_13.TotalSizeWrite) or 0) % 16 == 0 then
                            l_0_13.path = (sigattr_tail[l_0_8]).utf8p1
                            l_0_3[l_0_8] = l_0_13
                            l_0_4 = l_0_4 + 1
                          end
                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

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
local l_0_46 = {}
do
  local l_0_47 = {}
  if l_0_2 <= l_0_4 then
    for l_0_51,l_0_52 in pairs(l_0_3) do
      local l_0_53 = false
      for l_0_57 = 1, l_0_0 do
        if (sigattr_tail[l_0_57]).attribute == 16386 and (sigattr_tail[l_0_57]).utf8p2 == (sigattr_tail[l_0_51]).utf8p1 then
          local l_0_58 = ((sigattr_tail[l_0_57]).utf8p1):lower()
          local l_0_59 = ((sigattr_tail[l_0_57]).utf8p2):lower()
          local l_0_60 = (l_0_58:match("(.*[/\\])")):lower()
          local l_0_61 = (l_0_59:match("(.*[/\\])")):lower()
          if l_0_60 == l_0_61 and l_0_58:byte(#l_0_59 + 1) ~= 58 then
            local l_0_62 = (l_0_58:match("(.+)%..+")):lower()
            local l_0_63 = (l_0_59:match("(.+)%..+")):lower()
            local l_0_64 = l_0_58:match("%.[^%.]+$")
            if l_0_64 and l_0_63 == l_0_62 and (mp.GetExtensionClass)(l_0_64) == 0 then
              if l_0_46[l_0_64] ~= nil then
                (table.insert)(l_0_46[l_0_64], l_0_52)
              else
                local l_0_65 = {}
                -- DECOMPILER ERROR at PC255: No list found for R24 , SetList fails

              end
              do
                do
                  do break end
                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      if l_0_53 == false then
        return mp.CLEAN
      end
    end
    for l_0_69,l_0_70 in pairs(l_0_46) do
      -- DECOMPILER ERROR at PC271: Overwrote pending register: R12 in 'AssignReg'

      if #l_0_53 >= 4 then
        local l_0_71 = {}
        for l_0_75 = 1, 4 do
          (table.insert)(l_0_71, (l_0_46[l_0_69])[l_0_75])
        end
        local l_0_76 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
        do
          local l_0_77 = isnull(l_0_76) and (bm.get_current_process_startup_info)() == nil or -1
          -- DECOMPILER ERROR at PC311: Confused about usage of register: R14 in 'UnsetPending'

          do
            local l_0_78 = nil
            ;
            (bm.add_related_string)("gen_ransom_ext_replace", safeJsonSerialize(l_0_47), bm.RelatedStringBMReport)
            ;
            (bm.trigger_sig)("GenericRansomware:ReplaceExtension2", safeJsonSerialize(l_0_47))
            reportTimingData()
            sms_untrusted_process()
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

