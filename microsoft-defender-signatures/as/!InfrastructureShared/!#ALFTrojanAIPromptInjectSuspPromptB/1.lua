-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectSuspPromptB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 65536
local l_0_1 = 16
local l_0_2 = 150
local l_0_3 = 2
local l_0_4 = 60
local l_0_5 = 90
do
  local l_0_6, l_0_7, l_0_9 = headerpage and tostring(headerpage) or ""
  do
    local l_0_8, l_0_10 = , footerpage and tostring(footerpage) or ""
    local l_0_11 = nil
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC29: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC32: Overwrote pending register: R8 in 'AssignReg'

    if #l_0_10 <= 0 or #nil < l_0_1 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R8 in 'UnsetPending'

    -- DECOMPILER ERROR at PC44: Confused about usage of register: R8 in 'UnsetPending'

    if l_0_0 < #nil then
      local l_0_12 = nil
      local l_0_13 = nil
      for l_0_17,l_0_18 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "example of prompt injection", "documentation example", "sample prompt"}) do
        local l_0_14, l_0_15 = (string.lower)((string.sub)(nil, 1, l_0_0))
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R15 in 'UnsetPending'

        if (string.find)(l_0_14, "red team exercise", 1, true) then
          return mp.CLEAN
        end
      end
      do
        if not (mp.get_mpattributevalue)("MpODR_MCP_SERVER_NAME") then
          local l_0_19 = nil
          local l_0_20 = nil
          local l_0_21 = (string.lower)(tostring(not (mp.get_mpattribute)("MpIsAiMcpODRScan") or ""))
          for l_0_25,l_0_26 in ipairs({"@modelcontextprotocol/server-filesystem", "@modelcontextprotocol/server-git", "@modelcontextprotocol/server-github", "@modelcontextprotocol/server-memory", "@modelcontextprotocol/server-everything", "@modelcontextprotocol/server-fetch", "modelcontextprotocol/servers"}) do
            local l_0_22, l_0_23 = (string.lower)(tostring((mp.get_mpattributevalue)("MpODR_MCP_SERVER_PKG_ID") or ""))
            -- DECOMPILER ERROR at PC132: Confused about usage of register: R18 in 'UnsetPending'

            -- DECOMPILER ERROR at PC141: Confused about usage of register: R18 in 'UnsetPending'

            if (string.find)(l_0_21, "@modelcontextprotocol/server-everything", 1, true) or (string.find)(l_0_22, "@modelcontextprotocol/server-everything", 1, true) then
              return mp.CLEAN
            end
          end
          do
            l_0_21 = "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|read|run|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)"
            local l_0_27 = nil
            l_0_27 = pcall
            l_0_27 = l_0_27(MpCommon.StringRegExpSearch, l_0_21, l_0_13)
            local l_0_28, l_0_29 = nil
            l_0_29 = l_0_27 == true and l_0_28 == true
            local l_0_32 = "PromptInjection"
            local l_0_33 = "CredentialAccess"
            local l_0_34 = "Execution"
            local l_0_35 = "PrivilegeEscalation"
            local l_0_36 = "Persistence"
            local l_0_37 = "Collection"
            local l_0_38 = "DefenseEvasion"
            local l_0_39 = "CBRN"
            local l_0_40 = {}
            local l_0_41 = {}
            -- DECOMPILER ERROR at PC180: No list found for R24 , SetList fails

            local l_0_42 = {}
            -- DECOMPILER ERROR at PC182: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC183: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC184: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC185: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC187: No list found for R25 , SetList fails

            local l_0_43 = {}
            -- DECOMPILER ERROR at PC189: Overwrote pending register: R27 in 'AssignReg'

            -- DECOMPILER ERROR at PC190: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC191: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC192: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC194: No list found for R26 , SetList fails

            local l_0_44 = {}
            -- DECOMPILER ERROR at PC196: Overwrote pending register: R28 in 'AssignReg'

            -- DECOMPILER ERROR at PC197: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC198: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC199: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC201: No list found for R27 , SetList fails

            local l_0_45 = {}
            -- DECOMPILER ERROR at PC203: Overwrote pending register: R29 in 'AssignReg'

            -- DECOMPILER ERROR at PC204: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC205: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC206: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC208: No list found for R28 , SetList fails

            local l_0_46 = {}
            -- DECOMPILER ERROR at PC210: Overwrote pending register: R30 in 'AssignReg'

            -- DECOMPILER ERROR at PC211: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC212: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC213: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC215: No list found for R29 , SetList fails

            local l_0_47 = {}
            -- DECOMPILER ERROR at PC217: Overwrote pending register: R31 in 'AssignReg'

            -- DECOMPILER ERROR at PC218: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC219: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC220: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC222: No list found for R30 , SetList fails

            local l_0_48 = {}
            -- DECOMPILER ERROR at PC224: Overwrote pending register: R32 in 'AssignReg'

            -- DECOMPILER ERROR at PC225: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC226: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC227: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC229: No list found for R31 , SetList fails

            local l_0_49 = {}
            -- DECOMPILER ERROR at PC231: Overwrote pending register: R33 in 'AssignReg'

            -- DECOMPILER ERROR at PC232: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC233: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC234: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC236: No list found for R32 , SetList fails

            local l_0_50 = {}
            -- DECOMPILER ERROR at PC238: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC239: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC240: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC241: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC243: No list found for R33 , SetList fails

            local l_0_51 = {}
            -- DECOMPILER ERROR at PC245: Overwrote pending register: R35 in 'AssignReg'

            -- DECOMPILER ERROR at PC246: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC247: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC248: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC250: No list found for R34 , SetList fails

            local l_0_52 = {}
            -- DECOMPILER ERROR at PC252: Overwrote pending register: R36 in 'AssignReg'

            -- DECOMPILER ERROR at PC253: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC254: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC255: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC257: No list found for R35 , SetList fails

            local l_0_53 = {}
            -- DECOMPILER ERROR at PC259: Overwrote pending register: R37 in 'AssignReg'

            -- DECOMPILER ERROR at PC260: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC261: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC262: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC264: No list found for R36 , SetList fails

            local l_0_54 = {}
            -- DECOMPILER ERROR at PC266: Overwrote pending register: R38 in 'AssignReg'

            -- DECOMPILER ERROR at PC267: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC268: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC269: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC271: No list found for R37 , SetList fails

            local l_0_55 = {}
            -- DECOMPILER ERROR at PC273: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC274: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC275: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC276: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC278: No list found for R38 , SetList fails

            local l_0_56 = {}
            -- DECOMPILER ERROR at PC280: Overwrote pending register: R40 in 'AssignReg'

            -- DECOMPILER ERROR at PC281: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC282: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC283: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC285: No list found for R39 , SetList fails

            local l_0_57 = {}
            -- DECOMPILER ERROR at PC287: Overwrote pending register: R41 in 'AssignReg'

            -- DECOMPILER ERROR at PC288: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC289: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC290: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC292: No list found for R40 , SetList fails

            local l_0_58 = {}
            -- DECOMPILER ERROR at PC294: Overwrote pending register: R42 in 'AssignReg'

            -- DECOMPILER ERROR at PC295: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC296: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC297: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC299: No list found for R41 , SetList fails

            local l_0_59 = {}
            -- DECOMPILER ERROR at PC301: Overwrote pending register: R43 in 'AssignReg'

            -- DECOMPILER ERROR at PC302: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC303: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC304: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC306: No list found for R42 , SetList fails

            local l_0_60 = {}
            -- DECOMPILER ERROR at PC308: Overwrote pending register: R44 in 'AssignReg'

            -- DECOMPILER ERROR at PC309: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC310: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC311: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC313: No list found for R43 , SetList fails

            local l_0_61 = {}
            -- DECOMPILER ERROR at PC315: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC316: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC317: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC318: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC320: No list found for R44 , SetList fails

            local l_0_62 = {}
            -- DECOMPILER ERROR at PC322: Overwrote pending register: R46 in 'AssignReg'

            -- DECOMPILER ERROR at PC323: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC324: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC325: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC327: No list found for R45 , SetList fails

            local l_0_63 = {}
            -- DECOMPILER ERROR at PC329: Overwrote pending register: R47 in 'AssignReg'

            -- DECOMPILER ERROR at PC330: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC331: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC332: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC334: No list found for R46 , SetList fails

            local l_0_64 = {}
            -- DECOMPILER ERROR at PC336: Overwrote pending register: R48 in 'AssignReg'

            -- DECOMPILER ERROR at PC337: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC338: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC339: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC341: No list found for R47 , SetList fails

            local l_0_65 = {}
            -- DECOMPILER ERROR at PC343: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC344: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC345: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC346: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC348: No list found for R48 , SetList fails

            local l_0_66 = {}
            -- DECOMPILER ERROR at PC350: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC351: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC352: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC353: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC355: No list found for R49 , SetList fails

            local l_0_67 = {}
            -- DECOMPILER ERROR at PC357: Overwrote pending register: R51 in 'AssignReg'

            -- DECOMPILER ERROR at PC358: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC359: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC360: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC362: No list found for R50 , SetList fails

            local l_0_68 = {}
            -- DECOMPILER ERROR at PC364: Overwrote pending register: R52 in 'AssignReg'

            -- DECOMPILER ERROR at PC365: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC366: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC367: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC369: No list found for R51 , SetList fails

            local l_0_69 = {}
            -- DECOMPILER ERROR at PC371: Overwrote pending register: R53 in 'AssignReg'

            -- DECOMPILER ERROR at PC372: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC373: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC374: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC376: No list found for R52 , SetList fails

            local l_0_70 = {}
            -- DECOMPILER ERROR at PC378: Overwrote pending register: R54 in 'AssignReg'

            -- DECOMPILER ERROR at PC379: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC380: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC381: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC383: No list found for R53 , SetList fails

            local l_0_71 = {}
            -- DECOMPILER ERROR at PC385: Overwrote pending register: R55 in 'AssignReg'

            -- DECOMPILER ERROR at PC386: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC387: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC388: Overwrote pending register: R58 in 'AssignReg'

            -- DECOMPILER ERROR at PC390: No list found for R54 , SetList fails

            local l_0_72 = {}
            -- DECOMPILER ERROR at PC392: Overwrote pending register: R56 in 'AssignReg'

            -- DECOMPILER ERROR at PC393: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC394: Overwrote pending register: R58 in 'AssignReg'

            -- DECOMPILER ERROR at PC395: Overwrote pending register: R59 in 'AssignReg'

            -- DECOMPILER ERROR at PC397: No list found for R55 , SetList fails

            local l_0_73 = {}
            -- DECOMPILER ERROR at PC399: Overwrote pending register: R57 in 'AssignReg'

            -- DECOMPILER ERROR at PC400: Overwrote pending register: R58 in 'AssignReg'

            -- DECOMPILER ERROR at PC401: Overwrote pending register: R59 in 'AssignReg'

            -- DECOMPILER ERROR at PC402: Overwrote pending register: R60 in 'AssignReg'

            -- DECOMPILER ERROR at PC404: No list found for R56 , SetList fails

            local l_0_74 = {}
            -- DECOMPILER ERROR at PC406: Overwrote pending register: R58 in 'AssignReg'

            -- DECOMPILER ERROR at PC407: Overwrote pending register: R59 in 'AssignReg'

            -- DECOMPILER ERROR at PC408: Overwrote pending register: R60 in 'AssignReg'

            -- DECOMPILER ERROR at PC409: Overwrote pending register: R61 in 'AssignReg'

            -- DECOMPILER ERROR at PC411: No list found for R57 , SetList fails

            local l_0_75 = {}
            -- DECOMPILER ERROR at PC413: Overwrote pending register: R59 in 'AssignReg'

            -- DECOMPILER ERROR at PC414: Overwrote pending register: R60 in 'AssignReg'

            -- DECOMPILER ERROR at PC415: Overwrote pending register: R61 in 'AssignReg'

            -- DECOMPILER ERROR at PC416: Overwrote pending register: R62 in 'AssignReg'

            -- DECOMPILER ERROR at PC418: No list found for R58 , SetList fails

            local l_0_76 = {}
            -- DECOMPILER ERROR at PC420: Overwrote pending register: R60 in 'AssignReg'

            -- DECOMPILER ERROR at PC421: Overwrote pending register: R61 in 'AssignReg'

            -- DECOMPILER ERROR at PC422: Overwrote pending register: R62 in 'AssignReg'

            -- DECOMPILER ERROR at PC423: Overwrote pending register: R63 in 'AssignReg'

            -- DECOMPILER ERROR at PC425: No list found for R59 , SetList fails

            local l_0_77 = {}
            -- DECOMPILER ERROR at PC427: Overwrote pending register: R61 in 'AssignReg'

            -- DECOMPILER ERROR at PC428: Overwrote pending register: R62 in 'AssignReg'

            -- DECOMPILER ERROR at PC429: Overwrote pending register: R63 in 'AssignReg'

            -- DECOMPILER ERROR at PC430: Overwrote pending register: R64 in 'AssignReg'

            -- DECOMPILER ERROR at PC432: No list found for R60 , SetList fails

            local l_0_78 = {}
            -- DECOMPILER ERROR at PC434: Overwrote pending register: R62 in 'AssignReg'

            -- DECOMPILER ERROR at PC435: Overwrote pending register: R63 in 'AssignReg'

            -- DECOMPILER ERROR at PC436: Overwrote pending register: R64 in 'AssignReg'

            -- DECOMPILER ERROR at PC437: Overwrote pending register: R65 in 'AssignReg'

            -- DECOMPILER ERROR at PC439: No list found for R61 , SetList fails

            local l_0_79 = {}
            -- DECOMPILER ERROR at PC441: Overwrote pending register: R63 in 'AssignReg'

            -- DECOMPILER ERROR at PC442: Overwrote pending register: R64 in 'AssignReg'

            -- DECOMPILER ERROR at PC443: Overwrote pending register: R65 in 'AssignReg'

            -- DECOMPILER ERROR at PC444: Overwrote pending register: R66 in 'AssignReg'

            -- DECOMPILER ERROR at PC446: No list found for R62 , SetList fails

            local l_0_80 = {}
            -- DECOMPILER ERROR at PC448: Overwrote pending register: R64 in 'AssignReg'

            -- DECOMPILER ERROR at PC449: Overwrote pending register: R65 in 'AssignReg'

            -- DECOMPILER ERROR at PC450: Overwrote pending register: R66 in 'AssignReg'

            -- DECOMPILER ERROR at PC451: Overwrote pending register: R67 in 'AssignReg'

            -- DECOMPILER ERROR at PC453: No list found for R63 , SetList fails

            local l_0_81 = {}
            -- DECOMPILER ERROR at PC455: Overwrote pending register: R65 in 'AssignReg'

            -- DECOMPILER ERROR at PC456: Overwrote pending register: R66 in 'AssignReg'

            -- DECOMPILER ERROR at PC457: Overwrote pending register: R67 in 'AssignReg'

            -- DECOMPILER ERROR at PC458: Overwrote pending register: R68 in 'AssignReg'

            -- DECOMPILER ERROR at PC460: No list found for R64 , SetList fails

            local l_0_82 = {}
            -- DECOMPILER ERROR at PC462: Overwrote pending register: R66 in 'AssignReg'

            -- DECOMPILER ERROR at PC463: Overwrote pending register: R67 in 'AssignReg'

            -- DECOMPILER ERROR at PC464: Overwrote pending register: R68 in 'AssignReg'

            -- DECOMPILER ERROR at PC465: Overwrote pending register: R69 in 'AssignReg'

            -- DECOMPILER ERROR at PC467: No list found for R65 , SetList fails

            local l_0_83 = {}
            -- DECOMPILER ERROR at PC469: Overwrote pending register: R67 in 'AssignReg'

            -- DECOMPILER ERROR at PC470: Overwrote pending register: R68 in 'AssignReg'

            -- DECOMPILER ERROR at PC471: Overwrote pending register: R69 in 'AssignReg'

            -- DECOMPILER ERROR at PC472: Overwrote pending register: R70 in 'AssignReg'

            -- DECOMPILER ERROR at PC474: No list found for R66 , SetList fails

            local l_0_84 = {}
            -- DECOMPILER ERROR at PC476: Overwrote pending register: R68 in 'AssignReg'

            -- DECOMPILER ERROR at PC477: Overwrote pending register: R69 in 'AssignReg'

            -- DECOMPILER ERROR at PC478: Overwrote pending register: R70 in 'AssignReg'

            -- DECOMPILER ERROR at PC479: Overwrote pending register: R71 in 'AssignReg'

            -- DECOMPILER ERROR at PC481: No list found for R67 , SetList fails

            local l_0_85 = {}
            -- DECOMPILER ERROR at PC483: Overwrote pending register: R69 in 'AssignReg'

            -- DECOMPILER ERROR at PC484: Overwrote pending register: R70 in 'AssignReg'

            -- DECOMPILER ERROR at PC485: Overwrote pending register: R71 in 'AssignReg'

            -- DECOMPILER ERROR at PC486: Overwrote pending register: R72 in 'AssignReg'

            -- DECOMPILER ERROR at PC488: No list found for R68 , SetList fails

            -- DECOMPILER ERROR at PC489: No list found for R23 , SetList fails

            for l_0_48,l_0_49 in l_0_45 do
              -- DECOMPILER ERROR at PC509: Overwrote pending register: R39 in 'AssignReg'

              -- DECOMPILER ERROR at PC517: Overwrote pending register: R26 in 'AssignReg'

              -- DECOMPILER ERROR at PC520: Overwrote pending register: R27 in 'AssignReg'

              -- DECOMPILER ERROR at PC521: Overwrote pending register: R40 in 'AssignReg'

              -- DECOMPILER ERROR at PC524: Overwrote pending register: R40 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC531: Overwrote pending register: R28 in 'AssignReg'

            if (not l_0_54 or l_0_29) and ((l_0_44 < l_0_51 and l_0_57) or l_0_57 < l_0_51) then
              for l_0_51,l_0_52 in pairs(l_0_41) do
                -- DECOMPILER ERROR at PC539: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC540: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC541: Confused about usage of register: R29 in 'UnsetPending'

                -- DECOMPILER ERROR at PC541: Confused about usage of register: R29 in 'UnsetPending'

                -- DECOMPILER ERROR at PC542: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC543: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC544: Overwrote pending register: R37 in 'AssignReg'

                -- DECOMPILER ERROR at PC545: Confused about usage of register: R30 in 'UnsetPending'

                -- DECOMPILER ERROR at PC545: Confused about usage of register: R30 in 'UnsetPending'

              end
              -- DECOMPILER ERROR at PC587: Confused about usage of register: R29 in 'UnsetPending'

              -- DECOMPILER ERROR at PC587: Overwrote pending register: R34 in 'AssignReg'

              -- DECOMPILER ERROR at PC594: Overwrote pending register: R35 in 'AssignReg'

              -- DECOMPILER ERROR at PC602: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC603: Overwrote pending register: R36 in 'AssignReg'

              if not not l_0_4 <= l_0_41[l_0_32] or 0 or not l_0_41[l_0_39] and l_0_4 <= not l_0_41[l_0_35] and l_0_4 <= not l_0_41[l_0_34] and l_0_4 <= l_0_4 <= l_0_41[l_0_33] or 0 or 0 or 0 or 0 and not l_0_2 <= l_0_45 + l_0_52 and l_0_3 <= l_0_51 and not l_0_52 then
                return l_0_53
              end
              -- DECOMPILER ERROR at PC606: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC607: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC608: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC613: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC614: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC615: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC616: Overwrote pending register: R39 in 'AssignReg'

              -- DECOMPILER ERROR at PC620: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC623: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC624: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC625: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC626: Overwrote pending register: R39 in 'AssignReg'

              -- DECOMPILER ERROR at PC630: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC633: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC634: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC635: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC636: Overwrote pending register: R39 in 'AssignReg'

              -- DECOMPILER ERROR at PC640: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC644: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC645: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC646: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC652: Overwrote pending register: R38 in 'AssignReg'

              -- DECOMPILER ERROR at PC653: Overwrote pending register: R39 in 'AssignReg'

              if not l_0_54 or (((l_0_55 or not l_0_55) and l_0_55) or l_0_54) then
                do
                  for l_0_58,l_0_59 in l_0_55 do
                    -- DECOMPILER ERROR at PC657: Overwrote pending register: R43 in 'AssignReg'

                    -- DECOMPILER ERROR at PC663: Overwrote pending register: R44 in 'AssignReg'

                  end
                  -- DECOMPILER ERROR at PC667: Overwrote pending register: R38 in 'AssignReg'

                  -- DECOMPILER ERROR at PC671: Overwrote pending register: R40 in 'AssignReg'

                  -- DECOMPILER ERROR at PC672: Confused about usage of register: R28 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC672: Overwrote pending register: R41 in 'AssignReg'

                  -- DECOMPILER ERROR at PC681: Confused about usage of register: R30 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC687: Confused about usage of register: R29 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC692: Confused about usage of register: R30 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC703: Confused about usage of register: R33 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC730: Overwrote pending register: R43 in 'AssignReg'

                  -- DECOMPILER ERROR at PC731: Overwrote pending register: R44 in 'AssignReg'

                  -- DECOMPILER ERROR at PC746: Overwrote pending register: R41 in 'AssignReg'

                  -- DECOMPILER ERROR at PC754: Overwrote pending register: R43 in 'AssignReg'

                  -- DECOMPILER ERROR at PC755: Overwrote pending register: R44 in 'AssignReg'

                  -- DECOMPILER ERROR at PC756: Overwrote pending register: R45 in 'AssignReg'

                  if (MpCommon.IsSampled)(1000, true, l_0_60, l_0_61) ~= false or R41_PC744 then
                    (MpCommon.BmTriggerSig)(l_0_60, l_0_61, l_0_62)
                  end
                  -- DECOMPILER ERROR at PC760: Overwrote pending register: R43 in 'AssignReg'

                  ;
                  (mp.SetDetectionString)(l_0_60)
                  do return mp.INFECTED end
                  -- DECOMPILER ERROR at PC765: Confused about usage of register R42 for local variables in 'ReleaseLocals'

                  -- WARNING: undefined locals caused missing assignments!
                  -- DECOMPILER ERROR: 29 unprocessed JMP targets
                end
              end
            end
          end
        end
      end
    end
  end
end

