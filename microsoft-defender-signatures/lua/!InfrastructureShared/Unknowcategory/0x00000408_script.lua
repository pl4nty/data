-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000408_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and (string.find)(l_0_0, "-ap \"", 1, true) then
    local l_0_2, l_0_4, l_0_5 = ((string.lower)(l_0_0)):match("-ap \"([^\"]+)\"")
  else
    do
      do
        local l_0_3 = nil
        if (bm.get_current_process_startup_info)() ~= nil and ((bm.get_current_process_startup_info)()).command_line ~= nil then
          l_0_3 = ((string.lower)(((bm.get_current_process_startup_info)()).command_line)):match("-ap \"([^\"]+)\"")
        end
        -- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_3 == nil then
          return mp.CLEAN
        end
        local l_0_6 = nil
        if (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config") == nil or (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config") == "" then
          return mp.CLEAN
        end
        local l_0_7 = nil
        if (MpCommon.GetIisInstallPaths)((MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")) == nil or (MpCommon.GetIisInstallPaths)((MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")) == "" then
          return mp.CLEAN
        end
        local l_0_8 = nil
        local l_0_9 = false
        for l_0_13,l_0_14 in ipairs(l_0_8) do
          local l_0_10 = "["
          -- DECOMPILER ERROR at PC77: Confused about usage of register: R9 in 'UnsetPending'

          if R9_PC77.PoolName ~= nil and R9_PC77.PoolName ~= "" and R9_PC77.Path ~= nil and R9_PC77.Path ~= "" and (string.lower)(R9_PC77.PoolName) == l_0_6 then
            l_0_10 = l_0_10 .. R9_PC77.Path .. "|"
            l_0_9 = true
          end
        end
        local l_0_15, l_0_16 = , nil
        -- DECOMPILER ERROR at PC119: Unhandled construct in 'MakeBoolean' P1

        if (this_sigattrlog[2]).matched and l_0_16 ~= nil then
          (bm.add_related_string)("IIS_InMemoryLoadBlocked", l_0_16, bm.RelatedStringBMReport)
        end
        -- DECOMPILER ERROR at PC128: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC134: Confused about usage of register: R6 in 'UnsetPending'

        if (this_sigattrlog[3]).matched and nil ~= nil then
          (bm.add_related_string)("IIS_InMemoryLoadDHA", nil, bm.RelatedStringBMReport)
        end
        if l_0_9 and l_0_16 then
          l_0_15 = l_0_15 .. "]"
          ;
          (bm.add_related_string)("webshellpaths", l_0_15, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

