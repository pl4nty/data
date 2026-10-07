-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WalletThief\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = "HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree"
  local l_1_2 = (sysio.RegOpenKey)(l_1_1)
  if l_1_2 then
    local l_1_3 = (sysio.RegEnumKeys)(l_1_2)
    if l_1_3 then
      for l_1_7,l_1_8 in ipairs(l_1_3) do
        local l_1_9 = (sysio.RegOpenKey)(l_1_1 .. "\\" .. l_1_8)
        if l_1_9 then
          local l_1_10 = (sysio.GetRegValueAsString)(l_1_9, "Id")
          local l_1_11 = l_1_0[l_1_10]
          if l_1_11 ~= nil then
            local l_1_12 = l_1_11.Path
            if (string.find)(l_1_12, l_1_8, 1, true) then
              set_research_data("WtTreeKey", (MpCommon.Base64Encode)(l_1_1 .. "\\" .. l_1_8), false)
            end
          end
        end
      end
    end
  end
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = (MpCommon.ExpandEnvironmentVariables)("%windir%") .. "\\System32\\Tasks\\"
  local l_2_2 = (MpCommon.ExpandEnvironmentVariables)("%windir%") .. "\\Tasks\\"
  for l_2_6,l_2_7 in pairs(l_2_0) do
    local l_2_8 = l_2_7.Path
    if l_2_8 ~= nil and not (string.find)(l_2_8, "..\\", 1, true) then
      if (string.sub)(l_2_8, 1, 1) == "\\" then
        l_2_8 = (string.sub)(l_2_8, 2)
      end
      local l_2_9 = l_2_1 .. l_2_8
      if (sysio.IsFileExists)(l_2_9) then
        set_research_data("WtTask1", (MpCommon.Base64Encode)(l_2_9), false)
      end
      local l_2_10 = l_2_2 .. l_2_8 .. ".job"
      if (sysio.IsFileExists)(l_2_10) then
        set_research_data("WtTask2", (MpCommon.Base64Encode)(l_2_10), false)
      end
    end
  end
end

local l_0_2 = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = {}
  local l_3_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks"
  local l_3_3 = (sysio.RegOpenKey)(l_3_2)
  if l_3_3 then
    local l_3_4 = (sysio.RegEnumKeys)(l_3_3)
    if l_3_4 then
      for l_3_8,l_3_9 in ipairs(l_3_4) do
        local l_3_10 = (sysio.RegOpenKey)(l_3_2 .. "\\" .. l_3_9)
        if l_3_10 then
          local l_3_11 = (sysio.GetRegValueAsString)(l_3_10, "Path")
          if l_3_11 ~= nil then
            local l_3_12 = (sysio.GetRegValueAsBinary)(l_3_10, "Actions")
            if l_3_12 ~= nil then
              l_3_12 = (string.lower)(l_3_12)
              l_3_12 = (string.gsub)(l_3_12, "%z", "")
              if #l_3_12 < 256 then
                do
                  if (string.match)(l_3_12, "start%-process mshta.exe (https?://[^%s%?%)%]%\'\"}&|<>;,]+)") == nil then
                    local l_3_13, l_3_14, l_3_15, l_3_16, l_3_17, l_3_18 = (string.match)(l_3_12, "powershell.exe.-(https?://[^%s%?%)%]%\'\"}&|<>;,]+)")
                    l_3_14 = string
                    l_3_14 = l_3_14.find
                    l_3_15 = l_3_12
                    l_3_16 = "iex"
                    l_3_17 = 1
                    l_3_18 = true
                    l_3_14 = l_3_14(l_3_15, l_3_16, l_3_17, l_3_18)
                    if not l_3_14 then
                      l_3_14 = string
                      l_3_14 = l_3_14.find
                      l_3_15 = l_3_12
                      l_3_16 = "invoke-expression"
                      l_3_17 = 1
                      l_3_18 = true
                      l_3_14 = l_3_14(l_3_15, l_3_16, l_3_17, l_3_18)
                      if not l_3_14 then
                        l_3_14 = string
                        l_3_14 = l_3_14.find
                        l_3_15 = l_3_12
                        l_3_16 = "create"
                        l_3_17 = 1
                        l_3_18 = true
                        l_3_14 = l_3_14(l_3_15, l_3_16, l_3_17, l_3_18)
                        if not l_3_14 then
                          l_3_13 = nil
                        end
                      end
                    end
                  end
                  -- DECOMPILER ERROR at PC97: Confused about usage of register: R13 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC99: Confused about usage of register: R13 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC102: Confused about usage of register: R13 in 'UnsetPending'

                  do
                    if l_3_13 ~= nil and #l_3_13 > 7 and l_3_0 == l_3_13 then
                      local l_3_19 = nil
                      l_3_1[l_3_9] = {Id = l_3_9, Url = l_3_19, Path = l_3_11}
                      set_research_data("WtTaskReg", (MpCommon.Base64Encode)(l_3_2 .. "\\" .. l_3_9), false)
                    end
                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC120: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return l_3_1
end

if (Remediation.Threat).Name == "Behavior:Win32/WalletThief.A" then
  local l_0_3 = nil
  local l_0_4 = GetRollingQueue("WalletThiefQueue")
  if l_0_4 == nil then
    return 
  end
  for l_0_8 in pairs(l_0_4) do
    if (l_0_4[l_0_8]).key == "Url" then
      l_0_3 = tostring((l_0_4[l_0_8]).value)
    end
  end
  pcall(MpCommon.RollingQueueErase, "WalletThiefQueue")
  if l_0_3 == nil or #l_0_3 < 8 or #l_0_3 > 128 then
    return 
  end
  local l_0_9 = l_0_2(l_0_3)
  if l_0_9 == nil or next(l_0_9) == nil then
    return 
  end
  l_0_0(l_0_9)
  l_0_1(l_0_9)
end

