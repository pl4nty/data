-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Startpage\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (Remediation.Threat).Name
local l_0_1 = function(l_1_0)
  -- function num : 0_0
  if (string.sub)(l_1_0, 1, 5) == "HKCU\\" then
    if not (sysio.RegExpandUserKey)(l_1_0) then
      do return {} end
      do
        local l_1_1 = {}
        -- DECOMPILER ERROR at PC18: No list found for R1 , SetList fails

        do return l_1_1 end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

local l_0_5 = function(l_2_0, l_2_1, l_2_2)
  -- function num : 0_1 , upvalues : l_0_1
  local l_2_3 = l_0_1(l_2_0)
  for l_2_7,l_2_8 in pairs(l_2_3) do
    local l_2_9 = (sysio.RegOpenKey)(l_2_8)
    if l_2_9 then
      (sysio.SetRegValueAsString)(l_2_9, l_2_1, l_2_2)
    end
  end
end

if (function(l_5_0, l_5_1)
  -- function num : 0_4
  if type(l_5_0) ~= "string" or type(l_5_1) ~= "string" then
    return false
  end
  do return (string.lower)(l_5_0) == (string.lower)(l_5_1) end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end
)(l_0_0, "Trojan:Win32/Startpage.TE") then
  l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Start Page", "http://www.msn.com/?pc=MSERT1")
  local l_0_6 = function(l_3_0, l_3_1)
  -- function num : 0_2 , upvalues : l_0_1
  local l_3_2 = l_0_1(l_3_0)
  for l_3_6,l_3_7 in pairs(l_3_2) do
    local l_3_8 = (sysio.RegOpenKey)(l_3_7)
    if l_3_8 then
      (sysio.DeleteRegValue)(l_3_8, l_3_1)
    end
  end
end

  if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
    for l_0_10,l_0_11 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
      local l_0_7, l_0_8, l_0_9 = function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_1
  local l_4_2 = l_0_1(l_4_0)
  for l_4_6,l_4_7 in pairs(l_4_2) do
    local l_4_8 = (sysio.RegOpenKey)(l_4_7)
    if l_4_8 then
      (sysio.DeleteRegKey)(l_4_8, l_4_1)
    end
  end
end

      -- DECOMPILER ERROR at PC34: Confused about usage of register: R11 in 'UnsetPending'

      if (sysio.RegOpenKey)(R11_PC34) then
        if l_0_8((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Start Page"), "http://www.start-space.com/") then
          (sysio.SetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Start Page", "http://www.msn.com/?pc=MSERT1")
        end
        if l_0_8((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "HOMEOldSP"), "http://www.start-space.com/") then
          (sysio.DeleteRegValue)((sysio.RegOpenKey)(R11_PC34), "HOMEOldSP")
        end
      end
    end
  end
else
  do
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R5 in 'UnsetPending'

    if l_0_8(l_0_0, "Trojan:Win32/Startpage.TD") then
      local l_0_14 = nil
      if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
        for l_0_18,l_0_19 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
          local l_0_15, l_0_16, l_0_17 = nil
          -- DECOMPILER ERROR at PC93: Confused about usage of register: R11 in 'UnsetPending'

          if (sysio.RegOpenKey)(R11_PC34) then
            if l_0_16((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Search Page"), "http://www.alfa-search.com/home.html") then
              (sysio.SetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Search Page", "http://www.msn.com/?pc=MSERT1")
            end
            if l_0_16((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Start Page"), "http://www.alfa-search.com/home.html") then
              (sysio.SetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Start Page", "http://www.msn.com/?pc=MSERT1")
            end
            if l_0_16((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Search Bar"), "http://www.alfa-search.com/search.html") then
              (sysio.DeleteRegValue)((sysio.RegOpenKey)(R11_PC34), "Search Bar")
            end
            if l_0_16((sysio.GetRegValueAsString)((sysio.RegOpenKey)(R11_PC34), "Use Search Asst"), "no") then
              (sysio.DeleteRegValue)((sysio.RegOpenKey)(R11_PC34), "Use Search Asst")
            end
          end
        end
      end
      do
        local l_0_22 = nil
        if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\SearchUrl") then
          for l_0_26,l_0_27 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\SearchUrl")) do
            local l_0_23, l_0_24, l_0_25 = nil
            if (sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)) then
              if l_0_23((sysio.GetRegValueAsString)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)), "provider"), "god") then
                (sysio.SetRegValueAsString)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)), "provider", "")
              end
              if l_0_23((sysio.GetRegValueAsString)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)), nil), "http://www.alfa-search.com/search.html") then
                (sysio.DeleteRegValue)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)), nil)
              end
            end
          end
        end
        do
          l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Search", "SearchAssistant", "http://go.microsoft.com/fwlink/?linkid=42826")
          local l_0_30 = nil
          if (sysio.ExpandFilePath)("%userprofile%\\Favorites\\", true) then
            for l_0_34,l_0_35 in pairs((sysio.ExpandFilePath)("%userprofile%\\Favorites\\", true)) do
              local l_0_31, l_0_32, l_0_33 = nil
              ;
              (sysio.DeleteFile)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)) .. "Extreme Sex Pictures.url")
              ;
              (sysio.DeleteFile)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)) .. "Picture Mania Tgp.url")
              ;
              (sysio.DeleteFile)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)) .. "True Mature Tgp.url")
              ;
              (sysio.DeleteFile)((sysio.RegOpenKey)((sysio.RegOpenKey)(R11_PC34)) .. "Very Young Pictures.url")
            end
          end
          do
            -- DECOMPILER ERROR at PC263: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC269: Confused about usage of register: R3 in 'UnsetPending'

            if l_0_30(l_0_0, "Trojan:Win32/Startpage.TC") then
              l_0_14("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", "SysTime")
              l_0_5("HKLM\\Software\\Microsoft\\Internet Explorer\\Main", "Start Page", "http://www.msn.com/?pc=MSERT1")
              l_0_5("HKLM\\Software\\Microsoft\\Internet Explorer\\Main", "Local Page", "http://go.microsoft.com/fwlink/?linkid=42826")
              l_0_5("HKLM\\Software\\Microsoft\\Internet Explorer\\Main", "Default_Page_URL", "http://www.msn.com/?pc=MSERT1")
              local l_0_36 = nil
              if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run") then
                for l_0_40,l_0_41 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")) do
                  local l_0_37, l_0_38, l_0_39 = nil
                  if (sysio.RegOpenKey)(R13_PC301) then
                    R13_PC301 = sysio
                    R13_PC301 = R13_PC301.DeleteRegValue
                    R13_PC301((sysio.RegOpenKey)(R13_PC301), "SysTime")
                  end
                end
              end
              do
                local l_0_43 = nil
                if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
                  for l_0_47,l_0_48 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
                    local l_0_44, l_0_45, l_0_46 = nil
                    R13_PC301 = sysio
                    R13_PC301 = R13_PC301.RegOpenKey
                    R13_PC301 = R13_PC301((sysio.RegOpenKey)(R13_PC301))
                    if R13_PC301 then
                      if l_0_44((sysio.GetRegValueAsString)(R13_PC301, "Start Page"), "http://213.159.117.134/index.php") then
                        (sysio.SetRegValueAsString)(R13_PC301, "Start Page", "http://www.msn.com/?pc=MSERT1")
                      end
                      if l_0_44((sysio.GetRegValueAsString)(R13_PC301, "Local Page"), "http://213.159.117.134/index.php") then
                        (sysio.SetRegValueAsString)(R13_PC301, "Start Page", "http://www.msn.com/?pc=MSERT1")
                      end
                      if l_0_44((sysio.GetRegValueAsString)(R13_PC301, "Default_Page_URL"), "http://213.159.117.134/index.php") then
                        (sysio.SetRegValueAsString)(R13_PC301, "Start Page", "http://www.msn.com/?pc=MSERT1")
                      end
                    end
                  end
                end
                do
                  -- DECOMPILER ERROR at PC383: Confused about usage of register: R5 in 'UnsetPending'

                  if l_0_44(l_0_0, "Trojan:Win32/Startpage.PV") then
                    local l_0_51 = nil
                    local l_0_52 = nil
                    local l_0_53 = nil
                    local l_0_54 = {}
                    local l_0_55 = {"HKLM\\Software\\Classes\\IETLBAss.DOMP", "CLSID"}
                    local l_0_56 = {"HKLM\\Software\\Classes\\IETLBAss.DOMP", "CurVer"}
                    local l_0_57 = {"HKLM\\Software\\Classes", "IETLBAss.DOMP"}
                    -- DECOMPILER ERROR at PC411: Overwrote pending register: R13 in 'AssignReg'

                    local l_0_58 = {"HKLM\\Software\\Classes\\IETLBAss.DOMP.1", "CLSID"}
                    local l_0_59 = {"HKLM\\Software\\Classes", R13_PC301}
                    local l_0_60 = {R13_PC301, "ProxyStubClsid"}
                    local l_0_61 = R13_PC301
                    local l_0_62 = {"HKLM\\Software\\Classes\\Interface\\{0B6EF17E-18E5-4449-86EA-64C82D596EAE}", "TypeLib"}
                    local l_0_63 = {"HKLM\\Software\\Classes\\Interface", "{0B6EF17E-18E5-4449-86EA-64C82D596EAE}"}
                    local l_0_64 = {"HKLM\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "ProxyStubClsid"}
                    local l_0_65 = {"HKLM\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "ProxyStubClsid32"}
                    local l_0_66 = {"HKLM\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "TypeLib"}
                    local l_0_67 = {"HKLM\\Software\\Classes\\Interface", "{B1E68D42-02C4-465B-8368-5ED9B732E22D}"}
                    local l_0_68 = {"HKLM\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0\\0", "win32"}
                    local l_0_69 = {"HKLM\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0", "0"}
                    local l_0_70 = {"HKLM\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0", "FLAGS"}
                    local l_0_71 = {"HKLM\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0", "HELPDIR"}
                    local l_0_72 = {"HKLM\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}", "1.0"}
                    local l_0_73 = {"HKLM\\Software\\Classes\\TypeLib", "{BD0022A3-A43F-4F44-B64F-53EA7575F097}"}
                    local l_0_74 = {"HKCU\\Software\\Classes\\IETLBAss.DOMP", "CLSID"}
                    local l_0_75 = {"HKCU\\Software\\Classes\\IETLBAss.DOMP", "CurVer"}
                    local l_0_76 = {"HKCU\\Software\\Classes", "IETLBAss.DOMP"}
                    local l_0_77 = {"HKCU\\Software\\Classes\\IETLBAss.DOMP.1", "CLSID"}
                    local l_0_78 = {"HKCU\\Software\\Classes", "IETLBAss.DOMP.1"}
                    local l_0_79 = {"HKCU\\Software\\Classes\\Interface\\{0B6EF17E-18E5-4449-86EA-64C82D596EAE}", "ProxyStubClsid"}
                    local l_0_80 = {"HKCU\\Software\\Classes\\Interface\\{0B6EF17E-18E5-4449-86EA-64C82D596EAE}", "ProxyStubClsid32"}
                    local l_0_81 = {"HKCU\\Software\\Classes\\Interface\\{0B6EF17E-18E5-4449-86EA-64C82D596EAE}", "TypeLib"}
                    local l_0_82 = {"HKCU\\Software\\Classes\\Interface", "{0B6EF17E-18E5-4449-86EA-64C82D596EAE}"}
                    local l_0_83 = {"HKCU\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "ProxyStubClsid"}
                    local l_0_84 = {"HKCU\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "ProxyStubClsid32"}
                    local l_0_85 = {"HKCU\\Software\\Classes\\Interface\\{B1E68D42-02C4-465B-8368-5ED9B732E22D}", "TypeLib"}
                    local l_0_86 = {"HKCU\\Software\\Classes\\Interface", "{B1E68D42-02C4-465B-8368-5ED9B732E22D}"}
                    local l_0_87 = {"HKCU\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0\\0", "win32"}
                    local l_0_88 = {"HKCU\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0", "0"}
                    do
                      local l_0_89 = {"HKCU\\Software\\Classes\\TypeLib\\{BD0022A3-A43F-4F44-B64F-53EA7575F097}\\1.0", "FLAGS"}
                      -- DECOMPILER ERROR at PC542: No list found for R6 , SetList fails

                      l_0_55 = ipairs
                      l_0_56 = l_0_54
                      l_0_55 = l_0_55(l_0_56)
                      for l_0_58,l_0_59 in l_0_55 do
                        l_0_60 = l_0_52
                        -- DECOMPILER ERROR at PC548: Overwrote pending register: R13 in 'AssignReg'

                        l_0_62 = l_0_59[2]
                        l_0_60(l_0_61, l_0_62)
                      end
                      if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run") then
                        for i_1,l_0_60 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")) do
                          -- DECOMPILER ERROR at PC563: Overwrote pending register: R13 in 'AssignReg'

                          -- DECOMPILER ERROR at PC564: Overwrote pending register: R13 in 'AssignReg'

                          l_0_62 = l_0_60
                          l_0_61 = l_0_61(l_0_62)
                          if l_0_61 then
                            l_0_62 = sysio
                            l_0_62 = l_0_62.GetRegValueAsString
                            l_0_63 = l_0_61
                            l_0_64 = "AddClass"
                            l_0_62 = l_0_62(l_0_63, l_0_64)
                            if l_0_62 == "" then
                              l_0_63 = sysio
                              l_0_63 = l_0_63.DeleteRegValue
                              l_0_64 = l_0_61
                              l_0_65 = "AddClass"
                              l_0_63(l_0_64, l_0_65)
                              l_0_63 = sysio
                              l_0_63 = l_0_63.DeleteRegValue
                              l_0_64 = l_0_61
                              l_0_65 = "MSMsgSvc"
                              l_0_63(l_0_64, l_0_65)
                            end
                          end
                        end
                      end
                      l_0_52("HKLM\\Software\\Microsoft\\Internet Explorer\\Main", "MSMsgSvc")
                      Infrastructure_FixHostsFile()
                      l_0_52("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall", "SearchAssistantUtility")
                      l_0_5("HKLM\\Software\\Classes\\PROTOCOLS\\Handler\\ms-its", nil, "ms-its: Asychronous Pluggable Protocol Handler")
                      l_0_5("HKLM\\Software\\Classes\\PROTOCOLS\\Handler\\ms-its", "CLSID", "{9D148291-B9C8-11D0-A4CC-0000F80149F6}")
                      if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
                        for i_1,l_0_61 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
                          l_0_62 = sysio
                          l_0_62 = l_0_62.RegOpenKey
                          l_0_63 = l_0_61
                          l_0_62 = l_0_62(l_0_63)
                          if l_0_62 then
                            l_0_63 = sysio
                            l_0_63 = l_0_63.GetRegValueAsString
                            l_0_64 = l_0_62
                            l_0_65 = "Start Page"
                            l_0_63 = l_0_63(l_0_64, l_0_65)
                            l_0_64 = l_0_53
                            l_0_65 = l_0_63
                            l_0_66 = "http://default.home"
                            l_0_64 = l_0_64(l_0_65, l_0_66)
                            if l_0_64 then
                              l_0_64 = sysio
                              l_0_64 = l_0_64.SetRegValueAsString
                              l_0_65 = l_0_62
                              l_0_66 = "Start Page"
                              l_0_67 = "http://www.msn.com/?pc=MSERT1"
                              l_0_64(l_0_65, l_0_66, l_0_67)
                            end
                          end
                        end
                      end
                      l_0_5("HKLM\\Software\\Microsoft\\Internet Explorer\\Main", "Start Page", "http://www.msn.com/?pc=MSERT1")
                      -- DECOMPILER ERROR at PC648: Confused about usage of register R13 for local variables in 'ReleaseLocals'

                      l_0_54 = l_0_53
                      l_0_54 = l_0_54(l_0_0, "Trojan:Win32/Startpage.BB")
                      if l_0_54 then
                        l_0_54 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\SafeSites"
                        local l_0_90 = nil
                        l_0_51(l_0_54, "auto.search.msn.com")
                        l_0_51(l_0_54, "auto.search.psn.cn")
                        l_0_51(l_0_54, "ie.search.psn.cn")
                        l_0_51(l_0_54, "search.msn.com")
                        l_0_51(l_0_54, "search.psn.cn")
                        l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Default_Search_URL", "http://go.microsoft.com/fwlink/?linkid=42826")
                        l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Search Page", "http://go.microsoft.com/fwlink/?linkid=42826")
                        l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Search", "CustomizeSearch", "http://go.microsoft.com/fwlink/?linkid=42826")
                        l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Search", "SearchAssistant", "http://go.microsoft.com/fwlink/?linkid=42826")
                        local l_0_91 = nil
                        if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
                          for l_0_95,l_0_96 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
                            local l_0_92, l_0_93, l_0_94, l_0_95, l_0_96 = nil
                            l_0_90 = sysio
                            l_0_90 = l_0_90.RegOpenKey
                            -- DECOMPILER ERROR at PC708: Confused about usage of register: R12 in 'UnsetPending'

                            l_0_91 = "http://www.msn.com/?pc=MSERT1"
                            l_0_90 = l_0_90(l_0_91)
                            local l_0_97 = nil
                            if l_0_90 then
                              l_0_91 = sysio
                              l_0_91 = l_0_91.GetRegValueAsString
                              l_0_92 = l_0_90
                              l_0_93 = "Search Bar"
                              l_0_91 = l_0_91(l_0_92, l_0_93)
                              local l_0_98 = nil
                              l_0_92 = l_0_53
                              l_0_93 = l_0_91
                              l_0_94 = "http://ie.search.psn.cn/"
                              l_0_92 = l_0_92(l_0_93, l_0_94)
                              if l_0_92 then
                                l_0_92 = sysio
                                l_0_92 = l_0_92.DeleteRegValue
                                l_0_93 = l_0_90
                                l_0_94 = "Search Bar"
                                l_0_92(l_0_93, l_0_94)
                              end
                              l_0_92 = sysio
                              l_0_92 = l_0_92.GetRegValueAsString
                              l_0_93 = l_0_90
                              l_0_94 = "Use Search Asst"
                              l_0_92 = l_0_92(l_0_93, l_0_94)
                              l_0_91 = l_0_92
                              l_0_92 = l_0_53
                              l_0_93 = l_0_91
                              l_0_94 = "no"
                              l_0_92 = l_0_92(l_0_93, l_0_94)
                              if l_0_92 then
                                l_0_92 = sysio
                                l_0_92 = l_0_92.DeleteRegValue
                                l_0_93 = l_0_90
                                l_0_94 = "Use Search Asst"
                                l_0_92(l_0_93, l_0_94)
                              end
                              l_0_92 = sysio
                              l_0_92 = l_0_92.GetRegValueAsString
                              l_0_93 = l_0_90
                              l_0_94 = "Search Page"
                              l_0_92 = l_0_92(l_0_93, l_0_94)
                              l_0_91 = l_0_92
                              l_0_92 = l_0_53
                              l_0_93 = l_0_91
                              l_0_94 = "http://search.psn.cn/"
                              l_0_92 = l_0_92(l_0_93, l_0_94)
                              if l_0_92 then
                                l_0_92 = sysio
                                l_0_92 = l_0_92.SetRegValueAsString
                                l_0_93 = l_0_90
                                l_0_94 = "Search Page"
                                l_0_95 = "http://go.microsoft.com/fwlink/?linkid=42826"
                                l_0_92(l_0_93, l_0_94, l_0_95)
                              end
                            end
                          end
                        end
                        do
                          local l_0_99 = nil
                          if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\SearchUrl") then
                            for l_0_103,l_0_90 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\SearchUrl")) do
                              local l_0_100, l_0_101, l_0_102, l_0_103, l_0_104 = nil
                              l_0_91 = sysio
                              l_0_91 = l_0_91.RegOpenKey
                              l_0_99 = l_0_90
                              l_0_91 = l_0_91(l_0_99)
                              local l_0_105 = nil
                              if l_0_91 then
                                l_0_99 = sysio
                                l_0_99 = l_0_99.GetRegValueAsString
                                l_0_100 = l_0_91
                                l_0_101 = "SearchURL"
                                l_0_99 = l_0_99(l_0_100, l_0_101)
                                local l_0_106 = nil
                                l_0_100 = l_0_53
                                l_0_101 = l_0_99
                                l_0_102 = "http://ie.search.psn.cn/"
                                l_0_100 = l_0_100(l_0_101, l_0_102)
                                if l_0_100 then
                                  l_0_100 = sysio
                                  l_0_100 = l_0_100.DeleteRegValue
                                  l_0_101 = l_0_91
                                  l_0_102 = "SearchURL"
                                  l_0_100(l_0_101, l_0_102)
                                end
                                l_0_100 = sysio
                                l_0_100 = l_0_100.GetRegValueAsString
                                l_0_101 = l_0_91
                                l_0_102 = "provider"
                                l_0_100 = l_0_100(l_0_101, l_0_102)
                                l_0_99 = l_0_100
                                l_0_100 = l_0_53
                                l_0_101 = l_0_99
                                l_0_102 = "nmax"
                                l_0_100 = l_0_100(l_0_101, l_0_102)
                                if l_0_100 then
                                  l_0_100 = sysio
                                  l_0_100 = l_0_100.SetRegValueAsString
                                  l_0_101 = l_0_91
                                  l_0_102 = "provider"
                                  l_0_103 = ""
                                  l_0_100(l_0_101, l_0_102, l_0_103)
                                end
                              end
                            end
                            -- DECOMPILER ERROR at PC817: Confused about usage of register R13 for local variables in 'ReleaseLocals'

                          end
                          l_0_54 = l_0_53
                          l_0_54 = l_0_54(l_0_0, "Trojan:Win32/Startpage.BIN")
                          if l_0_54 then
                            l_0_54 = sysio
                            l_0_54 = l_0_54.RegExpandUserKey
                            l_0_54 = l_0_54("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
                            local l_0_107 = nil
                            if l_0_54 then
                              for l_0_111,l_0_112 in pairs(l_0_54) do
                                local l_0_108, l_0_109, l_0_110, l_0_111, l_0_112 = nil
                                local l_0_113 = nil
                                -- DECOMPILER ERROR at PC840: Overwrote pending register: R13 in 'AssignReg'

                                -- DECOMPILER ERROR at PC841: Overwrote pending register: R13 in 'AssignReg'

                                if (sysio.RegOpenKey)(l_0_107) then
                                  l_0_108 = (sysio.RegOpenKey)(l_0_107)
                                  l_0_109 = "Start Page"
                                  l_0_107(l_0_108, l_0_109)
                                  -- DECOMPILER ERROR at PC845: Overwrote pending register: R13 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC846: Overwrote pending register: R13 in 'AssignReg'

                                  l_0_108 = (sysio.RegOpenKey)(l_0_107)
                                  l_0_109 = "Start Page"
                                  l_0_110 = "http://www.msn.com/?pc=MSERT1"
                                  l_0_107(l_0_108, l_0_109, l_0_110)
                                end
                              end
                            end
                            do
                              do
                                l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Start Page", "http://www.msn.com/?pc=MSERT1")
                                l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Default_Page_URL", "http://www.msn.com/?pc=MSERT1")
                                l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Default_Search_URL", "http://go.microsoft.com/fwlink/?linkid=42826")
                                l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Search Page", "http://go.microsoft.com/fwlink/?linkid=42826")
                                l_0_5("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main", "Local Page", "http://go.microsoft.com/fwlink/?linkid=42826")
                                l_0_54 = string
                                l_0_54 = l_0_54.match
                                l_0_54 = l_0_54(l_0_0, "Trojan:Win32/Startpage%.TD")
                                if l_0_54 then
                                  l_0_54 = Infrastructure_FixHostsFile
                                  l_0_54()
                                  -- DECOMPILER ERROR at PC887: Confused about usage of register R12 for local variables in 'ReleaseLocals'

                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

