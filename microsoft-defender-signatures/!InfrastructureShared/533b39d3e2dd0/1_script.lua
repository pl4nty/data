-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\533b39d3e2dd0\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
for l_0_8 = 1, l_0_0 do
  local l_0_9 = (sigattr_tail[l_0_8]).utf8p2
  if (sigattr_tail[l_0_8]).attribute == 16385 and ((sigattr_tail[l_0_8]).utf8p1):byte(1) ~= 37 and l_0_9:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_10 = ((sigattr_tail[l_0_8]).utf8p1):lower()
    local l_0_11 = l_0_10:match("%.[^%.]+$")
    do
      if l_0_8 <= 5 or not l_0_8 - 5 then
        local l_0_12, l_0_13, l_0_14, l_0_16 = not l_0_11 or (mp.bitand)((mp.GetExtensionClass)(l_0_11), 3) == 0 or 1
      end
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R12 in 'UnsetPending'

      -- DECOMPILER ERROR at PC62: Confused about usage of register: R12 in 'UnsetPending'

      do
        do
          local l_0_15, l_0_17 = , l_0_0 < l_0_12 + 10 and l_0_12 + 10 or l_0_0
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R12 in 'UnsetPending'

          -- DECOMPILER ERROR at PC67: Confused about usage of register: R13 in 'UnsetPending'

          for l_0_21 = l_0_15, l_0_17 do
            local l_0_18, l_0_19 = nil
            -- DECOMPILER ERROR at PC71: Confused about usage of register: R17 in 'UnsetPending'

            if (sigattr_tail[R17_PC71]).attribute == 16525 and (sigattr_tail[l_0_8]).utf8p1 == (sigattr_tail[R17_PC71]).utf8p1 and l_0_1[l_0_10] == nil then
              l_0_1[l_0_10] = l_0_8
              for l_0_26,l_0_27 in (string.gmatch)(l_0_9, "(%w+):(%w+)") do
                local l_0_24 = {}
                -- DECOMPILER ERROR at PC94: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC94: Confused about usage of register: R23 in 'UnsetPending'

                l_0_24[R22_PC94] = R23_PC94
              end
              -- DECOMPILER ERROR at PC97: Confused about usage of register: R18 in 'UnsetPending'

              -- DECOMPILER ERROR at PC101: Confused about usage of register: R18 in 'UnsetPending'

              do
                local l_0_28, l_0_29, l_0_34, l_0_36, l_0_40, l_0_41 = , l_0_24.TotalSizeAppend and tonumber(l_0_24.TotalSizeAppend) or 0
                -- DECOMPILER ERROR at PC106: Confused about usage of register: R19 in 'UnsetPending'

                -- DECOMPILER ERROR at PC108: Confused about usage of register: R19 in 'UnsetPending'

                if l_0_34 > 0 then
                  if l_0_34 > 16 then
                    l_0_4 = l_0_4 + 1
                  end
                  -- DECOMPILER ERROR at PC111: Confused about usage of register: R18 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC115: Confused about usage of register: R18 in 'UnsetPending'

                  do
                    local l_0_30, l_0_35, l_0_37 = nil
                    -- DECOMPILER ERROR at PC120: Confused about usage of register: R18 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC124: Confused about usage of register: R18 in 'UnsetPending'

                    do
                      local l_0_31, l_0_38 = nil
                      -- DECOMPILER ERROR at PC129: Confused about usage of register: R18 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC133: Confused about usage of register: R18 in 'UnsetPending'

                      do
                        local l_0_32, l_0_39 = nil
                        -- DECOMPILER ERROR at PC138: Confused about usage of register: R18 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC142: Confused about usage of register: R18 in 'UnsetPending'

                        do
                          do
                            local l_0_33 = nil
                            -- DECOMPILER ERROR at PC147: Confused about usage of register: R18 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC151: Confused about usage of register: R18 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC156: Confused about usage of register: R18 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC160: Confused about usage of register: R18 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC171: Confused about usage of register: R23 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC173: Confused about usage of register: R20 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC178: Confused about usage of register: R19 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC180: Confused about usage of register: R19 in 'UnsetPending'

                            if l_0_39.BiggestOff and tonumber(l_0_39.BiggestOff) or 0 ~= 0 and l_0_35.FirstOff and tonumber(l_0_35.FirstOff) or 0 == 0 and l_0_39.SmallestOff and tonumber(l_0_39.SmallestOff) or 0 == 0 and l_0_39.BiggestOff and tonumber(l_0_39.BiggestOff) or 0 == l_0_29.LastOff and tonumber(l_0_29.LastOff) or 0 and (l_0_29.LastOff and tonumber(l_0_29.LastOff) or 0) + 1 == l_0_39.TotalSizeWrite and tonumber(l_0_39.TotalSizeWrite) or 0 and l_0_38.NumWrites and tonumber(l_0_38.NumWrites) or 0 > 0 and l_0_37 > 0 and l_0_37 <= 16 then
                              if l_0_3 >= 10 then
                                break
                              else
                                -- DECOMPILER ERROR at PC188: Confused about usage of register: R18 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC188: Confused about usage of register: R18 in 'UnsetPending'

                                if l_0_3 < 10 then
                                  l_0_39.path = l_0_10
                                  -- DECOMPILER ERROR at PC189: Confused about usage of register: R18 in 'UnsetPending'

                                  l_0_2[l_0_8] = l_0_39
                                end
                              end
                              l_0_3 = l_0_3 + 1
                            end
                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
local l_0_42 = {}
local l_0_43 = 0
if l_0_4 == 0 and l_0_3 >= 10 then
  for l_0_47,l_0_48 in pairs(l_0_2) do
    local l_0_49 = (sigattr_tail[l_0_47]).utf8p1
    local l_0_50 = (sysio.GetFileSize)(l_0_49)
    if l_0_50 ~= nil and l_0_50 > 256 then
      local l_0_51 = (sysio.ReadFile)(l_0_49, 0, 256)
      if l_0_51 ~= nil then
        local l_0_52 = (string.format)("\\x%02X\\x%02X\\x%02X\\x%02X", (string.byte)(l_0_51, 1, 4))
        local l_0_53 = (crypto.ComputeEntropy)(l_0_51)
        local l_0_54 = table.insert
        local l_0_55 = l_0_42
        local l_0_56 = {}
        l_0_56.FilePath = l_0_49
        l_0_56.Filesize = l_0_50
        l_0_56.MagicByte = l_0_52
        l_0_56.Entropy = l_0_53
        l_0_56.AppendedSize = tonumber(l_0_48.TotalSizeAppend)
        l_0_56.WriteSize = tonumber(l_0_48.TotalSizeWrite)
        l_0_54(l_0_55, l_0_56)
        l_0_43 = l_0_43 + 1
      end
    end
    do
      if l_0_43 >= 5 then
        local l_0_57 = {}
        l_0_57.gen_ransom_data = l_0_42
        local l_0_58 = safeJsonSerialize(l_0_57)
        ;
        (bm.add_related_string)("genfb_ransom_meta", l_0_58, bm.RelatedStringBMReport)
        ;
        (bm.trigger_sig)("GenericRansomware:FileAppendBucket1:16", l_0_58)
        return mp.INFECTED
      end
      do
        -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end
return mp.CLEAN

