-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3e4890374\1_luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
local l_0_2 = false
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = false
  l_0_2 = true
else
  do
    -- DECOMPILER ERROR at PC29: Overwrote pending register: R0 in 'AssignReg'

    if not (this_sigattrlog[1]).matched or not (this_sigattrlog[1]).utf8p2 or not l_0_1 then
      return mp.CLEAN
    end
    local l_0_3 = true
    if not safeJsonDeserialize(l_0_1) then
      return mp.CLEAN
    end
    do
      local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11 = , (safeJsonDeserialize(l_0_1)).appended_ext or nil
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R4 in 'UnsetPending'

      if not l_0_5 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC53: Confused about usage of register: R4 in 'UnsetPending'

      if l_0_5 == "" then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

      if not StringStartsWith(l_0_5, ".") then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC69: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC74: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC80: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC87: Confused about usage of register: R4 in 'UnsetPending'

      if (string.len)(l_0_5) < 4 or IsExtensionDatePattern(l_0_5) == true or (string.match)(l_0_5, "%d+.%d+.%d+") or (string.match)(l_0_5, "%.%w+%.%w+$") then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R4 in 'UnsetPending'

      if (mp.bitand)((mp.GetExtensionClass)(l_0_5), 3) ~= 0 then
        return mp.CLEAN
      end
      local l_0_12 = nil
      local l_0_13 = nil
      local l_0_14 = mp.SIGATTR_LOG_SZ
      for l_0_18 = 1, l_0_14 do
        local l_0_15, l_0_16 = {}, {}
        -- DECOMPILER ERROR at PC119: Confused about usage of register: R11 in 'UnsetPending'

        if l_0_3 then
          do
            if sigattr_tail[R11_PC119] and (sigattr_tail[R11_PC119]).attribute == 16385 and StringEndsWith(((sigattr_tail[R11_PC119]).utf8p1):lower(), l_0_13) then
              (table.insert)(l_0_15, ((sigattr_tail[R11_PC119]).utf8p1):lower())
            end
            do
              if sigattr_head[R11_PC119] and (sigattr_head[R11_PC119]).attribute == 16385 then
                local l_0_20 = nil
                if StringEndsWith(((sigattr_head[R11_PC119]).utf8p1):lower(), l_0_13) then
                  (table.insert)(l_0_15, ((sigattr_head[R11_PC119]).utf8p1):lower())
                end
              end
              if l_0_2 then
                do
                  if sigattr_tail[R11_PC119] then
                    local l_0_21 = nil
                  end
                  -- DECOMPILER ERROR at PC180: Confused about usage of register: R11 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC185: Confused about usage of register: R11 in 'UnsetPending'

                  do
                    if (sigattr_tail[R11_PC119]).attribute == 16389 and (sigattr_tail[l_0_23]).utf8p2 == "ATTR_c09458eb" then
                      local l_0_22 = nil
                      if StringEndsWith(((sigattr_tail[l_0_23]).utf8p1):lower(), l_0_13) then
                        (table.insert)(l_0_15, ((sigattr_tail[l_0_23]).utf8p1):lower())
                      end
                    end
                    -- DECOMPILER ERROR at PC201: Confused about usage of register: R11 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC205: Confused about usage of register: R11 in 'UnsetPending'

                    do
                      if sigattr_head[l_0_23] then
                        local l_0_24 = nil
                      end
                      -- DECOMPILER ERROR at PC210: Confused about usage of register: R11 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC215: Confused about usage of register: R11 in 'UnsetPending'

                      do
                        if (sigattr_head[l_0_23]).attribute == 16389 and (sigattr_head[l_0_23]).utf8p2 == "ATTR_c09458eb" then
                          local l_0_25 = nil
                          if StringEndsWith(((sigattr_head[l_0_23]).utf8p1):lower(), l_0_13) then
                            (table.insert)(l_0_15, ((sigattr_head[l_0_23]).utf8p1):lower())
                          end
                        end
                        if next(l_0_15) == nil then
                          return mp.CLEAN
                        end
                        l_0_15 = table_dedup(l_0_15)
                        if #l_0_15 > 30 then
                          for l_0_29,l_0_30 in ipairs(l_0_15) do
                            local l_0_26, l_0_27 = nil
                            -- DECOMPILER ERROR at PC249: Confused about usage of register: R16 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC252: Confused about usage of register: R16 in 'UnsetPending'

                            if isnull(l_0_15:match("([^\\]+)$")) and isnull(l_0_15:match("(.*)\\[^\\]+$")) then
                              return mp.CLEAN
                            end
                            ;
                            (table.insert)(l_0_16, l_0_15:match("(.*)\\[^\\]+$"))
                          end
                          if next(l_0_16) == nil then
                            return mp.CLEAN
                          end
                          l_0_16 = table_dedup(l_0_16)
                          if #l_0_16 > 3 then
                            (bm.add_related_string)("encryptedFiles_count", tostring(#l_0_15), bm.RelatedStringBMReport)
                            ;
                            (bm.add_related_string)("ransom_meta", l_0_1, bm.RelatedStringBMReport)
                            local l_0_33 = nil
                            local l_0_34 = nil
                            local l_0_35 = "RanAggrCount"
                            -- DECOMPILER ERROR at PC316: Overwrote pending register: R13 in 'AssignReg'

                            -- DECOMPILER ERROR at PC326: Confused about usage of register: R13 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC335: Confused about usage of register: R13 in 'UnsetPending'

                            if (not (bm.get_current_process_startup_info)() or not ((bm.get_current_process_startup_info)()).ppid or not (MpCommon.DoesProcessHaveAttribute)(0, l_0_35)) and not (MpCommon.DoesProcessHaveAttribute)(0, "inherit:" .. l_0_35) then
                              (MpCommon.AddProcessAttribute)(0, l_0_35, l_0_1, false)
                            end
                            return mp.INFECTED
                          end
                        end
                        do
                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_STMT

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
    end
  end
end

