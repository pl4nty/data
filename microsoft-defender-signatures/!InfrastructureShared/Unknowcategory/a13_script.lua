-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a13_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if type(l_1_1) == "table" then
    if l_1_2 == nil then
      l_1_2 = 4
    end
    return l_1_0 ~= nil and l_1_1 ~= nil and l_1_2 <= #l_1_0 and l_1_1[(string.sub)(l_1_0, -l_1_2)] ~= nil
  end
  do return l_1_1 == "" or (string.sub)(l_1_0, -(string.len)(l_1_1)) == l_1_1 end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  do return (string.sub)(l_2_0, 1, (string.len)(l_2_1)) == l_2_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_2 = (skip.get_contextdata)(skip.CONTEXT_DATA_SCANREASON)
if l_0_2 == skip.SCANREASON_AMSI then
  local l_0_3 = (skip.get_contextdata)(skip.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_3 ~= nil then
    l_0_3 = (string.lower)(l_0_3)
    if l_0_3 == "exchange server 2019" or l_0_3 == "exchange server 2016" then
      local l_0_4 = (string.lower)((skip.get_contextdata)(skip.CONTEXT_DATA_AMSI_CONTENTNAME))
      if l_0_4 ~= nil then
        l_0_4 = (string.lower)(l_0_4)
        if l_0_1(l_0_4, "urlpath:/mapi/emsmdb") or l_0_1(l_0_4, "urlpath:/rpc/rpcproxy.dll") or l_0_1(l_0_4, "urlpath:/owa/service.svc") then
          return true
        end
      end
    end
  end
end
do
  if l_0_2 ~= skip.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_2 ~= skip.SCANREASON_ONOPEN and l_0_2 ~= skip.SCANREASON_ONMOUNT then
    return 0
  end
  if (skip.get_contextdata)(skip.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
    return 0
  end
  local l_0_5 = function(l_3_0, l_3_1)
  -- function num : 0_2
  if l_3_0 == "excel.exe" or l_3_0 == "winword.exe" or l_3_0 == "powerpnt.exe" or l_3_0 == "outlook.exe" or l_3_0 == "msaccess.exe" or l_3_0 == "mspub.exe" or l_3_0 == "onenote.exe" then
    if l_3_1:find("^\\device\\harddiskvolume%d*\\program files\\microsoft office\\root\\office") ~= nil then
      return true
    end
    if l_3_1:find("^\\device\\harddiskvolume%d*\\program files %(x86%)\\microsoft office\\root\\office") ~= nil then
      return true
    end
    if l_3_1:find("^\\device\\harddiskvolume%d*\\program files\\windowsapps\\microsoft%.office%.desktop%.") ~= nil then
      return true
    end
  end
  return false
end

  local l_0_6 = (string.lower)((skip.get_contextdata)(skip.CONTEXT_DATA_FILEPATH))
  local l_0_7 = (skip.get_contextdata)(skip.CONTEXT_DATA_PROCESS_ID)
  if l_0_7 == 4 and l_0_2 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs") ~= nil and l_0_6 ~= nil and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs" ~= nil then
    return 1
  end
  local l_0_8 = (string.lower)((skip.get_contextdata)(skip.CONTEXT_DATA_FILENAME))
  if l_0_8 == "pagefile.sys" or l_0_8 == "hiberfil.sys" or l_0_8 == "swapfile.sys" then
    if l_0_6:match("^\\device\\harddiskvolumeshadowcopy%d*$") ~= nil then
      return 1
    end
    if l_0_6:match("^\\device\\harddiskvolume%d*$") ~= nil then
      return 1
    end
  end
  local l_0_9 = (string.lower)((skip.get_contextdata)(skip.CONTEXT_DATA_PROCESSNAME))
  if l_0_9 == "rundll32.exe" or l_0_9 == "dllhost.exe" or l_0_9 == "regsvr32.exe" or l_0_9 == "cscript.exe" or l_0_9 == "jscript.exe" or l_0_9 == "cmd.exe" or l_0_9 == "curl.exe" or l_0_9 == "powershell.exe" or l_0_9 == "powershell_ise.exe" or l_0_9 == "wscript.exe" or l_0_9 == "mshta.exe" or l_0_9 == "csc.exe" or l_0_9 == "jsc.exe" or l_0_9 == "vbc.exe" then
    return 0
  end
  local l_0_10 = (string.lower)((skip.get_contextdata)(skip.CONTEXT_DATA_PROCESSDEVICEPATH))
  if l_0_2 == 1 then
    if l_0_9 == "wmiprvse.exe" and l_0_10:match("^\\device\\harddiskvolume(.*)\\windows") ~= nil and l_0_8:match("^dr%d*$") then
      return 1
    end
    return 0
  end
  if l_0_9 == "software_reporter_tool.exe" and l_0_10:find("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\google\\chrome\\user data\\swreporter") ~= nil then
    return 1
  end
  if l_0_2 == skip.SCANREASON_ONOPEN and l_0_9 == "idwutil_600.exe" and l_0_0(l_0_10, "\\program files (x86)\\idrivewindows\\cmd_dutil") then
    return 1
  end
  if l_0_2 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE and not (skip.IsHipsRuleEnabled)("56a863a9-875e-4185-98a7-b882c64b5ce5") then
    if l_0_5(l_0_9, l_0_10) and not (skip.IsHipsRuleEnabled)("3b576869-a4ec-4529-8536-b80a7769e899") and not (skip.IsHipsRuleEnabled)("92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B") and not (skip.IsHipsRuleEnabled)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") and not (skip.IsHipsRuleEnabled)("c28bf0fb-388c-438b-a41d-8688461af900") and not l_0_0(l_0_8, ".xoml") then
      return 1
    end
    do
      if (((string.find)(l_0_10, "\\program files\\7-zip", 1, true) == nil and (string.find)(l_0_10, "\\program files (x86)\\7-zip", 1, true) == nil and not (string.find)(l_0_9, "rar.exe", 1, true) == nil and (string.sub)(l_0_9, 1, 2) ~= "7z") or ((string.sub)(l_0_9, 1, 2) == "7z" and l_0_9 ~= "7z.exe" and l_0_9 ~= "7za.exe" and l_0_9 ~= "7zfm.exe" and l_0_9 ~= "7zg.exe" and (string.find)(l_0_9, "7z%d%d%d%d%-x64%.exe") == nil and (string.find)(l_0_9, "7z%d%d%d%d%.exe") ~= nil) or not (string.find)(l_0_10, "\\program files\\winrar", 1, true) ~= nil or (string.find)(l_0_10, "\\program files (x86)\\winrar", 1, true) ~= nil or l_0_9 == "rar.exe" or l_0_9 == "unrar.exe" or l_0_9 == "winrar.exe") and not (skip.IsHipsRuleEnabled)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") and not (skip.IsHipsRuleEnabled)("5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
        return 1
      end
      -- DECOMPILER ERROR at PC400: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC409: Confused about usage of register: R7 in 'UnsetPending'

      if (string.find)(l_0_9, "setup", 1, true) ~= nil or (string.find)(l_0_9, "install", 1, true) ~= nil then
        return 1
      end
      if (string.find)(l_0_6, "\\program files", 1, true) ~= nil then
        if l_0_6:match("^\\device\\harddiskvolume%d*\\program files\\") ~= nil then
          return 1
        end
        if l_0_6:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\") ~= nil then
          return 1
        end
      end
      if l_0_1(l_0_6, "\\device\\mup\\") then
        return 1
      end
      -- DECOMPILER ERROR at PC452: Confused about usage of register: R8 in 'UnsetPending'

      if (string.find)(l_0_10, "\\programdata\\ul\\pcmark", 1, true) ~= nil then
        return 1
      end
      -- DECOMPILER ERROR at PC463: Confused about usage of register: R8 in 'UnsetPending'

      -- DECOMPILER ERROR at PC472: Confused about usage of register: R8 in 'UnsetPending'

      if (string.find)(l_0_10, "\\program files\\windowsapps\\", 1, true) ~= nil or (string.find)(l_0_10, "\\windows\\systemapps\\", 1, true) ~= nil then
        return 1
      end
      -- DECOMPILER ERROR at PC482: Confused about usage of register: R7 in 'UnsetPending'

      if l_0_0(l_0_9, ".tmp") then
        if l_0_0(l_0_8, ".tmp") then
          return 1
        end
        if l_0_6:match("^\\device\\harddiskvolume%d*\\program files\\") ~= nil then
          return 1
        end
        if l_0_6:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\") ~= nil then
          return 1
        end
      end
      -- DECOMPILER ERROR at PC512: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC519: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC525: Confused about usage of register: R7 in 'UnsetPending'

      if (string.sub)(l_0_9, 1, 4) == "npp." and (l_0_0(l_0_9, ".installer.x64.exe") or l_0_0(l_0_9, ".installer.exe")) then
        return 1
      end
      -- DECOMPILER ERROR at PC534: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC542: Confused about usage of register: R7 in 'UnsetPending'

      if (string.sub)(l_0_9, 1, 7) == "rstudio" and (string.find)(l_0_9, "rstudio%d%.exe") ~= nil then
        return 1
      end
      if l_0_0(l_0_8, ".html") or l_0_0(l_0_8, ".js") or l_0_0(l_0_8, ".css") then
        if (string.find)(l_0_6, "\\doc\\", 1, true) ~= nil then
          return 1
        end
        if (string.find)(l_0_6, "\\docs\\", 1, true) ~= nil then
          return 1
        end
      end
      do
        local l_0_19, l_0_20 = nil
        if l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") ~= nil and l_0_6 ~= nil and not l_0_0(l_0_8, ".mptest") and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") == l_0_20:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") and l_0_6 == l_0_20 then
          return 1
        end
        -- DECOMPILER ERROR at PC613: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC620: Confused about usage of register: R7 in 'UnsetPending'

        if (string.sub)(l_0_19, 1, 4) == "npp." then
          if l_0_0(l_0_19, ".installer.exe") and (string.find)(l_0_6, "^\\device\\harddiskvolume%d*\\program files %(x86%)\\notepad%+%+") ~= nil then
            return 1
          end
          -- DECOMPILER ERROR at PC635: Confused about usage of register: R7 in 'UnsetPending'

          if l_0_0(l_0_19, ".installer.x64.exe") and (string.find)(l_0_6, "^\\device\\harddiskvolume%d*\\program files\\notepad%+%+") ~= nil then
            return 1
          end
        end
        -- DECOMPILER ERROR at PC650: Confused about usage of register: R8 in 'UnsetPending'

        -- DECOMPILER ERROR at PC657: Confused about usage of register: R8 in 'UnsetPending'

        if (l_0_0(l_0_20, "\\windows\\system32") or (string.find)(l_0_20, "\\program files\\windowsapps\\", 1, true) ~= nil) and (string.find)(l_0_6, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC675: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC678: Confused about usage of register: R8 in 'UnsetPending'

        if l_0_19 == "runtimebroker.exe" and l_0_0(l_0_20, "\\windows\\system32") and (string.find)(l_0_6, "appdata\\roaming\\microsoft\\systemcertificates\\my\\certificates", 1, true) ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC694: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_19 == "waworkerhost.exe" then
          if (string.find)(l_0_6, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
            return 1
          end
          if l_0_8:match("^%d*$") then
            return 1
          end
        end
        -- DECOMPILER ERROR at PC714: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_19 == "microsoft.office.web.certificatemanager.exe" and l_0_6:match("^\\device\\harddiskvolume(.*)\\programdata\\microsoft\\crypto\\rsa\\machinekeys") ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC723: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC726: Confused about usage of register: R8 in 'UnsetPending'

        if l_0_19 == "pingsender.exe" and l_0_0(l_0_20, "\\program files\\mozilla firefox") and (string.find)(l_0_6, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC742: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC744: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_19 == "streaminganalysis.servicefabrichost.exe" or l_0_19 == "batchanalysis.servicefabrichost.exe") and ((string.find)(l_0_6, "\\saapp\\streamingstaticanalysisservice\\work\\", 1, true) ~= nil or (string.find)(l_0_6, "\\saapp\\batchstaticanalysisservice\\work\\", 1, true) ~= nil) then
          return 1
        end
        -- DECOMPILER ERROR at PC766: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_19 == "microsoft.dataverse.copilot.indexing.textdata.exe" and (string.find)(l_0_6, "\\temp\\copilottextextraction\\", 1, true) ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC779: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_19 == "microsoft.dataverse.search.orchestratorservice.exe" and (string.find)(l_0_6, "\\temp\\relevancesearchtextextraction\\", 1, true) ~= nil then
          return 1
        end
        -- DECOMPILER ERROR at PC792: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC795: Confused about usage of register: R8 in 'UnsetPending'

        if l_0_19 == "chrome.exe" then
          if l_0_0(l_0_20, "\\google\\chrome\\application") and (string.find)(l_0_6, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
            return 1
          end
          local l_0_21 = nil
          -- DECOMPILER ERROR at PC818: Confused about usage of register: R8 in 'UnsetPending'

          if l_0_6 ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\google\\chrome\\user data") ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\google\\chrome\\user data") == l_0_20:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\google\\chrome\\application") then
            return 1
          end
        end
        -- DECOMPILER ERROR at PC825: Confused about usage of register: R7 in 'UnsetPending'

        do
          if l_0_21 == "doubao.exe" then
            local l_0_22 = nil
            -- DECOMPILER ERROR at PC834: Confused about usage of register: R8 in 'UnsetPending'

            if l_0_6 ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\doubao\\user data") ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\doubao\\user data") == l_0_20:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\doubao\\application") then
              return 1
            end
          end
          -- DECOMPILER ERROR at PC841: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC843: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC846: Confused about usage of register: R8 in 'UnsetPending'

          if l_0_22 == "msedge.exe" or l_0_22 == "msedgewebview2.exe" then
            if l_0_0(l_0_20, "\\application") and (string.find)(l_0_6, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
              return 1
            end
            local l_0_23, l_0_24 = nil
            local l_0_26, l_0_27, l_0_28 = l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\user data")
            if l_0_27 ~= nil and l_0_26 ~= nil and l_0_26 == l_0_24:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application") and l_0_27 == l_0_24 and l_0_28 == "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application" then
              return 1
            end
            local l_0_25 = nil
            l_0_26 = l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application")
            if l_0_27 ~= nil and l_0_26 ~= nil and l_0_26 == l_0_25 and l_0_27 == l_0_24 and l_0_28 == "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application" then
              return 1
            end
            -- DECOMPILER ERROR at PC901: Overwrote pending register: R10 in 'AssignReg'

            l_0_26 = l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
            if l_0_27 ~= nil and l_0_26 ~= nil and l_0_26 == l_0_25 and l_0_27 == l_0_24 and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application" ~= nil then
              return 1
            end
            -- DECOMPILER ERROR at PC918: Overwrote pending register: R10 in 'AssignReg'

            l_0_26 = l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages")
            if l_0_27 ~= nil and l_0_26 ~= nil and l_0_26 == l_0_25 and l_0_27 == l_0_24 and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application" ~= nil then
              return 1
            end
            l_0_26 = l_0_6:match("^\\device\\harddiskvolume(.*)\\windows\\fonts")
            if l_0_26 ~= nil and l_0_26 == l_0_25 and l_0_24 ~= nil and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application" ~= nil then
              return 1
            end
          end
          -- DECOMPILER ERROR at PC946: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC948: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC950: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC952: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC954: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC956: Confused about usage of register: R8 in 'UnsetPending'

          -- DECOMPILER ERROR at PC956: Overwrote pending register: R10 in 'AssignReg'

          -- DECOMPILER ERROR at PC957: Overwrote pending register: R11 in 'AssignReg'

          do
            if l_0_23 == "onedrive.exe" or l_0_23 == "filecoauth.exe" or l_0_23 == "onedrivesetup.exe" or l_0_23 == "onedrivefilelauncher.exe" or l_0_23 == "onedrivestandaloneupdater.exe" then
              local l_0_29, l_0_30 = nil
              if l_0_24:match(l_0_28) ~= nil and l_0_27 ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\onedrive") == l_0_24:match(l_0_28) and l_0_6 == l_0_27 then
                return 1
              end
            end
            -- DECOMPILER ERROR at PC972: Confused about usage of register: R7 in 'UnsetPending'

            if l_0_29 == "nuget.exe" and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.nuget\\packages") ~= nil and l_0_6 ~= nil then
              return 1
            end
            -- DECOMPILER ERROR at PC983: Confused about usage of register: R7 in 'UnsetPending'

            do
              if l_0_29 == "vlc-cache-gen.exe" then
                local l_0_31, l_0_32 = nil
                if l_0_6:match("^\\device\\harddiskvolume(.*)\\program files([^\\]*)\\videolan\\vlc") ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files([^\\]*)\\videolan\\vlc") == l_0_32:match("^\\device\\harddiskvolume(.*)\\program files([^\\]*)\\videolan\\vlc") and l_0_6 == l_0_32 and (l_0_6 == "" or l_0_6 == " (x86)" or l_0_6 == " (arm)") then
                  return 1
                end
              end
              -- DECOMPILER ERROR at PC1005: Confused about usage of register: R7 in 'UnsetPending'

              do
                if l_0_31 == "installer.exe" then
                  local l_0_33, l_0_34 = nil
                  if l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\roaming\\zoom") ~= nil and l_0_6 ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\roaming\\zoom") == l_0_34:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") and l_0_6 == l_0_34 then
                    return 1
                  end
                end
                -- DECOMPILER ERROR at PC1025: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1032: Confused about usage of register: R7 in 'UnsetPending'

                if (string.sub)(l_0_33, 1, 5) == "gimp-" and l_0_0(l_0_33, "-setup.tmp") and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files\\gimp 2") ~= nil then
                  return 1
                end
                -- DECOMPILER ERROR at PC1044: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1046: Confused about usage of register: R7 in 'UnsetPending'

                do
                  if (l_0_33 == "setup.exe" or l_0_33 == "un_a.exe") and l_0_2 == skip.SCANREASON_ONOPEN then
                    local l_0_35, l_0_36 = nil
                    -- DECOMPILER ERROR at PC1067: Unhandled construct in 'MakeBoolean' P1

                    if l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") ~= nil and l_0_6 ~= nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") == l_0_36:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") and l_0_6 == l_0_36 then
                      return 1
                    end
                  end
                  -- DECOMPILER ERROR at PC1086: Confused about usage of register: R9 in 'UnsetPending'

                  if ((l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") == nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla ") ~= nil) or l_0_6:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\mozilla ") ~= nil) and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\mozilla ") == l_0_36:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp") and l_0_36 ~= nil then
                    return 1
                  end
                  -- DECOMPILER ERROR at PC1093: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1094: Confused about usage of register: R8 in 'UnsetPending'

                  if l_0_5(l_0_35, l_0_36) == true then
                    if l_0_6:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\packages") ~= nil then
                      return 1
                    end
                    if l_0_6:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\temp\\photocache") ~= nil then
                      return 1
                    end
                    if l_0_6:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\microsoft\\office") ~= nil then
                      return 1
                    end
                    if l_0_6:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\microsoft\\msipc") ~= nil then
                      return 1
                    end
                    if l_0_6:find("microsoft\\cryptneturlcache\\", 1, true) ~= nil then
                      return 1
                    end
                  end
                  -- DECOMPILER ERROR at PC1135: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1137: Confused about usage of register: R8 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1142: Confused about usage of register: R8 in 'UnsetPending'

                  if l_0_35 == "officeclicktorun.exe" then
                    do
                      if l_0_36:match("^\\device\\harddiskvolume(.*)\\program files\\common files\\microsoft shared\\clicktorun") == nil then
                        local l_0_37 = nil
                      end
                      -- DECOMPILER ERROR at PC1175: Confused about usage of register: R9 in 'UnsetPending'

                      if (((l_0_6:match("^\\device\\harddiskvolume(.*)\\program files\\common files\\microsoft shared\\clicktorun\\updates") == nil and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\common files\\microsoft shared\\clicktorun\\updates") ~= nil) or l_0_6:match("^\\device\\harddiskvolume(.*)\\programdata\\microsoft\\clicktorun") == nil) and l_0_6:match("^\\device\\harddiskvolume(.*)\\program files\\microsoft office") ~= nil) or l_0_6:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\microsoft office") == l_0_36:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\common files\\microsoft shared\\clicktorun") then
                        return 1
                      end
                      if l_0_0(l_0_8, ".pf") then
                        if l_0_7 == 4 then
                          return 1
                        end
                        -- DECOMPILER ERROR at PC1196: Confused about usage of register: R7 in 'UnsetPending'

                        if l_0_6:match("^\\device\\harddiskvolume(.*)\\windows\\prefetch") ~= nil then
                          if l_0_1(l_0_8, l_0_37) then
                            return 1
                          end
                          -- DECOMPILER ERROR at PC1202: Confused about usage of register: R8 in 'UnsetPending'

                          if l_0_36:match("^\\device\\harddiskvolume(.*)\\windows") ~= nil then
                            return 1
                          end
                        end
                      end
                      if l_0_0(l_0_8, ".log") or l_0_0(l_0_8, ".log1") or l_0_0(l_0_8, ".log2") or l_0_0(l_0_8, ".cat") or l_0_0(l_0_8, ".sqm") or l_0_0(l_0_8, ".etl") or l_0_0(l_0_8, ".db") or l_0_0(l_0_8, ".db3") or l_0_0(l_0_8, ".db-wal") or l_0_0(l_0_8, ".db3-wal") or l_0_0(l_0_8, ".db-journal") or l_0_0(l_0_8, ".db3-journal") or l_0_0(l_0_8, ".bin") or l_0_0(l_0_8, ".dat") or l_0_0(l_0_8, ".dmp") or l_0_0(l_0_8, ".data") or l_0_0(l_0_8, ".mui") or l_0_0(l_0_8, ".edb") or l_0_0(l_0_8, ".chk") or l_0_0(l_0_8, ".ini") or l_0_0(l_0_8, ".evtx") or l_0_0(l_0_8, ".manifest") or l_0_0(l_0_8, ".hve") or l_0_0(l_0_8, ".tmp.xml") or l_0_0(l_0_8, ".tmp.werinternalmetadata.xml") or l_0_0(l_0_8, ".hdmp") or l_0_0(l_0_8, ".dmp") or l_0_0(l_0_8, ".wer") or l_0_0(l_0_8, ".sdb") or l_0_0(l_0_8, ".tmp.appcompat.txt") then
                        do
                          if l_0_7 == 4 then
                            local l_0_38 = nil
                            if not (skip.get_contextdata)(39) or (skip.get_contextdata)(39) == "" then
                              return 1
                            end
                          end
                          -- DECOMPILER ERROR at PC1401: Confused about usage of register: R7 in 'UnsetPending'

                          if l_0_38 == "svchost.exe" and l_0_8 == "gpt.ini" and l_0_6:match("^\\device\\mup\\") then
                            return 0
                          end
                          -- DECOMPILER ERROR at PC1412: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC1414: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC1416: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC1418: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC1420: Confused about usage of register: R7 in 'UnsetPending'

                          if (l_0_38 == "processhacker.exe" or l_0_38 == "powershell.exe" or l_0_38 == "powershell_ise.exe" or l_0_38 == "dllhost.exe" or l_0_38 == "rundll32.exe") and l_0_0(l_0_8, ".dmp") then
                            return 0
                          end
                          -- DECOMPILER ERROR at PC1430: Confused about usage of register: R8 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC1435: Confused about usage of register: R8 in 'UnsetPending'

                          if l_0_36:match("^\\device\\harddiskvolume(.*)\\windows\\system32") ~= nil or l_0_36:match("^\\\\%?\\volume{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\windows\\system32") ~= nil then
                            return 1
                          end
                          -- DECOMPILER ERROR at PC1443: Confused about usage of register: R7 in 'UnsetPending'

                          if l_0_38 == "firefox.exe" then
                            if l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\([^\\]*)\\mozilla\\firefox") ~= nil and l_0_6 ~= nil and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\([^\\]*)\\mozilla\\firefox" ~= nil then
                              return 1
                            end
                            -- DECOMPILER ERROR at PC1456: Confused about usage of register: R8 in 'UnsetPending'

                            if l_0_36:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla firefox") ~= nil then
                              if l_0_6:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla firefox") ~= nil then
                                return 1
                              end
                              if l_0_0(l_0_8, ".mui") or l_0_0(l_0_8, ".ttf") or l_0_0(l_0_8, ".icm") or l_0_0(l_0_8, ".db") or l_0_0(l_0_8, ".bin") then
                                return 1
                              end
                            end
                          end
                          -- DECOMPILER ERROR at PC1504: Confused about usage of register: R7 in 'UnsetPending'

                          local l_0_39 = nil
                          if (string.find)(l_0_38, ".", 1, true) == nil and (l_0_39 == "cp" or l_0_39 == "dash" or l_0_39 == "node" or l_0_39 == "npm" or l_0_39 == "grep" or l_0_39 == "cat" or l_0_39 == "dpkg" or l_0_39 == "dpkg-query" or l_0_39 == "sudo" or l_0_39 == "apt" or l_0_39 == "store" or l_0_39 == "apt-extracttemplates" or l_0_39 == "perl" or l_0_39 == "systemd-hwdb" or l_0_39 == "ldconfig" or l_0_39 == "update-alternatives") then
                            local l_0_40, l_0_41, l_0_42 = , l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs")
                            if l_0_42 ~= nil and l_0_6 ~= nil and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs" ~= nil then
                              local l_0_43, l_0_44 = nil
                              -- DECOMPILER ERROR at PC1562: Overwrote pending register: R13 in 'AssignReg'

                              if ("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs\\usr\\bin" ~= nil or l_0_42 == l_0_40:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs\\usr\\bin")) and l_0_43 == R14_PC1565 and l_0_44 == R15_PC1567 then
                                return 1
                              end
                            end
                          end
                          do
                            if l_0_39 == "firefox.exe" or l_0_39 == "gimp-2.8.exe" or l_0_39 == "soffice.bin" or l_0_39 == "chrome.exe" then
                              local l_0_45, l_0_46 = nil
                              -- DECOMPILER ERROR at PC1593: Overwrote pending register: R14 in 'AssignReg'

                              if l_0_6:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\chops\\dlc\\([^\\]*)\\") ~= nil and l_0_6 ~= nil then
                                if l_0_6:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\chops\\dlc\\([^\\]*)\\") == l_0_45:match(R14_PC1565) or l_0_6 == l_0_45 then
                                  return R14_PC1565
                                end
                                -- DECOMPILER ERROR at PC1595: Overwrote pending register: R14 in 'AssignReg'

                                R15_PC1567 = l_0_45
                                R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\tmp")
                                if R14_PC1565 == l_0_6:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\chops\\dlc\\([^\\]*)\\") then
                                  R14_PC1565 = 1
                                  return R14_PC1565
                                end
                              end
                            end
                            -- DECOMPILER ERROR at PC1605: Confused about usage of register: R8 in 'UnsetPending'

                            do
                              if l_0_39 == "code.exe" then
                                local l_0_47, l_0_48 = nil
                                -- DECOMPILER ERROR at PC1619: Overwrote pending register: R14 in 'AssignReg'

                                if l_0_45:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code") ~= nil and l_0_45 ~= nil then
                                  if l_0_6:match(R14_PC1565) == l_0_45:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code") and l_0_6 == l_0_45 then
                                    return R14_PC1565
                                  end
                                  -- DECOMPILER ERROR at PC1621: Overwrote pending register: R14 in 'AssignReg'

                                  R15_PC1567 = l_0_6
                                  R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code")
                                  if R14_PC1565 == l_0_45:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code") and R13_PC1628 == l_0_45 then
                                    R14_PC1565 = 1
                                    return R14_PC1565
                                  end
                                  R14_PC1565, R15_PC1567 = l_0_6:match, l_0_6
                                  R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.vscode\\")
                                  R13_PC1628 = 
                                  if R14_PC1565 == l_0_45:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code") and R13_PC1628 == l_0_45 then
                                    R14_PC1565 = 1
                                    return R14_PC1565
                                  end
                                end
                              end
                              -- DECOMPILER ERROR at PC1645: Confused about usage of register: R8 in 'UnsetPending'

                              do
                                if l_0_39 == "code - insiders.exe" then
                                  local l_0_49, l_0_50 = nil
                                  -- DECOMPILER ERROR at PC1659: Overwrote pending register: R14 in 'AssignReg'

                                  if l_0_47:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code insiders") ~= nil and l_0_47 ~= nil then
                                    if l_0_6:match(R14_PC1565) == l_0_47:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code insiders") and R13_PC1628 == l_0_47 then
                                      return R14_PC1565
                                    end
                                    -- DECOMPILER ERROR at PC1661: Overwrote pending register: R14 in 'AssignReg'

                                    R15_PC1567 = l_0_6
                                    R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code insiders")
                                    -- DECOMPILER ERROR at PC1664: Overwrote pending register: R13 in 'AssignReg'

                                    if R14_PC1565 == l_0_47:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code insiders") and R13_PC1628 == l_0_47 then
                                      R14_PC1565 = 1
                                      return R14_PC1565
                                    end
                                    R14_PC1565, R15_PC1567 = l_0_6:match, l_0_6
                                    R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.vscode-insiders\\")
                                    -- DECOMPILER ERROR at PC1675: Overwrote pending register: R13 in 'AssignReg'

                                    if R14_PC1565 == l_0_47:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\microsoft vs code insiders") and R13_PC1628 == l_0_47 then
                                      R14_PC1565 = 1
                                      return R14_PC1565
                                    end
                                  end
                                end
                                -- DECOMPILER ERROR at PC1685: Confused about usage of register: R8 in 'UnsetPending'

                                do
                                  if l_0_39 == "rustup.exe" then
                                    local l_0_51, l_0_52 = nil
                                    -- DECOMPILER ERROR at PC1692: Overwrote pending register: R13 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC1699: Overwrote pending register: R14 in 'AssignReg'

                                    if l_0_49:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.cargo\\bin") ~= nil and l_0_49 ~= nil and l_0_6:match(R14_PC1565) == l_0_49:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.cargo\\bin") and R13_PC1628 == l_0_49 then
                                      return R14_PC1565
                                    end
                                  end
                                  -- DECOMPILER ERROR at PC1703: Confused about usage of register: R8 in 'UnsetPending'

                                  do
                                    if l_0_39 == "teams.exe" then
                                      local l_0_53, l_0_54 = nil
                                      -- DECOMPILER ERROR at PC1710: Overwrote pending register: R13 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC1711: Overwrote pending register: R14 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC1717: Overwrote pending register: R14 in 'AssignReg'

                                      if l_0_51:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams") ~= nil and l_0_51 ~= nil then
                                        if l_0_6:match(R14_PC1565) == l_0_51:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams") and R13_PC1628 == l_0_51 then
                                          return R14_PC1565
                                        end
                                        -- DECOMPILER ERROR at PC1719: Overwrote pending register: R14 in 'AssignReg'

                                        R15_PC1567 = l_0_6
                                        R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams")
                                        if R14_PC1565 == l_0_51:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams") and R15_PC1567 == l_0_51 then
                                          return 1
                                        end
                                      end
                                    end
                                    -- DECOMPILER ERROR at PC1731: Confused about usage of register: R8 in 'UnsetPending'

                                    if l_0_39 == "dllhost.exe" and l_0_0(l_0_53, "\\windows\\system32") then
                                      if l_0_6:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\microsoftwindows.client.cbs_cw5n1h2txyewy\\appdata\\cachestorage") ~= nil and l_0_6 ~= nil then
                                        return 1
                                      end
                                      -- DECOMPILER ERROR at PC1745: Overwrote pending register: R13 in 'AssignReg'

                                      if l_0_6:match(R14_PC1565) ~= nil and R11_PC1752 ~= nil then
                                        return 1
                                      end
                                    end
                                    -- DECOMPILER ERROR at PC1758: Confused about usage of register: R8 in 'UnsetPending'

                                    do
                                      if l_0_39 == "notepad.exe" then
                                        local l_0_55 = nil
                                        -- DECOMPILER ERROR at PC1763: Overwrote pending register: R13 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1764: Overwrote pending register: R14 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1768: Overwrote pending register: R14 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1771: Overwrote pending register: R14 in 'AssignReg'

                                        if l_0_53:match("^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepad\\notepad.exe$") ~= nil then
                                          if l_0_6:match(R14_PC1565) == l_0_53:match("^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepad\\notepad.exe$") and R13_PC1628 ~= R14_PC1565 then
                                            return R14_PC1565
                                          end
                                          -- DECOMPILER ERROR at PC1773: Overwrote pending register: R14 in 'AssignReg'

                                          R15_PC1567 = l_0_6
                                          R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepadxamlui\\")
                                          if R14_PC1565 == l_0_53:match("^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepad\\notepad.exe$") and R15_PC1567 == R11_PC1752 then
                                            return 1
                                          end
                                        end
                                      end
                                      -- DECOMPILER ERROR at PC1791: Confused about usage of register: R8 in 'UnsetPending'

                                      -- DECOMPILER ERROR at PC1791: Overwrote pending register: R11 in 'AssignReg'

                                      do
                                        if l_0_39 == "_conda.exe" or l_0_39 == "python.exe" or l_0_39 == "pythonw.exe" then
                                          local l_0_56, l_0_57 = nil
                                          -- DECOMPILER ERROR at PC1800: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1807: Overwrote pending register: R14 in 'AssignReg'

                                          if l_0_55:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\miniconda%d") ~= nil and R11_PC1752 ~= nil and l_0_6:match(R14_PC1565) == l_0_55:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\miniconda%d") and R13_PC1628 == R11_PC1752 then
                                            return R14_PC1565
                                          end
                                          -- DECOMPILER ERROR at PC1809: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1810: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1812: Overwrote pending register: R11 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1820: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1821: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1823: Confused about usage of register: R10 in 'UnsetPending'

                                          -- DECOMPILER ERROR at PC1827: Overwrote pending register: R14 in 'AssignReg'

                                          if l_0_56:match(R14_PC1565) ~= nil and R11_PC1752 ~= nil and l_0_6:match(R14_PC1565) == l_0_56:match(R14_PC1565) and R13_PC1628 == R11_PC1752 then
                                            return R14_PC1565
                                          end
                                          -- DECOMPILER ERROR at PC1829: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1830: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1836: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1837: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1839: Confused about usage of register: R10 in 'UnsetPending'

                                          -- DECOMPILER ERROR at PC1841: Overwrote pending register: R13 in 'AssignReg'

                                          if l_0_56:match(R14_PC1565) ~= nil and l_0_6:match(R14_PC1565) == l_0_56:match(R14_PC1565) then
                                            return R13_PC1628
                                          end
                                          -- DECOMPILER ERROR at PC1843: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1844: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1850: Overwrote pending register: R13 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1851: Overwrote pending register: R14 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC1853: Confused about usage of register: R10 in 'UnsetPending'

                                          -- DECOMPILER ERROR at PC1855: Overwrote pending register: R13 in 'AssignReg'

                                          if l_0_56:match(R14_PC1565) ~= nil and l_0_6:match(R14_PC1565) == l_0_56:match(R14_PC1565) then
                                            return R13_PC1628
                                          end
                                        end
                                        -- DECOMPILER ERROR at PC1860: Overwrote pending register: R11 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1863: Overwrote pending register: R11 in 'AssignReg'

                                        if l_0_39 == "machinelocalwatchdog.exe" and (l_0_8:match("%w*")) ~= R11_PC1752 then
                                          return 1
                                        end
                                        -- DECOMPILER ERROR at PC1871: Overwrote pending register: R11 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1874: Overwrote pending register: R11 in 'AssignReg'

                                        if l_0_39 == "savservice.exe" and (l_0_8:match("%w*")) ~= R11_PC1752 then
                                          return 1
                                        end
                                        -- DECOMPILER ERROR at PC1885: Overwrote pending register: R11 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC1888: Overwrote pending register: R11 in 'AssignReg'

                                        if (l_0_39 == "postgres.exe" or l_0_39 == "postgresinstanceagentrunnerhost.exe") and (l_0_8:match("%w*")) ~= R11_PC1752 then
                                          return 1
                                        end
                                        -- DECOMPILER ERROR at PC1902: Confused about usage of register: R8 in 'UnsetPending'

                                        -- DECOMPILER ERROR at PC1902: Overwrote pending register: R11 in 'AssignReg'

                                        do
                                          if l_0_39 == "javaw.exe" or l_0_39 == "java.exe" or l_0_39 == "javac.exe" then
                                            local l_0_58, l_0_59 = nil
                                            -- DECOMPILER ERROR at PC1905: Overwrote pending register: R13 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC1908: Overwrote pending register: R13 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC1911: Overwrote pending register: R13 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC1914: Overwrote pending register: R14 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC1914: Overwrote pending register: R13 in 'AssignReg'

                                            if l_0_56:match("^\\device\\harddiskvolume(.*)\\(.*)\\java\\jdk([^\\]*)\\bin") ~= R13_PC1628 and R11_PC1752 ~= R13_PC1628 and "^\\device\\harddiskvolume(.*)\\(.*)\\java\\jdk([^\\]*)\\bin" ~= R13_PC1628 then
                                              R15_PC1567 = "^\\device\\harddiskvolume(.*)\\(.*)\\eclipse\\%d+.%d+\\"
                                              R13_PC1628 = R13_PC1628(R14_PC1565, R15_PC1567)
                                              if R13_PC1628 == l_0_56:match("^\\device\\harddiskvolume(.*)\\(.*)\\java\\jdk([^\\]*)\\bin") and R14_PC1565 == R11_PC1752 then
                                                R15_PC1567 = 1
                                                return R15_PC1567
                                              end
                                              R15_PC1567 = R15_PC1567(l_0_6, "^\\device\\harddiskvolume(.*)\\(.*)\\java\\gwdlso\\")
                                              if R15_PC1567 == l_0_56:match("^\\device\\harddiskvolume(.*)\\(.*)\\java\\jdk([^\\]*)\\bin") and l_0_6 == R11_PC1752 then
                                                return 1
                                              end
                                            end
                                          end
                                          -- DECOMPILER ERROR at PC1943: Confused about usage of register: R8 in 'UnsetPending'

                                          -- DECOMPILER ERROR at PC1943: Overwrote pending register: R11 in 'AssignReg'

                                          do
                                            if l_0_39 == "svchost.exe" or l_0_39 == "lsass.exe" or l_0_39 == "services.exe" or l_0_39 == "taskhostw.exe" then
                                              local l_0_60 = nil
                                              -- DECOMPILER ERROR at PC1946: Overwrote pending register: R11 in 'AssignReg'

                                              -- DECOMPILER ERROR at PC1949: Overwrote pending register: R11 in 'AssignReg'

                                              if (l_0_58:match("^\\\\%?\\volume(.*)\\windows\\system32")) ~= R11_PC1752 then
                                                R11_PC1752 = R11_PC1752(l_0_6, R13_PC1628)
                                                if R11_PC1752 == (l_0_58:match("^\\\\%?\\volume(.*)\\windows\\system32")) then
                                                  return 1
                                                end
                                                -- DECOMPILER ERROR at PC1956: Overwrote pending register: R13 in 'AssignReg'

                                                -- DECOMPILER ERROR at PC1957: Overwrote pending register: R14 in 'AssignReg'

                                                -- DECOMPILER ERROR at PC1961: Overwrote pending register: R13 in 'AssignReg'

                                                if l_0_6:match(R14_PC1565) == (l_0_58:match("^\\\\%?\\volume(.*)\\windows\\system32")) then
                                                  return R13_PC1628
                                                end
                                                -- DECOMPILER ERROR at PC1963: Overwrote pending register: R14 in 'AssignReg'

                                                -- DECOMPILER ERROR at PC1963: Overwrote pending register: R13 in 'AssignReg'

                                                R15_PC1567 = "^\\device\\harddiskvolume(.*)\\windows"
                                                R13_PC1628 = (R13_PC1628(R14_PC1565, R15_PC1567))
                                                -- DECOMPILER ERROR at PC1966: Overwrote pending register: R14 in 'AssignReg'

                                                -- DECOMPILER ERROR at PC1969: Overwrote pending register: R14 in 'AssignReg'

                                                if R13_PC1628 ~= R14_PC1565 then
                                                  return R14_PC1565
                                                end
                                                -- DECOMPILER ERROR at PC1971: Overwrote pending register: R14 in 'AssignReg'

                                                R15_PC1567 = l_0_6
                                                R14_PC1565 = (R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\programdata"))
                                                R15_PC1567 = nil
                                                if R14_PC1565 ~= R15_PC1567 then
                                                  R15_PC1567 = 1
                                                  return R15_PC1567
                                                end
                                              end
                                            end
                                            -- DECOMPILER ERROR at PC1982: Confused about usage of register: R8 in 'UnsetPending'

                                            do
                                              if l_0_39 == "fusion360.exe" then
                                                local l_0_61, l_0_62 = nil
                                                -- DECOMPILER ERROR at PC1998: Overwrote pending register: R14 in 'AssignReg'

                                                if l_0_60:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\autodesk\\webdeploy\\production") ~= nil and R11_PC1752 ~= nil then
                                                  if l_0_6:match(R14_PC1565) == l_0_60:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\autodesk\\webdeploy\\production") and R13_PC1628 == R11_PC1752 then
                                                    return R14_PC1565
                                                  end
                                                  -- DECOMPILER ERROR at PC2000: Overwrote pending register: R14 in 'AssignReg'

                                                  R15_PC1567 = l_0_6
                                                  R14_PC1565 = R14_PC1565(R15_PC1567, "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\fusionstreamer\\")
                                                  -- DECOMPILER ERROR at PC2003: Overwrote pending register: R13 in 'AssignReg'

                                                  if R14_PC1565 == l_0_60:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\autodesk\\webdeploy\\production") and R13_PC1628 == R11_PC1752 then
                                                    R14_PC1565 = 1
                                                    return R14_PC1565
                                                  end
                                                end
                                              end
                                              -- DECOMPILER ERROR at PC2017: Confused about usage of register: R8 in 'UnsetPending'

                                              -- DECOMPILER ERROR at PC2017: Overwrote pending register: R11 in 'AssignReg'

                                              do
                                                if l_0_39 == "irsetup.exe" and l_0_8 == "ultraedit setup log.txt" then
                                                  local l_0_63, l_0_64 = nil
                                                  -- DECOMPILER ERROR at PC2020: Overwrote pending register: R13 in 'AssignReg'

                                                  -- DECOMPILER ERROR at PC2023: Overwrote pending register: R13 in 'AssignReg'

                                                  -- DECOMPILER ERROR at PC2026: Overwrote pending register: R13 in 'AssignReg'

                                                  -- DECOMPILER ERROR at PC2029: Overwrote pending register: R13 in 'AssignReg'

                                                  if l_0_61:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\([^\\]*)") ~= R13_PC1628 and R11_PC1752 ~= R13_PC1628 and "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\([^\\]*)" ~= R13_PC1628 then
                                                    R14_PC1565 = l_0_6
                                                    R15_PC1567 = "^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp"
                                                    R13_PC1628 = R13_PC1628(R14_PC1565, R15_PC1567)
                                                    if R13_PC1628 == l_0_61:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\([^\\]*)") and R14_PC1565 == R11_PC1752 then
                                                      R15_PC1567 = 1
                                                      return R15_PC1567
                                                    end
                                                  end
                                                end
                                                -- DECOMPILER ERROR at PC2047: Confused about usage of register: R8 in 'UnsetPending'

                                                -- DECOMPILER ERROR at PC2047: Overwrote pending register: R11 in 'AssignReg'

                                                do
                                                  do
                                                    if l_0_8 == "update.log" and (l_0_39 == "blackdesertlauncher.exe" or l_0_39 == "blackdesertpatcher32.pae") then
                                                      local l_0_65 = nil
                                                      -- DECOMPILER ERROR at PC2050: Overwrote pending register: R11 in 'AssignReg'

                                                      -- DECOMPILER ERROR at PC2053: Overwrote pending register: R11 in 'AssignReg'

                                                      if (l_0_63:match("^\\device\\harddiskvolume(.*)\\pearlabyss\\blackdesert")) ~= R11_PC1752 then
                                                        R11_PC1752 = R11_PC1752(l_0_6, R13_PC1628)
                                                        if R11_PC1752 == (l_0_63:match("^\\device\\harddiskvolume(.*)\\pearlabyss\\blackdesert")) then
                                                          return 1
                                                        end
                                                      end
                                                    end
                                                    do return 0 end
                                                    -- DECOMPILER ERROR at PC2062: freeLocal<0 in 'ReleaseLocals'

                                                    -- DECOMPILER ERROR: 131 unprocessed JMP targets
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
                end
              end
            end
          end
        end
      end
    end
  end
end

