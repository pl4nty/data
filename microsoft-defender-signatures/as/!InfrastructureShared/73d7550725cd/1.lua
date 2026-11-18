-- Threat: !InfrastructureShared
-- Name: 73d7550725cd
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe" or l_0_1:match("([^\\]+)$") == "wsreset.exe" or l_0_1:match("([^\\]+)$") == "slui.exe" or l_0_1:match("([^\\]+)$") == "changepk.exe" or l_0_1:match("([^\\]+)$") == "control.exe" or l_0_1:match("([^\\]+)$") == "compmgmtlauncher.exe" then
    local l_0_2 = true
    if l_0_1:match("([^\\]+)$") == "control.exe" then
      if MpCommon.GetPersistContextCountNoPath("UACBypassExp.A!sdclt") == 0 then
        return mp.CLEAN
      end
      local l_0_3 = MpCommon.GetPersistContextNoPath("UACBypassExp.A!sdclt")
      if l_0_3 then
        local l_0_4 = l_0_0.ppid
        local l_0_5 = false
        for l_0_6, l_0_7 in ipairs(l_0_3) do
          if l_0_7 == l_0_4 then
            l_0_5 = true
            break
          end
        end
        if l_0_5 == false then
          l_0_2 = false
        end
      end
    end
    if l_0_2 == false then
      return mp.CLEAN
    end
    if 0 < MpCommon.GetPersistContextCountNoPath("UACBypassExp.T!ShieldUp") then
      local l_0_8 = MpCommon.GetPersistContextNoPath("UACBypassExp.T!ShieldUp")
      if l_0_8 then
        local l_0_9 = mp.GetScannedPPID()
        local l_0_10 = string.lower(mp.GetProcessCommandLine(l_0_9))
        local l_0_11 = string.match(l_0_10, "^(.-)%s+")
        l_0_11 = l_0_11:gsub("%.exe$", "")
        for l_0_12, l_0_13 in ipairs(l_0_8) do
          l_0_13 = string.lower(l_0_13)
          if string.find(l_0_13, l_0_11, 1, true) then
            return mp.INFECTED
          end
          if string.len(l_0_13) > 8 and (string.find(l_0_13, ".bat", 1, true) or string.find(l_0_13, ".cmd", 1, true) or string.find(l_0_13, ".js", 1, true) or string.find(l_0_13, ".vbs", 1, true) or string.find(l_0_13, ".wsf", 1, true)) and string.find(l_0_10, l_0_13, 1, true) then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
