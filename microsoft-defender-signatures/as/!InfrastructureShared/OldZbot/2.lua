-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\OldZbot\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpDetection.GetCurrentThreat)()
if not l_0_0 or type(l_0_0.Name) ~= "string" then
  return 
end
if Infrastructure_OldZbotIsOneXThread(l_0_0.Name) then
  local l_0_1 = ((sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon"))
  local l_0_2 = nil
  if l_0_1 then
    l_0_2 = (sysio.GetRegValueAsString)(l_0_1, "userinit")
  end
  local l_0_3 = 0
  if type(l_0_2) == "string" then
    for l_0_7 in (string.gmatch)(l_0_2, "[^,]+") do
      if l_0_3 == 0 and not (string.find)(l_0_7, "userinit.exe", 1, true) then
        return 
      else
        if l_0_3 > 0 and (string.find)(l_0_7, "system32", 1, true) then
          Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "winlogonuserinit://HKLM\\SOFTWARE\\MICROSOFT\\WINDOWS NT\\CURRENTVERSION\\WINLOGON\\\\USERINIT:" .. l_0_7)
        end
      end
      l_0_3 = l_0_3 + 1
    end
  end
  do
    do
      local l_0_8 = (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
      if type(l_0_8) == "table" then
        for l_0_12,l_0_13 in pairs(l_0_8) do
          if type(l_0_13) == "string" then
            local l_0_14 = (sysio.RegOpenKey)(l_0_13)
            if l_0_14 then
              local l_0_15 = (sysio.GetRegValueAsString)(l_0_14, "Userinit")
              if type(l_0_15) == "string" and (string.find)(l_0_15, "App", 1, true) then
                Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "runkey://" .. l_0_13 .. "\\\\Userinit")
                local l_0_16 = Infrastructure_OldZbotNormalizePathValue(l_0_15)
                if l_0_16 then
                  local l_0_17 = Infrastructure_OldZbotExpandPaths(l_0_16, true)
                  if next(l_0_17) then
                    for l_0_21,l_0_22 in pairs(l_0_17) do
                      Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "file://" .. l_0_22)
                    end
                  else
                    do
                      do
                        Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_scan_begin", "file://" .. l_0_16)
                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      do return  end
      if Infrastructure_OldZbotIsTwoXThread(l_0_0.Name) then
        local l_0_23 = Infrastructure_OldZbotGetTwoXCandidates()
        for l_0_27,l_0_28 in ipairs(l_0_23) do
          Infrastructure_OldZbotScanWithAttribute("SYSCLEAN:Zbot_2x_scan_begin", "file://" .. l_0_28.path)
        end
      end
    end
  end
end

