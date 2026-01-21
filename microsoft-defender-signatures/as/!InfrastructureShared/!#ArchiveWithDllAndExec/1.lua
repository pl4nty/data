-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ArchiveWithDllAndExec\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if (l_0_0 and (MpCommon.PathToWin32Path)(l_0_0)) or not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (string.match)(l_0_0, "(.*)%->")
do
  if not (string.match)(l_0_0, "%w+%->.*/(.*)") and not (string.match)(l_0_0, "%->(.*%.exe)$") then
    local l_0_2, l_0_3 = (string.match)(l_0_0, "%->(.*%.dll)$")
  end
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = 259200
  AppendToRollingQueue("ArchivesWithExec_FileName", l_0_4, l_0_1, l_0_5, 1000, 0)
  local l_0_6 = nil
  local l_0_7 = ((string.match)(l_0_4, "%.(.*)$"))
  -- DECOMPILER ERROR at PC80: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R6 in 'AssignReg'

  if l_0_7 == "exe" then
    local l_0_8, l_0_9, l_0_10 = , IsKeyInRollingQueue("ArchivesWithExec_FileName", nil, false)
    if not l_0_9 or not nil then
      return mp.CLEAN
    end
    for l_0_14,l_0_15 in ipairs(R11_PC97) do
      local l_0_11 = nil
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R14 in 'UnsetPending'

      if R14_PC99.value == l_0_1 then
        if l_0_7 == "exe" and (string.find)(R14_PC99.key, "loc.dll", 1, true) then
          local l_0_17 = Contains_any_caseinsenstive
          local l_0_18 = l_0_4
          l_0_17 = l_0_17(l_0_18, {"U3BoostSvr", "USHSVC", "AgentInstall"})
          if l_0_17 then
            l_0_17 = mp
            l_0_17 = l_0_17.set_mpattribute
            l_0_18 = "DllSideLoading_VulnerableExe_Asus"
            l_0_17(l_0_18)
            l_0_17 = mp
            l_0_17 = l_0_17.INFECTED
            return l_0_17
          end
        end
        do
          if l_0_7 == "dll" and (string.find)(l_0_4, "loc.dll", 1, true) then
            local l_0_19 = nil
            local l_0_20 = Contains_any_caseinsenstive
            local l_0_21 = l_0_19.key
            l_0_20 = l_0_20(l_0_21, {"U3BoostSvr", "USHSVC", "AgentInstall"})
            if l_0_20 then
              l_0_20 = mp
              l_0_20 = l_0_20.set_mpattribute
              l_0_21 = "DllSideLoading_VulnerableExe_Asus"
              l_0_20(l_0_21)
              l_0_20 = mp
              l_0_20 = l_0_20.INFECTED
              return l_0_20
            end
          end
          do
            -- DECOMPILER ERROR at PC164: Confused about usage of register: R14 in 'UnsetPending'

            set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_0 .. "|" .. l_0_19.key), false)
            local l_0_22 = nil
            local l_0_23 = (string.match)(l_0_4, "(.-)%->")
            if l_0_23 and (string.match)(l_0_22.key, "([^\\>]+)$") then
              local l_0_24, l_0_25 = , nil
              -- DECOMPILER ERROR at PC186: Overwrote pending register: R18 in 'AssignReg'

              -- DECOMPILER ERROR at PC189: Overwrote pending register: R18 in 'AssignReg'

              -- DECOMPILER ERROR at PC190: Overwrote pending register: R17 in 'AssignReg'

              if l_0_8 == ".exe" then
                do
                  do
                    local l_0_26, l_0_27, l_0_28 = , IsDllInExpectedPath(l_0_25, l_0_1, nil)
                    if l_0_1 then
                      (mp.set_mpattribute)("DllSideLoading_VulnerableExe_" .. R24_PC202)
                    end
                    if l_0_27 then
                      (mp.set_mpattribute)("DllSideLoading_VulnerableDll_" .. R24_PC202)
                    end
                    -- DECOMPILER ERROR at PC212: Overwrote pending register: R17 in 'AssignReg'

                    do return l_0_25.INFECTED end
                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

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

