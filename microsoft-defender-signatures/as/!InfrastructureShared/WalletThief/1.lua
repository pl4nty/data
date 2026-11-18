-- Threat: !InfrastructureShared
-- Name: WalletThief
-- Type: 15
-- Includes: LuaFuncHelper

local function l_0_0(l_1_0)
  return l_1_0 ~= nil and 0 < #l_1_0 and #l_1_0 <= 256 and not string.find(l_1_0, "..\\", 1, true) and not string.find(l_1_0, "\\..", 1, true) and not string.find(l_1_0, "/", 1, true) and not string.find(l_1_0, ":", 1, true)
end

if Remediation.Threat.Name == "Behavior:Win32/WalletThief.A" then
  local l_0_1 = GetRollingQueue("WalletThief_Queue")
  if l_0_1 == nil then
    return
  end
  local l_0_2 = string.lower("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks\\")
  local l_0_3 = string.lower("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree\\")
  local l_0_4 = MpCommon.ExpandEnvironmentVariables("%windir%")
  if l_0_4 == nil or l_0_4 == "" or l_0_4 == "%windir%" then
    return
  end
  local l_0_5 = string.lower(l_0_4 .. "\\System32\\Tasks\\")
  local l_0_6 = string.lower(l_0_4 .. "\\Tasks\\")
  for l_0_7 in pairs(l_0_1) do
    local l_0_8 = l_0_1[l_0_7]
    if l_0_8 ~= nil and l_0_8.key ~= nil and l_0_8.value ~= nil then
      local l_0_9 = tostring(l_0_8.key)
      local l_0_10 = tostring(l_0_8.value)
      local l_0_11 = string.lower(l_0_10)
      if l_0_9 == "TasksKey" and string.sub(l_0_11, 1, #l_0_2) == l_0_2 then
        local l_0_12 = string.sub(l_0_10, #l_0_2 + 1)
        if string.match(l_0_12, "^%{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%}$") then
          local l_0_13 = sysio.RegOpenKey(l_0_10)
          if l_0_13 then
            sysio.DeleteRegKey(l_0_13, nil)
          end
        end
      elseif l_0_9 == "TreeKey" and string.sub(l_0_11, 1, #l_0_3) == l_0_3 then
        local l_0_14 = string.sub(l_0_10, #l_0_3 + 1)
        if l_0_0(l_0_14) then
          local l_0_15 = sysio.RegOpenKey(l_0_10)
          if l_0_15 then
            sysio.DeleteRegKey(l_0_15, nil)
          end
        end
      elseif l_0_9 == "TaskFile" then
        local l_0_16
        if string.sub(l_0_11, 1, #l_0_5) == l_0_5 then
          l_0_16 = string.sub(l_0_10, #l_0_5 + 1)
        elseif string.sub(l_0_11, 1, #l_0_6) == l_0_6 then
          l_0_16 = string.sub(l_0_10, #l_0_6 + 1)
        end
        if l_0_0(l_0_16) and sysio.IsFileExists(l_0_10) then
          sysio.DeleteFile(l_0_10)
        end
      end
    end
  end
  pcall(MpCommon.RollingQueueErase, "WalletThief_Queue")
end
