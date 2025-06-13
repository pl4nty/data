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
    l_0_0 = l_0_0 + 10
  else
    if isSimilarPath(l_0_3, l_0_2, 80, 3) then
      return mp.CLEAN
    else
      do
        if not (string.match)(l_0_3, "%w:\\.*.exe") then
          local l_0_4, l_0_5, l_0_7, l_0_8 = (string.match)(l_0_3, "%w:\\.*.dll")
        end
        do
          if not (string.match)(l_0_2, "%w:\\.*.exe") then
            local l_0_6, l_0_9 = , (string.match)(l_0_2, "%w:\\.*.dll")
          end
          -- DECOMPILER ERROR at PC87: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC89: Confused about usage of register: R5 in 'UnsetPending'

          -- DECOMPILER ERROR at PC93: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC98: Confused about usage of register: R5 in 'UnsetPending'

          if l_0_6 and l_0_9 and (string.match)(l_0_6, "([^\\]+)$") ~= (string.match)(l_0_9, "([^\\]+)$") then
            l_0_0 = l_0_0 + 10
          end
          -- DECOMPILER ERROR at PC106: Confused about usage of register: R4 in 'UnsetPending'

          local l_0_10 = nil
          local l_0_11, l_0_12 = nil
          if pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", ((string.gsub)(l_0_6, "\\", "\\\\")):gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")) and MpCommon.RollingQueueQueryKeyRegex then
            do
              if (MpCommon.RollingQueueQueryKeyRegex).value then
                local l_0_13 = nil
              end
              l_0_1.FileInfo = {R10_PC130}
              -- DECOMPILER ERROR at PC135: Confused about usage of register: R8 in 'UnsetPending'

              for l_0_17,l_0_18 in ipairs(R10_PC130) do
                local l_0_14, l_0_15 = nil
                -- DECOMPILER ERROR at PC140: Confused about usage of register: R13 in 'UnsetPending'

                if (string.find)(R13_PC140.value, "UnsignedFile", 1, true) then
                  l_0_0 = l_0_0 + 20
                  break
                end
              end
              do
                do
                  do return mp.CLEAN end
                  if (string.find)((this_sigattrlog[2]).utf8p1, "HKCU\\", 1, true) then
                    local l_0_19 = (string.gsub)((this_sigattrlog[2]).utf8p1, "HKCU\\", "HKLM\\")
                    do
                      local l_0_20 = GetRegistryValue(l_0_19, "") or ""
                      -- DECOMPILER ERROR at PC183: Confused about usage of register: R5 in 'UnsetPending'

                      do
                        local l_0_21 = (string.lower)(l_0_20)
                        if l_0_21 ~= l_0_3 then
                          l_0_0 = l_0_0 + 10
                          l_0_1.hklm_value = l_0_21
                        end
                        if l_0_0 > 0 then
                          l_0_1.new_value = l_0_3
                          l_0_1.old_value = l_0_2
                          l_0_1.score = l_0_0
                          local l_0_22 = safeJsonSerialize(l_0_1)
                          ;
                          (bm.add_related_string)("AdditionalInfo", l_0_22, bm.RelatedStringBMReport)
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
end

