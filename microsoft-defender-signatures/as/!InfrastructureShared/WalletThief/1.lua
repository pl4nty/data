-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WalletThief\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  do
    if l_1_0 ~= nil and #l_1_0 > 0 and #l_1_0 <= 256 and not (string.find)(l_1_0, "..\\", 1, true) and not (string.find)(l_1_0, "\\..", 1, true) and not (string.find)(l_1_0, "/", 1, true) then
      local l_1_1 = not (string.find)(l_1_0, ":", 1, true)
    else
    end
    return false
  end
end

if (Remediation.Threat).Name == "Behavior:Win32/WalletThief.A" then
  local l_0_1 = GetRollingQueue("WalletThief_Queue")
  if l_0_1 == nil then
    return 
  end
  local l_0_2 = (string.lower)("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks\\")
  local l_0_3 = (string.lower)("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree\\")
  local l_0_4 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
  if l_0_4 == nil or l_0_4 == "" or l_0_4 == "%windir%" then
    return 
  end
  local l_0_5 = (string.lower)(l_0_4 .. "\\System32\\Tasks\\")
  local l_0_6 = (string.lower)(l_0_4 .. "\\Tasks\\")
  for l_0_10 in pairs(l_0_1) do
    local l_0_11 = l_0_1[l_0_10]
    if l_0_11 ~= nil and l_0_11.key ~= nil and l_0_11.value ~= nil then
      local l_0_12 = tostring(l_0_11.key)
      local l_0_13 = tostring(l_0_11.value)
      local l_0_14 = (string.lower)(l_0_13)
      if l_0_12 == "TasksKey" and (string.sub)(l_0_14, 1, #l_0_2) == l_0_2 then
        local l_0_15 = (string.sub)(l_0_13, #l_0_2 + 1)
        if (string.match)(l_0_15, "^%{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%}$") then
          local l_0_16 = (sysio.RegOpenKey)(l_0_13)
          if l_0_16 then
            (sysio.DeleteRegKey)(l_0_16, nil)
          end
        end
      else
        do
          if l_0_12 == "TreeKey" and (string.sub)(l_0_14, 1, #l_0_3) == l_0_3 then
            local l_0_17 = (string.sub)(l_0_13, #l_0_3 + 1)
            if l_0_0(l_0_17) then
              local l_0_18 = (sysio.RegOpenKey)(l_0_13)
              if l_0_18 then
                (sysio.DeleteRegKey)(l_0_18, nil)
              end
            end
          else
            do
              do
                if l_0_12 == "TaskFile" then
                  local l_0_19 = nil
                  if (string.sub)(l_0_14, 1, #l_0_5) == l_0_5 then
                    l_0_19 = (string.sub)(l_0_13, #l_0_5 + 1)
                  else
                    if (string.sub)(l_0_14, 1, #l_0_6) == l_0_6 then
                      l_0_19 = (string.sub)(l_0_13, #l_0_6 + 1)
                    end
                  end
                  if l_0_0(l_0_19) and (sysio.IsFileExists)(l_0_13) then
                    (sysio.DeleteFile)(l_0_13)
                  end
                end
                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC183: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  pcall(MpCommon.RollingQueueErase, "WalletThief_Queue")
end

