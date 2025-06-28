-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b3f8cc2c39\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 0
local l_0_1 = {}
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched then
  local l_0_2 = (this_sigattrlog[1]).utf8p2
  local l_0_3 = (this_sigattrlog[2]).utf8p2
  if not l_0_3 then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  l_0_3 = (string.lower)(l_0_3)
  if l_0_3 == l_0_2 or l_0_3 == "" then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "script:", 1, true) then
    l_0_0 = l_0_0 + 30
    l_0_1.new_value = l_0_3
    l_0_1.old_value = l_0_2
  else
    if isSimilarPath(l_0_3, l_0_2, 80, 3) then
      return mp.CLEAN
    else
      do
        if not (string.match)(l_0_3, "%w:\\.*.exe") then
          local l_0_4, l_0_5, l_0_6, l_0_8, l_0_9, l_0_11, l_0_12 = (string.match)(l_0_3, "%w:\\.*.dll")
        end
        do
          if not (string.match)(l_0_2, "%w:\\.*.exe") then
            local l_0_7, l_0_10, l_0_13 = , (string.match)(l_0_2, "%w:\\.*.dll")
          end
          -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

          l_0_1.new_value = l_0_7
          -- DECOMPILER ERROR at PC90: Confused about usage of register: R5 in 'UnsetPending'

          l_0_1.old_value = l_0_10
          -- DECOMPILER ERROR at PC93: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC95: Confused about usage of register: R5 in 'UnsetPending'

          -- DECOMPILER ERROR at PC99: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC104: Confused about usage of register: R5 in 'UnsetPending'

          if l_0_2 ~= "" and l_0_7 and l_0_10 and (string.match)(l_0_7, "([^\\]+)$") ~= (string.match)(l_0_10, "([^\\]+)$") then
            l_0_0 = l_0_0 + 10
          end
          -- DECOMPILER ERROR at PC112: Confused about usage of register: R4 in 'UnsetPending'

          local l_0_14 = nil
          local l_0_15, l_0_16 = nil
          if pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", ((string.gsub)(l_0_7, "\\", "\\\\")):gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")) and MpCommon.RollingQueueQueryKeyRegex then
            do
              do
                if (MpCommon.RollingQueueQueryKeyRegex).value then
                  local l_0_17 = nil
                end
                l_0_1.FileInfo = {R10_PC136}
                -- DECOMPILER ERROR at PC141: Confused about usage of register: R8 in 'UnsetPending'

                for l_0_21,l_0_22 in ipairs(R10_PC136) do
                  local l_0_18, l_0_19 = nil
                  -- DECOMPILER ERROR at PC146: Confused about usage of register: R13 in 'UnsetPending'

                  if (string.find)(R13_PC146.value, "UnsignedFile", 1, true) then
                    if (string.match)(R13_PC146.value, "Process_Img(.*)") then
                      local l_0_25 = nil
                      local l_0_26 = contains
                      l_0_26 = l_0_26((string.match)(R13_PC146.value, "Process_Img(.*)"), {"explorer.exe", "WinRAR.exe", "7z.exe"})
                      if l_0_26 then
                        l_0_0 = l_0_0 + 20
                      end
                    end
                    do
                      do
                        -- DECOMPILER ERROR at PC174: Confused about usage of register: R13 in 'UnsetPending'

                        if (MpCommon.StringRegExpSearch)("\\\\(desktop|download|onedrive|document|picture)", l_0_24.key) then
                          l_0_0 = l_0_0 + 50
                        end
                        -- DECOMPILER ERROR at PC181: Confused about usage of register: R13 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC190: Confused about usage of register: R13 in 'UnsetPending'

                        if (string.find)(l_0_24.value, "FileAttributes", 1, true) then
                          local l_0_27 = nil
                          for l_0_31 in (string.gmatch)((string.match)(l_0_24.value, "%[(.*)%]"), "([^|]+)") do
                            local l_0_28, l_0_29 = nil
                            -- DECOMPILER ERROR at PC201: Confused about usage of register: R19 in 'UnsetPending'

                            if not (string.find)(true, "Aurora.A!rfn", 1, true) then
                              l_0_0 = l_0_0 + 5
                            end
                            -- DECOMPILER ERROR at PC209: Confused about usage of register: R19 in 'UnsetPending'

                            if true == "SLF:HighRiskHasMotW" then
                              l_0_0 = l_0_0 + 100
                            end
                          end
                        end
                        do break end
                        -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
                do return mp.CLEAN end
                if (string.find)((this_sigattrlog[2]).utf8p1, "HKCU\\", 1, true) then
                  local l_0_32 = (string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\")
                  do
                    local l_0_33 = GetRegistryValue(l_0_32, "") or ""
                    -- DECOMPILER ERROR at PC249: Confused about usage of register: R5 in 'UnsetPending'

                    do
                      local l_0_34 = (string.lower)(l_0_33)
                      if l_0_34 ~= l_0_3 and not isSimilarPath(l_0_3, l_0_34, 80, 3) then
                        l_0_0 = l_0_0 + 10
                        l_0_1.hklm_value = l_0_34
                      end
                      if l_0_0 > 15 then
                        l_0_1.score = l_0_0
                        local l_0_35 = safeJsonSerialize(l_0_1)
                        ;
                        (bm.add_related_string)("AdditionalInfo", l_0_35, bm.RelatedStringBMReport)
                        ;
                        (bm.add_related_file)(l_0_1.new_value)
                        return mp.INFECTED
                      end
                      do
                        return mp.CLEAN
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

