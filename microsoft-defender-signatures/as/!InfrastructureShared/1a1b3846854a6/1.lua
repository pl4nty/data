-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a1b3846854a6\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2, l_0_7, l_0_8, l_0_9, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18 = nil, nil, nil, nil, nil
if not (this_sigattrlog[1]).utf8p2 then
  local l_0_3 = nil
  local l_0_4 = nil
  if (tostring((this_sigattrlog[3]).utf8p2 or "")):gsub("[\128-\255]", "") == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC45: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC48: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC49: Confused about usage of register: R3 in 'UnsetPending'

  if (tostring(not (this_sigattrlog[1]).matched or not (this_sigattrlog[3]).matched or "")):gsub("[\128-\255]", "") ~= "" and (tostring(not (this_sigattrlog[1]).matched or not (this_sigattrlog[3]).matched or "")):gsub("[\128-\255]", "") ~= (tostring((this_sigattrlog[3]).utf8p2 or "")):gsub("[\128-\255]", "") then
    if isSimilarPath((tostring((this_sigattrlog[3]).utf8p2 or "")):gsub("[\128-\255]", ""), (tostring(not (this_sigattrlog[1]).matched or not (this_sigattrlog[3]).matched or "")):gsub("[\128-\255]", ""), 80, 4) then
      return mp.CLEAN
    end
    l_0_4 = true
  else
    if (string.find)((this_sigattrlog[3]).utf8p1, "HKCU\\", 1, true) then
      local l_0_5 = "old_value_mismatch" .. "InProcServer32"
      local l_0_6 = nil
      -- DECOMPILER ERROR at PC101: Confused about usage of register: R6 in 'UnsetPending'

      -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

      -- DECOMPILER ERROR at PC105: Confused about usage of register: R6 in 'UnsetPending'

      if (GetRegistryValue((string.gsub)((this_sigattrlog[3]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") and (GetRegistryValue((string.gsub)((this_sigattrlog[3]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") ~= "" and (GetRegistryValue((string.gsub)((this_sigattrlog[3]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") ~= (tostring((this_sigattrlog[3]).utf8p2 or "")):gsub("[\128-\255]", "") then
        l_0_6 = (GetRegistryValue((string.gsub)((this_sigattrlog[3]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "")
        -- DECOMPILER ERROR at PC107: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC108: Confused about usage of register: R6 in 'UnsetPending'

        if isSimilarPath((tostring((this_sigattrlog[3]).utf8p2 or "")):gsub("[\128-\255]", ""), (GetRegistryValue((string.gsub)((this_sigattrlog[3]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", ""), 80, 4) then
          return mp.CLEAN
        end
        l_0_4 = true
        l_0_5 = "hklm_hkcu_mismatch" .. "InProcServer32"
        -- DECOMPILER ERROR at PC128: Overwrote pending register: R0 in 'AssignReg'

      end
    end
  end
  do
    if not (this_sigattrlog[2]).utf8p2 then
      local l_0_10, l_0_19 = l_0_3
      do
        local l_0_11, l_0_20 = , tostring(not (this_sigattrlog[2]).matched or not (this_sigattrlog[4]).matched or "")
        if (tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", "") == "" then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC174: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC177: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_20 ~= "" and l_0_20 ~= (tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", "") then
          if isSimilarPath((tostring((this_sigattrlog[4]).utf8p2 or "")):gsub("[\128-\255]", ""), l_0_20, 80, 4) then
            return mp.CLEAN
          end
          l_0_19 = true
          l_0_11 = "old_value_mismatch" .. "LocalServer32"
          l_0_10 = (string.match)((this_sigattrlog[4]).utf8p1, "({.-})")
        else
          if (string.find)((this_sigattrlog[4]).utf8p1, "HKCU\\", 1, true) then
            local l_0_12 = nil
            local l_0_13 = nil
            -- DECOMPILER ERROR at PC230: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC232: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC234: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC234: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC237: Confused about usage of register: R6 in 'UnsetPending'

            if (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") and (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") ~= "" and (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", "") ~= l_0_12 then
              if isSimilarPath(l_0_12, (GetRegistryValue((string.gsub)((this_sigattrlog[4]).utf8p1, "HKCU\\", "HKLM\\"), "")):gsub("[\128-\255]", ""), 80, 4) then
                return mp.CLEAN
              end
              l_0_19 = true
              l_0_11 = "hklm_hkcu_mismatch" .. "LocalServer32"
              l_0_10 = (string.match)((this_sigattrlog[4]).utf8p1, "({.-})")
            end
          end
        end
        -- DECOMPILER ERROR at PC258: Confused about usage of register: R1 in 'UnsetPending'

        if l_0_19 then
          local l_0_21 = nil
          local l_0_22 = nil
          -- DECOMPILER ERROR at PC269: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC273: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC290: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC303: Confused about usage of register: R3 in 'UnsetPending'

          -- DECOMPILER ERROR at PC311: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC316: Confused about usage of register: R3 in 'UnsetPending'

          -- DECOMPILER ERROR at PC324: Confused about usage of register: R4 in 'UnsetPending'

          if (not (string.match)((string.lower)(l_0_12), "%w:\\.*.exe") and (string.match)((string.lower)(l_0_20), "%w:\\.*.exe")) or (string.match)((string.match)((string.lower)(l_0_12), "%w:\\.*.dll"), "([^\\]+)$") ~= (string.match)((string.match)((string.lower)(l_0_20), "%w:\\.*.dll"), "([^\\]+)$") then
            local l_0_23 = nil
            local l_0_24, l_0_25 = nil
            if pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", ((string.gsub)((string.match)((string.lower)(l_0_12), "%w:\\.*.dll"), "\\", "\\\\")):gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")) and MpCommon.RollingQueueQueryKeyRegex then
              do
                if (MpCommon.RollingQueueQueryKeyRegex).value then
                  local l_0_26 = 0 + 10
                end
                -- DECOMPILER ERROR at PC353: Confused about usage of register: R9 in 'UnsetPending'

                for l_0_30,l_0_31 in ipairs(R11_PC348) do
                  local l_0_27, l_0_28, l_0_29, l_0_30, l_0_31 = , {parents = add_parents(), processname = (bm.get_imagepath)(), reason = l_0_11, appId = l_0_21, From_Value = (string.match)((string.lower)(l_0_20), "%w:\\.*.dll"), To_value = (string.match)((string.lower)(l_0_12), "%w:\\.*.dll"), FileDroppedRecently = true, 
FileInfo = {R11_PC348}
}
                  -- DECOMPILER ERROR at PC358: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(R14_PC358.value, "UnsignedFile", 1, true) then
                    l_0_27 = l_0_27 + 20
                    break
                  end
                end
                do
                  do return mp.CLEAN end
                  -- DECOMPILER ERROR at PC373: Confused about usage of register: R5 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC373: Confused about usage of register: R6 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC373: Confused about usage of register: R6 in 'UnsetPending'

                  l_0_28.Score = l_0_27
                  -- DECOMPILER ERROR at PC374: Confused about usage of register: R5 in 'UnsetPending'

                  if l_0_27 == 0 then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC380: Confused about usage of register: R6 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC380: Overwrote pending register: R11 in 'AssignReg'

                  -- DECOMPILER ERROR at PC384: Confused about usage of register: R6 in 'UnsetPending'

                  do
                    do
                      local l_0_32, l_0_33, l_0_34 = nil
                      ;
                      (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(R11_PC348) or l_0_28.processname or "", bm.RelatedStringBMReport)
                      ;
                      (bm.add_related_file)(l_0_25)
                      do return mp.INFECTED end
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

