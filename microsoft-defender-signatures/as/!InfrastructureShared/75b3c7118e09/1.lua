-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\75b3c7118e09\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0.DeviceRoles then
    local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = {}
    local l_0_3 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
    do
      local l_0_4, l_0_5, l_0_6 = MpCommon.QuerySessionInformation or "FALSE"
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

      l_0_2.isRemote = tostring(l_0_4)
      l_0_2.SigName = "MalExcl"
      local l_0_7, l_0_8 = , pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSDomainName)
      do
        if l_0_8 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
          local l_0_9 = nil
          R8_PC55 = R8_PC55(scrubData(R8_PC55))
          l_0_2.DomainName = R8_PC55
        end
        -- DECOMPILER ERROR at PC62: Overwrote pending register: R8 in 'AssignReg'

        local l_0_10, l_0_11 = , pcall(R8_PC55, l_0_1, MpCommon.WTSUserName)
        do
          if l_0_11 and R8_PC55 and R8_PC55 ~= "" then
            local l_0_12 = R8_PC55
            R10_PC75 = R10_PC75(scrubData(R10_PC75))
            l_0_2.UserName = R10_PC75
          end
          -- DECOMPILER ERROR at PC82: Overwrote pending register: R10 in 'AssignReg'

          local l_0_13, l_0_14 = l_0_12, pcall(R10_PC75, l_0_1, MpCommon.WTSClientAddress)
          do
            do
              if l_0_14 and R10_PC75 and R10_PC75 ~= "" then
                local l_0_15 = R10_PC75
                R12_PC95 = R12_PC95(scrubData(R12_PC95))
                l_0_2.IP = R12_PC95
              end
              ;
              (bm.add_related_string)(R12_PC95, safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
              do return mp.INFECTED end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

