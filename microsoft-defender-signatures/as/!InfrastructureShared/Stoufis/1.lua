-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Stoufis\1.luac 

-- params : ...
-- function num : 0
do
  if Remediation then
    local l_0_0, l_0_1, l_0_2 = Remediation.Threat
  end
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and l_0_0.Resources ~= nil and (Remediation.Threat).Name ~= nil and (Remediation.Threat).Name == "Trojan:Script/Stoufis.A" then
    local l_0_3 = nil
    for l_0_7,l_0_8 in ipairs(l_0_0.Resources) do
      local l_0_4 = nil
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R6 in 'UnsetPending'

      -- DECOMPILER ERROR at PC31: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

      if l_0_9.Schema == "file" and R6_PC25.Path ~= nil and #R6_PC25.Path > 4 then
        local l_0_10 = (string.lower)(normalize_path(R6_PC25.Path))
        if not isnull(GetRollingQueue("UrlFileInStartupTargetA")) then
          for l_0_14 in pairs(GetRollingQueue("UrlFileInStartupTargetA")) do
            local l_0_11 = nil
            -- DECOMPILER ERROR at PC53: Confused about usage of register: R12 in 'UnsetPending'

            -- DECOMPILER ERROR at PC57: Confused about usage of register: R13 in 'UnsetPending'

            if (l_0_11[R12_PC53]).key ~= nil and (l_0_11[R12_PC53]).key == l_0_10 then
              local l_0_16 = nil
              -- DECOMPILER ERROR at PC63: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC67: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC74: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC83: Confused about usage of register: R14 in 'UnsetPending'

              if (l_0_11[l_0_15]).value ~= nil and #(l_0_11[l_0_15]).value > 64 and StringEndsWith((l_0_11[l_0_15]).value, ".url") and (string.find)((l_0_11[l_0_15]).value, "\\windows\\start menu\\programs\\startup\\", 1, true) then
                (sysio.DeleteFile)((l_0_11[l_0_15]).value)
              end
            end
          end
        end
      end
    end
  end
end

