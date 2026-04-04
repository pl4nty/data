-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d3d76a1fa5cb\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles ~= nil then
    local l_0_1 = (mp.GetScannedPPID)()
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = (string.lower)((mp.GetProcessCommandLine)(l_0_1))
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if not (string.find)(l_0_2, "-q", 1, true) or not (string.find)(l_0_2, ":\\\"", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = {}
    l_0_3.SigName = "SuspRCloneOnHVA"
    l_0_3.cmdline = l_0_2
    local l_0_4 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
    do
      local l_0_5, l_0_6, l_0_7 = l_0_4 and MpCommon.QuerySessionInformation or "FALSE"
      -- DECOMPILER ERROR at PC66: Confused about usage of register: R5 in 'UnsetPending'

      l_0_3.isRemote = tostring(l_0_5)
      local l_0_8, l_0_9 = , pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSDomainName)
      do
        if l_0_9 and MpCommon.QuerySessionInformation and MpCommon.QuerySessionInformation ~= "" then
          local l_0_10 = nil
          R9_PC84 = R9_PC84(scrubData(R9_PC84))
          l_0_3.DomainName = R9_PC84
        end
        -- DECOMPILER ERROR at PC91: Overwrote pending register: R9 in 'AssignReg'

        local l_0_11, l_0_12 = , pcall(R9_PC84, l_0_1, MpCommon.WTSUserName)
        do
          if l_0_12 and R9_PC84 and R9_PC84 ~= "" then
            local l_0_13 = R9_PC84
            R11_PC104 = R11_PC104(scrubData(R11_PC104))
            l_0_3.UserName = R11_PC104
          end
          -- DECOMPILER ERROR at PC111: Overwrote pending register: R11 in 'AssignReg'

          local l_0_14, l_0_15 = l_0_13, pcall(R11_PC104, l_0_1, MpCommon.WTSClientAddress)
          do
            if l_0_15 and R11_PC104 and R11_PC104 ~= "" then
              local l_0_16 = R11_PC104
              R13_PC124 = R13_PC124(scrubData(R13_PC124))
              l_0_3.IP = R13_PC124
            end
            -- DECOMPILER ERROR at PC131: Overwrote pending register: R13 in 'AssignReg'

            local l_0_17, l_0_18 = l_0_16, pcall(R13_PC124, l_0_1, MpCommon.WTSClientName)
            do
              do
                if l_0_18 and R13_PC124 and R13_PC124 ~= "" then
                  local l_0_19 = R13_PC124
                  R15_PC144 = R15_PC144(scrubData(R15_PC144))
                  l_0_3.ClientName = R15_PC144
                end
                set_research_data(R15_PC144, safeJsonSerialize(l_0_3), false)
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

