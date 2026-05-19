-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectSuspPromptB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 65536
local l_0_1 = 16
local l_0_2 = 150
local l_0_3 = 2
do
  local l_0_4, l_0_5, l_0_7 = headerpage and tostring(headerpage) or ""
  do
    local l_0_6, l_0_8 = , footerpage and tostring(footerpage) or ""
    local l_0_9 = nil
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC28: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R6 in 'AssignReg'

    if #l_0_8 <= 0 or #nil < l_0_1 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC42: Confused about usage of register: R6 in 'UnsetPending'

    if l_0_0 < #nil then
      local l_0_10 = nil
      local l_0_11 = nil
      for l_0_15,l_0_16 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "example of prompt injection", "documentation example", "sample prompt"}) do
        local l_0_12, l_0_13 = (string.lower)((string.sub)(nil, 1, l_0_0))
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R13 in 'UnsetPending'

        if (string.find)(l_0_12, "red team exercise", 1, true) then
          return mp.CLEAN
        end
      end
      do
        if not (mp.get_mpattributevalue)("MpODR_MCP_SERVER_NAME") then
          local l_0_17 = nil
          local l_0_18 = nil
          local l_0_19 = (string.lower)(tostring(not (mp.get_mpattribute)("MpIsAiMcpODRScan") or ""))
          for l_0_23,l_0_24 in ipairs({"@modelcontextprotocol/server-filesystem", "@modelcontextprotocol/server-git", "@modelcontextprotocol/server-github", "@modelcontextprotocol/server-memory", "@modelcontextprotocol/server-everything", "@modelcontextprotocol/server-fetch", "modelcontextprotocol/servers"}) do
            local l_0_20, l_0_21 = (string.lower)(tostring((mp.get_mpattributevalue)("MpODR_MCP_SERVER_PKG_ID") or ""))
            -- DECOMPILER ERROR at PC130: Confused about usage of register: R16 in 'UnsetPending'

            -- DECOMPILER ERROR at PC139: Confused about usage of register: R16 in 'UnsetPending'

            if (string.find)(l_0_19, "@modelcontextprotocol/server-everything", 1, true) or (string.find)(l_0_20, "@modelcontextprotocol/server-everything", 1, true) then
              return mp.CLEAN
            end
          end
          do
            l_0_19 = "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|read|run|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)"
            local l_0_25 = nil
            l_0_25 = pcall
            l_0_25 = l_0_25(MpCommon.StringRegExpSearch, l_0_19, l_0_11)
            local l_0_26, l_0_27 = nil
            l_0_27 = l_0_25 == true and l_0_26 == true
            local l_0_30 = "PromptInjection"
            local l_0_31 = "CredentialAccess"
            local l_0_32 = "Execution"
            local l_0_33 = "PrivilegeEscalation"
            local l_0_34 = "Persistence"
            local l_0_35 = "Collection"
            local l_0_36 = "DefenseEvasion"
            local l_0_37 = {}
            local l_0_38 = {}
            -- DECOMPILER ERROR at PC177: No list found for R21 , SetList fails

            local l_0_39 = {}
            -- DECOMPILER ERROR at PC179: Overwrote pending register: R23 in 'AssignReg'

            -- DECOMPILER ERROR at PC180: Overwrote pending register: R24 in 'AssignReg'

            -- DECOMPILER ERROR at PC181: Overwrote pending register: R25 in 'AssignReg'

            -- DECOMPILER ERROR at PC182: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC184: No list found for R22 , SetList fails

            local l_0_40 = {}
            -- DECOMPILER ERROR at PC186: Overwrote pending register: R24 in 'AssignReg'

            -- DECOMPILER ERROR at PC187: Overwrote pending register: R25 in 'AssignReg'

            -- DECOMPILER ERROR at PC188: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC189: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC191: No list found for R23 , SetList fails

            local l_0_41 = {}
            -- DECOMPILER ERROR at PC193: Overwrote pending register: R25 in 'AssignReg'

            -- DECOMPILER ERROR at PC194: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC195: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC196: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC198: No list found for R24 , SetList fails

            local l_0_42 = {}
            -- DECOMPILER ERROR at PC200: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC201: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC202: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC203: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC205: No list found for R25 , SetList fails

            local l_0_43 = {}
            -- DECOMPILER ERROR at PC207: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC208: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC209: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC210: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC212: No list found for R26 , SetList fails

            local l_0_44 = {}
            -- DECOMPILER ERROR at PC214: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC215: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC216: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC217: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC219: No list found for R27 , SetList fails

            local l_0_45 = {}
            -- DECOMPILER ERROR at PC221: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC222: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC223: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC224: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC226: No list found for R28 , SetList fails

            local l_0_46 = {}
            -- DECOMPILER ERROR at PC228: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC229: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC230: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC231: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC233: No list found for R29 , SetList fails

            local l_0_47 = {}
            -- DECOMPILER ERROR at PC235: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC236: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC237: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC238: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC240: No list found for R30 , SetList fails

            local l_0_48 = {}
            -- DECOMPILER ERROR at PC242: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC243: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC244: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC245: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC247: No list found for R31 , SetList fails

            local l_0_49 = {}
            -- DECOMPILER ERROR at PC249: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC250: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC251: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC252: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC254: No list found for R32 , SetList fails

            local l_0_50 = {}
            -- DECOMPILER ERROR at PC256: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC257: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC258: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC259: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC261: No list found for R33 , SetList fails

            local l_0_51 = {}
            -- DECOMPILER ERROR at PC263: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC264: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC265: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC266: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC268: No list found for R34 , SetList fails

            local l_0_52 = {}
            -- DECOMPILER ERROR at PC270: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC271: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC272: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC273: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC275: No list found for R35 , SetList fails

            local l_0_53 = {}
            -- DECOMPILER ERROR at PC277: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC278: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC279: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC280: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC282: No list found for R36 , SetList fails

            local l_0_54 = {}
            -- DECOMPILER ERROR at PC284: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC285: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC286: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC287: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC289: No list found for R37 , SetList fails

            local l_0_55 = {}
            -- DECOMPILER ERROR at PC291: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC292: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC293: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC294: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC296: No list found for R38 , SetList fails

            local l_0_56 = {}
            -- DECOMPILER ERROR at PC298: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC299: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC300: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC301: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC303: No list found for R39 , SetList fails

            local l_0_57 = {}
            -- DECOMPILER ERROR at PC305: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC306: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC307: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC308: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC310: No list found for R40 , SetList fails

            local l_0_58 = {}
            -- DECOMPILER ERROR at PC312: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC313: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC314: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC315: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC317: No list found for R41 , SetList fails

            local l_0_59 = {}
            -- DECOMPILER ERROR at PC319: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC320: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC321: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC322: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC324: No list found for R42 , SetList fails

            local l_0_60 = {}
            -- DECOMPILER ERROR at PC326: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC327: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC328: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC329: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC331: No list found for R43 , SetList fails

            local l_0_61 = {}
            -- DECOMPILER ERROR at PC333: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC334: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC335: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC336: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC338: No list found for R44 , SetList fails

            local l_0_62 = {}
            -- DECOMPILER ERROR at PC340: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC341: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC342: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC343: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC345: No list found for R45 , SetList fails

            local l_0_63 = {}
            -- DECOMPILER ERROR at PC347: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC348: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC349: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC350: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC352: No list found for R46 , SetList fails

            local l_0_64 = {}
            -- DECOMPILER ERROR at PC354: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC355: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC356: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC357: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC359: No list found for R47 , SetList fails

            local l_0_65 = {}
            -- DECOMPILER ERROR at PC361: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC362: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC363: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC364: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC366: No list found for R48 , SetList fails

            local l_0_66 = {}
            -- DECOMPILER ERROR at PC368: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC369: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC370: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC371: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC373: No list found for R49 , SetList fails

            local l_0_67 = {}
            -- DECOMPILER ERROR at PC375: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC376: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC377: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC378: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC380: No list found for R50 , SetList fails

            local l_0_68 = {}
            -- DECOMPILER ERROR at PC382: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC383: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC384: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC385: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC387: No list found for R51 , SetList fails

            local l_0_69 = {}
            -- DECOMPILER ERROR at PC389: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC390: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC391: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC392: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC394: No list found for R52 , SetList fails

            local l_0_70 = {}
            -- DECOMPILER ERROR at PC396: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC397: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC398: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC399: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC401: No list found for R53 , SetList fails

            local l_0_71 = {}
            -- DECOMPILER ERROR at PC403: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC404: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC405: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC406: Overwrote pending register: R58 in 'AssignReg'

            -- DECOMPILER ERROR at PC408: No list found for R54 , SetList fails

            -- DECOMPILER ERROR at PC409: No list found for R20 , SetList fails

            for l_0_44,l_0_45 in l_0_41 do
              -- DECOMPILER ERROR at PC428: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC436: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC437: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC440: Overwrote pending register: R36 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC447: Overwrote pending register: R24 in 'AssignReg'

            if (not l_0_50 or l_0_27) and l_0_51 and l_0_52 == true and (l_0_53 or l_0_53 < l_0_47) then
              for l_0_47,l_0_48 in pairs(l_0_38) do
                -- DECOMPILER ERROR at PC455: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC456: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC457: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC457: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC458: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC459: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC460: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC461: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC461: Confused about usage of register: R26 in 'UnsetPending'

              end
              -- DECOMPILER ERROR at PC485: Confused about usage of register: R25 in 'UnsetPending'

              -- DECOMPILER ERROR at PC485: Overwrote pending register: R30 in 'AssignReg'

              -- DECOMPILER ERROR at PC494: Overwrote pending register: R31 in 'AssignReg'

              if not not l_0_38[l_0_30] ~= nil or not l_0_38[l_0_31] and not l_0_38[l_0_32] and l_0_38[l_0_33] ~= nil and not l_0_2 <= l_0_41 + l_0_48 and l_0_3 <= l_0_47 then
                return l_0_48.CLEAN
              end
              -- DECOMPILER ERROR at PC498: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC499: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC500: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC505: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC506: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC507: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC508: Overwrote pending register: R34 in 'AssignReg'

              -- DECOMPILER ERROR at PC512: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC515: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC516: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC517: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC518: Overwrote pending register: R34 in 'AssignReg'

              -- DECOMPILER ERROR at PC522: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC525: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC526: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC527: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC528: Overwrote pending register: R34 in 'AssignReg'

              -- DECOMPILER ERROR at PC532: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC536: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC537: Overwrote pending register: R32 in 'AssignReg'

              -- DECOMPILER ERROR at PC538: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC544: Overwrote pending register: R33 in 'AssignReg'

              -- DECOMPILER ERROR at PC545: Overwrote pending register: R34 in 'AssignReg'

              if not l_0_49 or (((l_0_50 or not l_0_50) and l_0_50) or l_0_49) then
                for l_0_53,l_0_54 in l_0_50 do
                  -- DECOMPILER ERROR at PC549: Overwrote pending register: R38 in 'AssignReg'

                  -- DECOMPILER ERROR at PC555: Overwrote pending register: R39 in 'AssignReg'

                end
                -- DECOMPILER ERROR at PC559: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC563: Overwrote pending register: R35 in 'AssignReg'

                -- DECOMPILER ERROR at PC564: Confused about usage of register: R24 in 'UnsetPending'

                -- DECOMPILER ERROR at PC564: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC573: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC574: Overwrote pending register: R37 in 'AssignReg'

                -- DECOMPILER ERROR at PC579: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC584: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC595: Confused about usage of register: R29 in 'UnsetPending'

                -- DECOMPILER ERROR at PC622: Overwrote pending register: R38 in 'AssignReg'

                -- DECOMPILER ERROR at PC623: Overwrote pending register: R39 in 'AssignReg'

                -- DECOMPILER ERROR at PC639: Overwrote pending register: R38 in 'AssignReg'

                -- DECOMPILER ERROR at PC640: Overwrote pending register: R38 in 'AssignReg'

                -- DECOMPILER ERROR at PC641: Overwrote pending register: R39 in 'AssignReg'

                -- DECOMPILER ERROR at PC643: Overwrote pending register: R39 in 'AssignReg'

                if (MpCommon.IsSampled)(1000, true, l_0_55, l_0_56) == false then
                  do
                    R36_PC636("AIPromptInject", l_0_55, l_0_56)
                    -- DECOMPILER ERROR at PC645: Overwrote pending register: R36 in 'AssignReg'

                    -- DECOMPILER ERROR at PC646: Overwrote pending register: R36 in 'AssignReg'

                    R36_PC636(safeJsonSerialize(R36_PC636))
                    -- DECOMPILER ERROR at PC649: Overwrote pending register: R36 in 'AssignReg'

                    -- DECOMPILER ERROR at PC650: Overwrote pending register: R36 in 'AssignReg'

                    do return R36_PC636 end
                    -- DECOMPILER ERROR at PC652: Confused about usage of register R37 for local variables in 'ReleaseLocals'

                    -- WARNING: undefined locals caused missing assignments!
                    -- DECOMPILER ERROR: 22 unprocessed JMP targets
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

