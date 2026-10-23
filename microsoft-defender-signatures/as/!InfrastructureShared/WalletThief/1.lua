-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WalletThief\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = "HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree"
  for l_1_5,l_1_6 in pairs(l_1_0) do
    local l_1_7 = l_1_6.Id
    local l_1_8 = l_1_6.Path
    if l_1_7 ~= nil and l_1_8 ~= nil and #l_1_8 > 1 then
      local l_1_9 = l_1_8
      if (string.sub)(l_1_9, 1, 1) == "\\" then
        l_1_9 = (string.sub)(l_1_9, 2)
      end
      if #l_1_9 > 0 and not (string.find)(l_1_9, "..\\", 1, true) then
        local l_1_10 = (sysio.RegOpenKey)(l_1_1 .. "\\" .. l_1_9)
        if l_1_10 then
          local l_1_11 = (sysio.GetRegValueAsString)(l_1_10, "Id")
          if l_1_11 ~= nil and l_1_11 == l_1_7 then
            (sysio.DeleteRegKey)(l_1_10, nil)
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
        (sysio.DeleteFile)(l_2_9)
      end
      local l_2_10 = l_2_2 .. l_2_8 .. ".job"
      if (sysio.IsFileExists)(l_2_10) then
        (sysio.DeleteFile)(l_2_10)
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
              if #l_3_12 < 512 then
                local l_3_13 = (string.match)(l_3_12, "mshta%.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
                -- DECOMPILER ERROR at PC69: Unhandled construct in 'MakeBoolean' P1

                if l_3_13 ~= nil and #l_3_13 > 7 and l_3_0 == l_3_13 then
                  local l_3_14 = {}
                  l_3_14.Id = l_3_9
                  l_3_14.Url = l_3_13
                  l_3_14.Path = l_3_11
                  l_3_1[l_3_9] = l_3_14
                  l_3_14 = sysio
                  l_3_14 = l_3_14.DeleteRegKey
                  l_3_14(l_3_10, nil)
                end
              end
            end
          end
        end
        do
          l_3_13 = (string.match)(l_3_12, "powershell.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
          do
            if l_3_0 == l_3_13 and ((string.find)(l_3_12, "iex", 1, true) or (string.find)(l_3_12, "invoke-expression", 1, true) or (string.find)(l_3_12, "create", 1, true)) then
              local l_3_15 = {}
              l_3_15.Id = l_3_9
              l_3_15.Url = l_3_13
              l_3_15.Path = l_3_11
              l_3_1[l_3_9] = l_3_15
              l_3_15 = sysio
              l_3_15 = l_3_15.DeleteRegKey
              l_3_15(l_3_10, nil)
            end
            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
  return l_3_1
end

if (Remediation.Threat).Name == "DISABLED:Behavior:Win32/WalletThief.A" then
  local l_0_3 = nil
  local l_0_4 = GetRollingQueue("WalletThief_Queue")
  if l_0_4 == nil then
    return 
  end
  for l_0_8 in pairs(l_0_4) do
    l_0_3 = tostring((l_0_4[l_0_8]).key)
    if l_0_3 ~= nil and #l_0_3 >= 8 and #l_0_3 <= 128 then
      local l_0_9 = l_0_2(l_0_3)
      if l_0_9 ~= nil and next(l_0_9) ~= nil then
        l_0_0(l_0_9)
        l_0_1(l_0_9)
      end
    end
  end
  pcall(MpCommon.RollingQueueErase, "WalletThief_Queue")
end

