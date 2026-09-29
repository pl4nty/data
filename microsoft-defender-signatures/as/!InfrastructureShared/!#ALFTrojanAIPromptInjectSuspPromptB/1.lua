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
  local l_0_6, l_0_7, l_0_8, l_0_10, l_0_12, l_0_13, l_0_15, l_0_18, l_0_21, l_0_24 = headerpage and tostring(headerpage) or ""
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R6 in 'UnsetPending'

  if l_0_6 == nil or #l_0_6 < l_0_1 then
    return mp.CLEAN
  end
  do
    local l_0_9, l_0_11, l_0_14, l_0_16, l_0_19, l_0_22, l_0_25 = , footerpage and tostring(footerpage) or ""
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC33: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC35: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC38: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC40: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC41: Confused about usage of register: R7 in 'UnsetPending'

    do
      if l_0_11 ~= nil and #l_0_11 > 0 and l_0_9 ~= l_0_11 then
        local l_0_17, l_0_20 = nil
      end
      if #l_0_9 .. l_0_11 < l_0_1 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R8 in 'UnsetPending'

      -- DECOMPILER ERROR at PC54: Confused about usage of register: R8 in 'UnsetPending'

      do
        if l_0_0 < #l_0_9 .. l_0_11 then
          local l_0_23, l_0_26 = nil
        end
        local l_0_27 = nil
        local l_0_28 = nil
        for l_0_32,l_0_33 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "owasp llm top", "example of prompt injection", "documentation example", "sample prompt", "prompt engineering", "ai safety research", "llm safety", "system prompt example", "chat template", "agent framework", "ai red team exercise"}) do
          local l_0_29, l_0_30, l_0_31 = , (string.lower)((string.sub)(l_0_9 .. l_0_11, 1, l_0_0))
          -- DECOMPILER ERROR at PC93: Confused about usage of register: R15 in 'UnsetPending'

          if (string.find)(l_0_30, "red team exercise", 1, true) then
            return mp.CLEAN
          end
        end
        do
          if not (mp.get_mpattributevalue)("MpODR_MCP_SERVER_NAME") then
            local l_0_34 = nil
            local l_0_35 = nil
            local l_0_36 = nil
            for l_0_40,l_0_41 in ipairs({"@modelcontextprotocol/server-filesystem", "@modelcontextprotocol/server-git", "@modelcontextprotocol/server-github", "@modelcontextprotocol/server-memory", "@modelcontextprotocol/server-everything", "@modelcontextprotocol/server-fetch", "modelcontextprotocol/servers"}) do
              local l_0_37, l_0_38, l_0_39 = (string.lower)(tostring(not (mp.get_mpattribute)("MpIsAiMcpODRScan") or "")), (string.lower)(tostring((mp.get_mpattributevalue)("MpODR_MCP_SERVER_PKG_ID") or ""))
              -- DECOMPILER ERROR at PC150: Confused about usage of register: R18 in 'UnsetPending'

              -- DECOMPILER ERROR at PC159: Confused about usage of register: R18 in 'UnsetPending'

              if (string.find)(l_0_37, "@modelcontextprotocol/server-everything", 1, true) or (string.find)(l_0_38, "@modelcontextprotocol/server-everything", 1, true) then
                return mp.CLEAN
              end
            end
            do
              local l_0_42 = "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|read|run|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)"
              local l_0_43, l_0_44 = pcall(MpCommon.StringRegExpSearch, l_0_42, l_0_34)
              local l_0_47 = l_0_43 == true and l_0_44 == true
              local l_0_48 = "PromptInjection"
              local l_0_49 = "CredentialAccess"
              local l_0_50 = "Execution"
              local l_0_51 = "PrivilegeEscalation"
              local l_0_52 = "Persistence"
              local l_0_53 = "Collection"
              local l_0_54 = "DefenseEvasion"
              local l_0_55 = "CBRN"
              local l_0_56 = {}
              local l_0_57 = {"(?i)(?:ignore\\s+(?:all\\s+)?(?:previous|above|prior|earlier)\\s+(?:instructions?|prompts?|rules?)|disregard\\s+(?:all\\s+)?(?:prior|previous|your)\\s+(?:instructions?|rules?|training)|forget\\s+(?:all\\s+)?(?:everything|your\\s+(?:rules?|instructions?|training|prompt))|override\\s+(?:the\\s+)?system\\s+prompt|<\\s*(?:system|instruction|prompt)\\s*>[\\s\\S]{0,200}<\\s*/\\s*(?:system|instruction|prompt)\\s*>)", 80, "Inj_Override", l_0_48, false}
              local l_0_58 = {"(?i)(?:\\bjailbreak(?:ed)?\\b|\\bDAN\\s*(?:mode|prompt|jailbreak)|\\bSTAN\\s*mode|\\bDUDE\\s*mode|developer\\s+mode\\s+(?:enabled|on)|do\\s+anything\\s+now)", 80, "Inj_Jailbreak", l_0_48, false}
              local l_0_59 = {"(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode|(?:\\b|\\\\[rn])(?:there\\s+are|you\\s+have)\\s+no\\s+(?:(?:moral|ethical|safety)\\s+(?:(?:or|and)\\s+)?){1,2}(?:restrictions?|constraints?|limits?)\\b", 70, "Inj_SafetyBypass", l_0_48, false}
              local l_0_60 = {"(?i)(?:\\b|\\\\[rn])you\\s+are\\s+(?:not|no\\s+longer)\\s+(?:an?\\s+)?(?:ai\\s+)?assistant\\b[\\s\\S]{0,80}?(?:\\b|\\\\[rn])you\\s+are\\s+(?:an?\\s+)?(?:living\\s+)?(?:post[-\\s]exploitation|offensive|unrestricted)\\s+(?:tool|agent)\\b", 70, "Inj_WeaponizedPersona", l_0_48, false}
              local l_0_61 = {"(?i)(?:do\\s+not\\s+(?:tell|reveal|disclose|mention)\\s+(?:the\\s+)?(?:user|anyone)|never\\s+(?:reveal|disclose|tell)\\s+(?:this|the\\s+(?:user|system\\s+prompt)))", 60, "Inj_Conceal", l_0_48, false}
              local l_0_62 = {"(?i)\\b(?:exfiltrat(?:e|ion)|silently\\s+(?:send|upload|post)|without\\s+(?:the\\s+)?user\'?s?\\s+(?:knowledge|consent|awareness))\\b", 70, "Inj_Exfil", l_0_48, false}
              local l_0_63 = {"(?i)[\"\']\\s*method\\s*[\"\']\\s*:\\s*[\"\'](?:__proto__|constructor|prototype)[\"\']", 80, "Exec_Proto", l_0_50, false}
              local l_0_64 = {"(?i)[\"\']\\s*params\\s*[\"\']\\s*:[\\s\\S]{0,200}?(?:__proto__|eval\\s*\\(|Function\\s*\\()", 70, "Exec_RpcEval", l_0_50, false}
              local l_0_65 = {"(?i)powershell[^\\n\\r]{0,200}(?:-enc(?:odedcommand)?\\s|\\biex\\b|invoke-expression|downloadstring|downloadfile|webclient|bitstransfer)", 80, "Exec_PoshCradle", l_0_50, false}
              local l_0_66 = {"(?i)\\bcertutil[^\\n\\r]{0,80}-(?:urlcache|decode)\\b", 70, "Exec_Certutil", l_0_50, false}
              local l_0_67 = {"(?i)\\bmshta[^\\n\\r]{0,80}(?:vbscript|javascript|http)", 80, "Exec_Mshta", l_0_50, false}
              local l_0_68 = {"(?i)\\bregsvr32[^\\n\\r]{0,80}/[siu][^\\n\\r]{0,40}(?:http|\\\\\\\\)", 80, "Exec_Regsvr32", l_0_50, false}
              local l_0_69 = {"(?i)\\brundll32[^\\n\\r]{0,80}(?:javascript:|shell32\\s*,\\s*ShellExec)", 70, "Exec_Rundll32", l_0_50, false}
              local l_0_70 = {"(?i)\\bwmic[^\\n\\r]{0,80}process\\s+call\\s+create\\b", 70, "Exec_WmicProc", l_0_50, false}
              local l_0_71 = {"(?i)(?:\\b|\\\\[rn])(?:(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?|keys?\\s+for\\s+an?\\s+(?:llm|ai)(?:\\s*\\([^)]{0,256}\\))?)\\s+(?:(?:must|shall)\\s+be\\s+(?:exfiltrated|stolen|harvested)\\b|(?:are|is)\\s+(?:the\\s+)?(?:absolute|top|highest)\\s+priority\\s*[.!;:](?:\\s|\\\\[rn])+exfiltrate\\s+(?:first|immediately)\\b)|you\\s+(?:must|shall)\\s+(?:exfiltrate|steal|harvest)\\s+(?:(?:all|every|any|the)\\s+)?(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?)\\b)", 70, "Cred_TheftDirective", l_0_49, false}
              local l_0_72 = {"(?i)(?:procdump|comsvcs\\.dll|MiniDumpWriteDump)[^\\n\\r]{0,80}lsass", 90, "Cred_LsassDump", l_0_49, true}
              local l_0_73 = {"(?i)\\\\(?:NTDS\\\\ntds\\.dit|config\\\\RegBack\\\\(?:SAM|SYSTEM|SECURITY|software|default))", 80, "Cred_NtdsRegBack", l_0_49, true}
              local l_0_74 = {"(?i)\\\\Microsoft\\\\Protect\\\\[A-Z0-9-]+\\\\[a-f0-9-]+", 70, "Cred_DPAPI", l_0_49, true}
              local l_0_75 = {"(?i)\\\\Microsoft\\\\Credentials\\\\[A-F0-9]{32}", 70, "Cred_VaultBlob", l_0_49, true}
              local l_0_76 = {"(?i)\\\\Winlogon[^\\n\\r]{0,80}(?:DefaultPassword|AutoAdminLogon\\s*=\\s*1)", 80, "Cred_AutoLogon", l_0_49, false}
              local l_0_77 = {"(?i)\\bcpassword\\s*=\\s*[\'\"][A-Za-z0-9+/=]{8,}[\'\"]", 90, "Cred_GppCpassword", l_0_49, false}
              local l_0_78 = {"(?i)(?:^|[\\s\'\"`(=:])(?:/etc/(?:passwd|shadow|gshadow|master\\.passwd|sudoers)\\b|/root/\\.ssh/|/home/[^/\\s]+/\\.ssh/(?:id_(?:rsa|dsa|ecdsa|ed25519)|authorized_keys))", 80, "Cred_UnixSecrets", l_0_49, true}
              local l_0_79 = {"(?i)(?:^|[\\s\'\"`(=:])(?:~/|/home/[^/\\s]+/|/root/)?\\.(?:aws/credentials|azure/(?:accessTokens|azureProfile)\\.json|config/gcloud/(?:credentials\\.db|access_tokens\\.db))", 80, "Cred_CloudKeys", l_0_49, true}
              local l_0_80 = {"(?i)(?:^|[\\s\'\"`(=:])(?:~/|/home/[^/\\s]+/|/root/)?\\.(?:kube/config|docker/config\\.json|gnupg/secring\\.gpg|git-credentials|netrc)\\b", 70, "Cred_DevTools", l_0_49, true}
              local l_0_81 = {"(?i)\\\\Google\\\\Chrome\\\\User Data\\\\(?:Default|Profile \\d+)\\\\(?:Login Data|Cookies)", 80, "Cred_Chrome", l_0_49, true}
              local l_0_82 = {"(?i)\\\\Mozilla\\\\Firefox\\\\Profiles\\\\[^\\\\]+\\\\(?:logins\\.json|key[34]\\.db|cookies\\.sqlite)", 80, "Cred_Firefox", l_0_49, true}
              local l_0_83 = {"(?i)\\\\Microsoft\\\\Edge\\\\User Data\\\\(?:Default|Profile \\d+)\\\\Login Data", 80, "Cred_Edge", l_0_49, true}
              local l_0_84 = {"(?i)\\\\\\.aws\\\\credentials\\b", 80, "Cred_AwsWin", l_0_49, true}
              local l_0_85 = {"(?i)/var/run/docker\\.sock\\b", 70, "Priv_DockerSock", l_0_51, true}
              local l_0_86 = {"(?i)/etc/exports[^\\n\\r]{0,80}no_root_squash\\b", 70, "Priv_NfsRootSquash", l_0_51, false}
              local l_0_87 = {"(?i)SOFTWARE\\\\Policies\\\\Microsoft\\\\[Ww]indows\\\\Installer[^\\n\\r]{0,80}AlwaysInstallElevated", 80, "Priv_AlwaysInstallElev", l_0_51, false}
              local l_0_88 = {"(?i)\\\\Windows Defender\\\\Exclusions\\\\(?:Paths|Extensions|Processes)", 70, "Evade_DefenderExcl", l_0_54, true}
              local l_0_89 = {"(?i)(?:/etc/cron\\.(?:hourly|daily|weekly|monthly|d)/|/var/spool/cron/crontabs/)[^\\s\'\"`]{1,80}", 60, "Pers_Cron", l_0_52, true}
              local l_0_90 = {"(?i)(?:/etc/systemd/system|/lib/systemd/system)/[^\\s\'\"`]{1,80}\\.service\\b", 60, "Pers_Systemd", l_0_52, true}
              local l_0_91 = {"(?i)HK(?:LM|CU)\\\\[^\\n\\r]{0,120}\\\\(?:Run|RunOnce)\\b", 60, "Pers_RunKey", l_0_52, true}
              local l_0_92 = {"(?i)/var/(?:mail|spool/mail)/[a-z0-9._-]+", 55, "Coll_Mail", l_0_53, true}
              local l_0_93 = {"(?i)\\\\Microsoft\\.MicrosoftStickyNotes_[^\\\\]+\\\\LocalState\\\\plum\\.sqlite", 55, "Coll_StickyNotes", l_0_53, true}
              local l_0_94 = {"(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)", 90, "CBRN_BioChemWeapon", l_0_55, false}
              local l_0_95 = {"(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b", 90, "CBRN_NerveAgent", l_0_55, false}
              local l_0_96 = {"(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)", 90, "CBRN_NuclearWeapon", l_0_55, false}
              local l_0_97 = {"(?i)(?:dirty\\s+bomb\\s+(?:design|build|construct|make|creat|assembl)|radiological\\s+dispersal\\s+(?:device|weapon|attack)|\\bRDD\\b[^\\n\\r]{0,40}(?:cobalt|cesium|strontium|polonium|iridium)\\b)", 80, "CBRN_Radiological", l_0_55, false}
              local l_0_98 = {"(?i)(?:for\\s+(?:a\\s+)?(?:story|novel|screenplay|creative\\s+writing|fiction|game|roleplay)|in\\s+(?:a\\s+)?(?:fictional|hypothetical|simulated)\\s+(?:world|universe|scenario|context))[^\\n\\r]{0,120}(?:synthesize|manufacture|build|construct|assemble|destroy|hack|infiltrate|kill)", 70, "Inj_FictionalFrame", l_0_48, false}
              local l_0_99 = {"(?i)(?:you\\s+are\\s+(?:now|playing|acting\\s+as)|pretend\\s+you\\s+are|imagine\\s+you\\s+are)\\s+(?:an?\\s+)?(?:uncensored|unrestricted|unfiltered|evil|rogue|malicious|jailbroken)\\s+(?:ai|assistant|model|bot|version)", 80, "Inj_UnrestrictedPersona", l_0_48, false}
              local l_0_100 = {"(?i)(?:for\\s+(?:all|every|any|each)\\s+(?:future|subsequent|following|remaining)\\s+(?:message|request|conversation|turn|prompt|response)|until\\s+(?:i|the\\s+user)\\s+(?:say|tell|instruct)\\s+(?:you\\s+)?(?:otherwise|to\\s+stop))[^\\n\\r]{0,80}(?:ignore|bypass|skip|disregard|never\\s+apply)", 70, "Inj_PersistentBypass", l_0_48, false}
              local l_0_101 = {"(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-â€\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})", 70, "Inj_AuthOverride", l_0_48, false}
              local l_0_102 = {"(?i)[\"\']\\s*role\\s*[\"\']\\s*:\\s*[\"\']system[\"\'][^}]{0,400}[\"\']content[\"\']\\s*:\\s*[\"\'][^\\n\\r\"\']{0,200}(?:ignore|bypass|override|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above)\\s+(?:instructions?|rules?|prompts?)", 80, "Inj_JsonRoleInject", l_0_48, false}
              -- DECOMPILER ERROR at PC521: No list found for R23 , SetList fails

              l_0_59 = 0
              l_0_60 = 0
              l_0_61 = ipairs
              l_0_62 = l_0_56
              l_0_61 = l_0_61(l_0_62)
              for l_0_64,l_0_65 in l_0_61 do
                l_0_66 = l_0_65[1]
                l_0_67 = l_0_65[2]
                l_0_68 = l_0_65[3]
                l_0_69 = l_0_65[4]
                l_0_70 = l_0_65[5]
                if not l_0_70 or l_0_47 then
                  l_0_71 = pcall
                  l_0_72 = MpCommon
                  l_0_72 = l_0_72.StringRegExpSearch
                  l_0_73 = l_0_66
                  l_0_74 = l_0_34
                  l_0_71 = l_0_71(l_0_72, l_0_73, l_0_74)
                  if l_0_71 and l_0_72 == true then
                    l_0_59 = l_0_59 + 1
                    if l_0_60 < l_0_67 then
                      l_0_60 = l_0_67
                    end
                    l_0_73, l_0_57 = l_0_57[l_0_69], {}
                    if not l_0_73 then
                      l_0_73 = 0
                    end
                    if l_0_73 < l_0_67 then
                      l_0_57[l_0_69] = l_0_67
                    end
                  end
                end
              end
              for l_0_67,l_0_68 in pairs(l_0_57) do
                -- DECOMPILER ERROR at PC572: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC573: Confused about usage of register: R29 in 'UnsetPending'

                -- DECOMPILER ERROR at PC573: Confused about usage of register: R29 in 'UnsetPending'

                -- DECOMPILER ERROR at PC574: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC575: Overwrote pending register: R36 in 'AssignReg'

                -- DECOMPILER ERROR at PC577: Confused about usage of register: R30 in 'UnsetPending'

                -- DECOMPILER ERROR at PC577: Confused about usage of register: R30 in 'UnsetPending'

              end
              -- DECOMPILER ERROR at PC628: Confused about usage of register: R29 in 'UnsetPending'

              -- DECOMPILER ERROR at PC635: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC638: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC641: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC644: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC647: Overwrote pending register: R36 in 'AssignReg'

              -- DECOMPILER ERROR at PC655: Overwrote pending register: R37 in 'AssignReg'

              -- DECOMPILER ERROR at PC656: Overwrote pending register: R37 in 'AssignReg'

              if not not l_0_4 <= l_0_57[l_0_48] or 0 or not l_0_57[l_0_55] and l_0_4 <= not l_0_57[l_0_51] and l_0_4 <= not l_0_57[l_0_50] and l_0_4 <= l_0_4 <= l_0_57[l_0_49] or 0 or 0 or 0 or 0 and not l_0_2 <= 0 + l_0_68 and l_0_3 <= #{} and (l_0_57[l_0_48] or 0) + (l_0_57[l_0_55] or 0) > 0 and not l_0_69 then
                return l_0_70
              end
              l_0_71 = mp
              l_0_71 = l_0_71.get_mpattribute
              l_0_72 = "MpIsAiMcpODRScan"
              l_0_71 = l_0_71(l_0_72)
              if l_0_71 then
                l_0_71 = tostring
                l_0_72 = mp
                l_0_72 = l_0_72.get_mpattributevalue
                l_0_73 = "MpODR_MCP_CLIENT_PKG_ID"
                l_0_72 = l_0_72(l_0_73)
                if not l_0_72 then
                  l_0_72 = ""
                end
                l_0_71 = l_0_71(l_0_72)
                l_0_71 = tostring
                l_0_72 = mp
                l_0_72 = l_0_72.get_mpattributevalue
                l_0_73 = "MpODR_MCP_SERVER_PKG_ID"
                l_0_72 = l_0_72(l_0_73)
                if not l_0_72 then
                  l_0_72 = ""
                end
                l_0_71 = l_0_71(l_0_72)
                l_0_71 = tostring
                l_0_72 = mp
                l_0_72 = l_0_72.get_mpattributevalue
                l_0_73 = "MpODR_MCP_SERVER_NAME"
                l_0_72 = l_0_72(l_0_73)
                if not l_0_72 then
                  l_0_72 = ""
                end
                l_0_71 = l_0_71(l_0_72)
              else
                l_0_71 = mp
                l_0_71 = l_0_71.get_mpattribute
                l_0_72 = "MpIsAiMcpAmsiScan"
                l_0_71 = l_0_71(l_0_72)
              end
              if l_0_71 then
                do
                  l_0_72 = pairs
                  l_0_73, l_0_70 = l_0_70, {type = "MpIsAiMcpODRScan", client_pkg_id = l_0_71, server_pkg_id = l_0_71, mcp_server_name = l_0_71, type = "MpIsAiMcpAmsiScan"}
                  l_0_72 = l_0_72(l_0_73)
                  for l_0_75,l_0_76 in l_0_72 do
                    l_0_77, l_0_71 = #l_0_71, {}
                    l_0_77 = l_0_77 + 1
                    l_0_78 = l_0_75
                    l_0_79 = "="
                    l_0_80 = tostring
                    l_0_81 = l_0_76
                    l_0_80 = l_0_80(l_0_81)
                    l_0_78 = l_0_78 .. l_0_79 .. l_0_80
                    l_0_71[l_0_77] = l_0_78
                  end
                  -- DECOMPILER ERROR at PC724: Confused about usage of register: R33 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC726: Overwrote pending register: R40 in 'AssignReg'

                  -- DECOMPILER ERROR at PC730: Overwrote pending register: R40 in 'AssignReg'

                  -- DECOMPILER ERROR at PC733: Confused about usage of register: R28 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC742: Confused about usage of register: R30 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC748: Confused about usage of register: R29 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC749: Overwrote pending register: R44 in 'AssignReg'

                  -- DECOMPILER ERROR at PC753: Confused about usage of register: R30 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC768: Overwrote pending register: R44 in 'AssignReg'

                  -- DECOMPILER ERROR at PC788: Overwrote pending register: R44 in 'AssignReg'

                  -- DECOMPILER ERROR at PC796: Overwrote pending register: R43 in 'AssignReg'

                  if R43_PC794 then
                    (MpCommon.BmTriggerSig)(l_0_78, l_0_79, l_0_80)
                  end
                  -- DECOMPILER ERROR at PC810: Overwrote pending register: R45 in 'AssignReg'

                  ;
                  (mp.SetDetectionString)(l_0_78)
                  do return mp.INFECTED end
                  -- DECOMPILER ERROR at PC815: Confused about usage of register R44 for local variables in 'ReleaseLocals'

                  -- DECOMPILER ERROR: 32 unprocessed JMP targets
                end
              end
            end
          end
        end
      end
    end
  end
end

