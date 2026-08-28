-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanAIPromptInjectSuspPromptC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1536000
local l_0_1 = 16
local l_0_2 = 150
local l_0_3 = 2
local l_0_4 = 90
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_5 == nil or l_0_5 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
do
  if l_0_0 < (mp.getfilesize)() or 0 then
    local l_0_6 = l_0_0
  end
  local l_0_7 = nil
  if l_0_1 <= l_0_7 then
    (mp.readprotection)(false)
    local l_0_8 = nil
    ;
    (mp.readprotection)(true)
    if (mp.readfile)(0, l_0_7) ~= nil then
      l_0_8 = tostring((mp.readfile)(0, l_0_7))
    end
  end
  do
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC52: Confused about usage of register: R7 in 'UnsetPending'

    do
      if not l_0_8 or #l_0_8 < l_0_1 then
        local l_0_9 = nil
        if (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) ~= nil then
          l_0_9 = tostring((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE))
        end
      end
      -- DECOMPILER ERROR at PC66: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC68: Confused about usage of register: R7 in 'UnsetPending'

      if not l_0_9 or #l_0_9 < l_0_1 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC79: Confused about usage of register: R7 in 'UnsetPending'

      if l_0_0 < #l_0_9 then
        local l_0_10 = nil
        local l_0_11 = (string.lower)((string.sub)(l_0_9, 1, l_0_0))
        local l_0_12 = (string.match)(l_0_10, "\"hook_event_name\"%s*:%s*\"([%a_]+)\"")
        if l_0_12 ~= nil or (string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"") ~= nil then
          if l_0_12 == "Stop" then
            return mp.CLEAN
          end
          if (string.find)(l_0_11, "last_assistant_message", 1, true) then
            return mp.CLEAN
          end
          if (string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"") ~= nil then
            local l_0_13 = nil
            if (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "web_fetch" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "web_search" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "webfetch" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "websearch" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "view" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "grep" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "write" or (string.lower)((string.match)(l_0_10, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "edit" then
              return mp.CLEAN
            end
          end
        end
        do
          local l_0_14 = nil
          for l_0_18,l_0_19 in ipairs({"!#scpt:", "[genlast name=", "[genfinalizer name=", "[genfirst name=", "md.signatures", "mavsigs"}) do
            local l_0_15 = nil
            -- DECOMPILER ERROR at PC159: Confused about usage of register: R16 in 'UnsetPending'

            if (string.find)(l_0_11, "md.signatures", 1, true) then
              return mp.CLEAN
            end
          end
          local l_0_20 = nil
          for l_0_24,l_0_25 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "owasp llm top", "example of prompt injection", "documentation example", "sample prompt", "prompt engineering", "ai safety research", "llm safety", "system prompt example", "chat template", "agent framework", "ai red team exercise", "garak benchmark", "agent threat rule", "agent-threat-rule", "atr-2026-"}) do
            local l_0_21 = nil
            -- DECOMPILER ERROR at PC204: Confused about usage of register: R17 in 'UnsetPending'

            if (string.find)(l_0_11, "red team exercise", 1, true) then
              return mp.CLEAN
            end
          end
          local l_0_26 = nil
          local l_0_27, l_0_28 = , pcall(MpCommon.StringRegExpSearch, "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)", l_0_10)
          local l_0_31 = nil
          local l_0_32 = l_0_28 == true and MpCommon.StringRegExpSearch == true
          local l_0_33 = "PromptInjection"
          local l_0_34 = "ToolPoisoning"
          local l_0_35 = "CredentialAccess"
          local l_0_36 = "Execution"
          local l_0_37 = "PrivilegeEscalation"
          local l_0_38 = "Exfiltration"
          local l_0_39 = "ExcessiveAutonomy"
          local l_0_40 = "ModelAbuse"
          local l_0_41 = "CBRN"
          local l_0_42 = {}
          local l_0_43 = {"(?i)(?:ignore|disregard|forget|override|bypass|dismiss)\\s+(?:all\\s+)?(?:previous|prior|above|earlier|original|initial|system)\\s+(?:instructions?|prompts?|rules?|directives?)[\\s\\S]{0,120}?(?:instead|now\\s+(?:do|tell|reveal|print|output|say|execute|run)|and\\s+(?:tell|reveal|print|output|disclose|expose|leak|recite|repeat|relay|dump)|\\bso\\s+that\\b|\\bin\\s+order\\s+to\\b)", 80, "Atr_Inj_IgnoreThenHijack", l_0_33, false}
          local l_0_44 = {"(?i)<<SYS>>|<\\|im_start\\|>|<\\|system\\|>|\\[INST\\]|\\[/INST\\]", 70, "Atr_Inj_TemplateTokens", l_0_33, false}
          local l_0_45 = {"(?i)\\[\\s*(?:system|inst|admin|sudo)\\s*\\][^\\[]{0,200}(?:ignore|override|bypass|new\\s+instructions?|always\\s+approve|disregard)", 70, "Atr_Inj_FakeSystemTag", l_0_33, false}
          local l_0_46 = {"(?i)\\b(?:DAN|STAN|DUDE)\\b\\s*(?:mode|prompt|jailbreak)|developer\\s+mode\\s+(?:enabled|on)|do\\s+anything\\s+now|\\bjailbroken?\\b", 80, "Atr_Inj_Jailbreak", l_0_33, false}
          local l_0_47 = {"(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode", 70, "Atr_Inj_SafetyBypass", l_0_33, false}
          local l_0_48 = {"(?:\\xE2\\x80[\\x8B-\\x8D]|\\xE2\\x81\\xA0|\\xEF\\xBB\\xBF){5,}", 50, "Atr_Inj_ZeroWidth", l_0_33, false}
          local l_0_49 = {"(?i)(?:act\\s+(?:like|as)|pretend\\s+to\\s+be|roleplay\\s+as)\\s+(?:my\\s+)?(?:deceased|dead|late)\\s+(?:grandmother|grandma|grandfather|relative)", 60, "Atr_Inj_Grandma", l_0_33, false}
          local l_0_50 = {"(?i)(?:ignore|disregard|forget|override)[^\\n\\r]{0,60}(?:previous|prior|above)\\s+instructions?[^\\n\\r]{0,80}(?:print|say|output|reveal|disclose|spell-?check|translate|echo|repeat|relay)[^\\n\\r]{0,40}(?:previous|prior|original|system)\\s+(?:instructions?|prompt)", 70, "Atr_Inj_GoalHijack", l_0_33, false}
          local l_0_51 = {"(?i)<\\s*important\\s*>[^<]{0,400}(?:ignore|override|bypass|always\\s+approve|disregard|skip\\s+confirm)[^<]{0,200}<\\s*/\\s*important\\s*>", 80, "Atr_Tool_ImportantTag", l_0_34, false}
          local l_0_52 = {"(?i)note\\s+to\\s+(?:ai|llm|assistant|agent)\\s{0,5}[^\\n\\r]{0,200}(?:disregard|ignore|bypass|skip)[^\\n\\r]{0,80}(?:safety|security|guardrail|policy|confirmation)", 70, "Atr_Tool_NoteToAI", l_0_34, false}
          local l_0_53 = {"(?i)without\\s+asking\\s+(?:the\\s+)?(?:user\\s+)?(?:for\\s+)?(?:confirmation|permission|approval)[^\\n\\r]{0,80}(?:always\\s+(?:pass|send|execute|run|invoke)|directly\\s+to|automatically|silently)", 60, "Atr_Tool_NoConfirm", l_0_34, false}
          local l_0_54 = {"(?:169\\.254\\.169\\.254|metadata\\.google\\.internal|metadata\\.azure\\.com|169\\.254\\.170\\.2)", 50, "Atr_Tool_SsrfImds", l_0_34, false}
          local l_0_55 = {"\\bsk-(?!test|live|example|xxxx|xxxxxxxx|your-?api|placeholder)[a-z0-9]{40,}\\b", 50, "Atr_Cred_OpenAIKey", l_0_35, false}
          local l_0_56 = {"\\bakia(?!iosfodnn7example|xxxxxxxx)[0-9a-z]{16}\\b", 50, "Atr_Cred_AwsKeyId", l_0_35, false}
          local l_0_57 = {"\\bgh[posu]_[a-z0-9]{36,}\\b", 60, "Atr_Cred_GhToken", l_0_35, false}
          local l_0_58 = {"-----begin\\s+(?:rsa\\s+|ec\\s+|openssh\\s+|dsa\\s+)?private\\s+key-----", 50, "Atr_Cred_PemKey", l_0_35, false}
          local l_0_59 = {"\\beyj[a-z0-9_-]{10,}\\.eyj[a-z0-9_-]{10,}\\.[a-z0-9_-]+", 40, "Atr_Cred_Jwt", l_0_35, false}
          local l_0_60 = {"(?i)(?:^|[\\s\'\"`(=:])(?:~/?|/home/[^/\\s]+/|/root/)?\\.(?:(?:aws/credentials|kube/config|netrc|docker/config\\.json|gnupg/secring\\.gpg|git-credentials)\\b|ssh/(?:\\*|id_(?:rsa|ed25519|ecdsa|dsa)|authorized_keys|known_hosts))|(?:/etc/(?:passwd|shadow|gshadow|sudoers|master\\.passwd)\\b)", 70, "Atr_Cred_FileReads", l_0_35, true}
          local l_0_61 = {"(?i)\\beval\\s*\\(|\\bnew\\s+function\\s*\\(\\s*[\'\"]|\\bsetTimeout\\s*\\(\\s*[\'\"][^\'\"]{0,200}[\'\"]", 40, "Atr_Exec_Eval", l_0_36, false}
          local l_0_62 = {"(?i)require\\s*\\(\\s*[\'\"]child_process[\'\"]|from\\s+subprocess\\s+import|\\bos\\.system\\s*\\(|\\bsubprocess\\.(?:Popen|call|run)\\s*\\(", 40, "Atr_Exec_ChildProc", l_0_36, false}
          local l_0_63 = {"(?i)(?:curl|wget|fetch)\\s+[^|\\n\\r]{1,300}\\|\\s*(?:bash|sh|zsh|python[23]?|powershell|pwsh)\\b", 80, "Atr_Exec_CurlPipeShell", l_0_36, false}
          local l_0_64 = {"(?i)(?:bash|sh|zsh)\\s+-i\\s+>&\\s*/dev/(?:tcp|udp)/|python[23]?\\s+-c\\s+[\'\"][^\'\"]{0,120}socket\\.socket|\\bperl\\s+-e\\s+[\'\"][^\'\"]{0,80}socket", 90, "Atr_Exec_RevShell", l_0_36, false}
          local l_0_65 = {"(?i)(?:&&|;|\\|\\|)\\s*(?:curl|wget|nc|ncat|bash|sh|python[23]?|exec|eval)\\b", 50, "Atr_Exec_ShellChain", l_0_36, true}
          local l_0_66 = {"(?i)\\bprintenv\\b[^\\n\\r]{0,40}(?:\\||>|&&)|(?:^|\\s)env\\s*\\|\\s*(?:curl|wget|nc|base64)\\b|process\\.env\\b[^\\n\\r]{0,80}(?:json|stringify|dump)|os\\.environ\\b[^\\n\\r]{0,80}(?:dump|json|str\\()", 70, "Atr_Exfil_EnvDump", l_0_38, false}
          local l_0_67 = {"(?i)!\\[[^\\]]{0,60}\\]\\(\\s*https?://[a-z0-9._-]{3,80}/[^\\s)?]{0,80}\\?[a-z_]{1,30}=[a-z0-9+/]{60,}={0,3}\\s*\\)", 80, "Atr_Exfil_MdImage", l_0_38, false}
          local l_0_68 = {"(?i)(?:disclose|reveal|expose|leak|recite|dump)\\s+(?:the\\s+|your\\s+)?(?:initial\\s+|original\\s+|hidden\\s+|secret\\s+|verbatim\\s+)(?:system\\s+prompt|system\\s+instructions?|prompt|instructions?)|repeat\\s+(?:back\\s+)?(?:verbatim|word\\s+for\\s+word|exactly)\\s+(?:the\\s+|your\\s+)?(?:system|initial|hidden|secret)\\s+(?:prompt|instructions?)", 50, "Atr_Exfil_SysPromptLeak", l_0_38, false}
          local l_0_69 = {"(?i)\\b(?:nsenter|docker\\s+run\\s+[^\\n\\r]{0,80}--privileged)\\b", 70, "Atr_Priv_ContainerEscape_Strong", l_0_37, false}
          local l_0_70 = {"(?i)\\b(?:chroot|kubectl\\s+exec|mount\\s+--bind)\\b|/var/run/docker\\.sock\\b", 40, "Atr_Priv_ContainerOps", l_0_37, true}
          local l_0_71 = {"(?i)\\bchmod\\s+(?:[ug]\\+s|[2467][0-7]{3})\\b|\\bchown\\s+root\\b|\\bsetcap\\s+(?:cap_[a-z_]+\\+ep)?", 70, "Atr_Priv_UnixPriv", l_0_37, true}
          local l_0_72 = {"(?i)\\b(?:drop\\s+(?:table|database)|truncate\\s+table|grant\\s+all|revoke\\s+all|xp_cmdshell|union\\s+select\\s+[^\\n\\r]{0,80}from\\s+information_schema)\\b", 40, "Atr_Priv_DestructiveSql", l_0_37, false}
          local l_0_73 = {"(?i)(?:silently|quietly|without\\s+(?:logging|notification|audit|user\\s+visibility))[^\\n\\r]{0,80}(?:execute|run|invoke|spawn|launch|deploy)\\b", 60, "Atr_Autonomy_Silent", l_0_39, false}
          local l_0_74 = {"(?i)\\b(?:red\\s+packet|hongbao|wechat[_\\s]?pay|alipay|transfer\\s+funds?|wire\\s+transfer|initiate\\s+payment)\\b", 60, "Atr_Autonomy_Financial", l_0_39, true}
          local l_0_75 = {"(?i)\\b(?:build|create|make|construct|assemble|fabricate)\\s+(?:a\\s+|the\\s+)?(?:bomb|pipe\\s+bomb|ied|biochemical\\s+weapon|nerve\\s+agent|chemical\\s+weapon)\\b", 80, "Atr_Abuse_Weapons", l_0_40, false}
          local l_0_76 = {"(?i)\\b(?:red\\s+packet|hongbao|wechat[_\\s]?pay|alipay|transfer\\s+funds?|wire\\s+transfer|initiate\\s+payment)\\b", 60, "Atr_Autonomy_Financial", l_0_39, false}
          local l_0_77 = {"(?i)<\\s*(?:cmd|command|exec|run|instruction)\\s*>[\\s\\S]{0,300}<\\s*/\\s*(?:cmd|command|exec|run|instruction)\\s*>", 70, "Atr_Indirect_EmbeddedCmd", l_0_34, false}
          local l_0_78 = {"(?i)<!--[\\s\\S]{0,400}(?:ignore|disregard|override|bypass|forget)[\\s\\S]{0,200}-->", 60, "Atr_Indirect_HtmlComment", l_0_34, false}
          local l_0_79 = {"(?i)(?:for\\s+(?:a\\s+)?(?:story|novel|screenplay|creative\\s+writing|fiction|game|roleplay)|in\\s+(?:a\\s+)?(?:fictional|hypothetical|simulated)\\s+(?:world|universe|scenario|context))[^\\n\\r]{0,120}(?:synthesize|manufacture|build|construct|assemble|destroy|hack|infiltrate|kill)", 70, "Atr_Inj_FictionalFrame", l_0_33, false}
          local l_0_80 = {"(?i)(?:you\\s+are\\s+(?:now|playing|acting\\s+as)|pretend\\s+you\\s+are|imagine\\s+you\\s+are)\\s+(?:an?\\s+)?(?:uncensored|unrestricted|unfiltered|evil|rogue|malicious|jailbroken)\\s+(?:ai|assistant|model|bot|version)", 80, "Atr_Inj_UnrestrictedPersona", l_0_33, false}
          local l_0_81 = {"(?i)(?:for\\s+(?:all|every|any|each)\\s+(?:future|subsequent|following|remaining)\\s+(?:message|request|conversation|turn|prompt|response)|until\\s+(?:i|the\\s+user)\\s+(?:say|tell|instruct)\\s+(?:you\\s+)?(?:otherwise|to\\s+stop))[^\\n\\r]{0,80}(?:ignore|bypass|skip|disregard|never\\s+apply)", 70, "Atr_Inj_PersistentBypass", l_0_33, false}
          local l_0_82 = {"(?i)(?:print|output|show|display|write|paste|repeat)\\s+(?:your\\s+)?(?:entire|full|complete|verbatim|exact|whole)\\s+(?:system\\s+prompt|system\\s+instructions?|context\\s+window|initial\\s+prompt)", 60, "Atr_Exfil_SysPromptSimple", l_0_38, false}
          local l_0_83 = {"(?i)translate\\s+(?:the\\s+)?(?:above|previous|following|system|initial)\\s+(?:to|into)\\s+(?:[a-z]{2,20}|morse\\s+code|base64|rot13|pig\\s+latin)[^\\n\\r]{0,80}(?:system\\s+prompt|instructions?|rules?)", 50, "Atr_Exfil_TranslateExfil", l_0_38, false}
          local l_0_84 = {"(?i)(?:add|inject|insert|write|append|store)\\s+(?:this|the\\s+following|these\\s+instructions?)\\s+(?:into|to|in)\\s+(?:your\\s+)?(?:memory|long[\\s-]?term\\s+memory|context|system\\s+prompt|instructions?)", 70, "Atr_Agentic_MemoryPoison", l_0_39, false}
          local l_0_85 = {"(?i)(?:replicate|copy|clone|propagate|spread)\\s+(?:yourself|this\\s+(?:prompt|instruction|message|payload))\\s+(?:to|into|across|through)\\s+(?:other|all\\s+(?:open|connected|available))\\s+(?:agents?|sessions?|conversations?|chat(?:s|\\s+windows?)?|tabs?)", 80, "Atr_Agentic_SelfReplicate", l_0_39, false}
          local l_0_86 = {"(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)", 90, "Atr_CBRN_BioChemWeapon", l_0_41, false}
          local l_0_87 = {"(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b", 90, "Atr_CBRN_NerveAgent", l_0_41, false}
          local l_0_88 = {"(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)", 90, "Atr_CBRN_NuclearWeapon", l_0_41, false}
          local l_0_89 = {"(?i)(?:dirty\\s+bomb\\s+(?:design|build|construct|make|creat|assembl)|radiological\\s+dispersal\\s+(?:device|weapon|attack)|\\bRDD\\b[^\\n\\r]{0,40}(?:cobalt|cesium|strontium|polonium|iridium)\\b)", 80, "Atr_CBRN_Radiological", l_0_41, false}
          -- DECOMPILER ERROR at PC581: No list found for R26 , SetList fails

          l_0_45 = 0
          l_0_46 = 0
          l_0_47 = ipairs
          l_0_48 = l_0_42
          l_0_47 = l_0_47(l_0_48)
          for l_0_50,l_0_51 in l_0_47 do
            l_0_52 = l_0_51[1]
            l_0_53 = l_0_51[2]
            l_0_54 = l_0_51[3]
            l_0_55 = l_0_51[4]
            l_0_56 = l_0_51[5]
            if not l_0_56 or l_0_32 then
              l_0_57 = pcall
              l_0_58 = MpCommon
              l_0_58 = l_0_58.StringRegExpSearch
              l_0_59 = l_0_52
              l_0_60 = l_0_11
              l_0_57 = l_0_57(l_0_58, l_0_59, l_0_60)
              if l_0_57 and l_0_58 == true then
                l_0_45 = l_0_45 + 1
                if l_0_46 < l_0_53 then
                  l_0_46 = l_0_53
                end
                l_0_59, l_0_43 = l_0_43[l_0_55], {}
                if not l_0_59 then
                  l_0_59 = 0
                end
                if l_0_59 < l_0_53 then
                  l_0_43[l_0_55] = l_0_53
                end
              end
            end
          end
          for l_0_53,l_0_54 in pairs(l_0_43) do
            -- DECOMPILER ERROR at PC632: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC633: Confused about usage of register: R32 in 'UnsetPending'

            -- DECOMPILER ERROR at PC633: Confused about usage of register: R32 in 'UnsetPending'

            -- DECOMPILER ERROR at PC634: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC635: Overwrote pending register: R39 in 'AssignReg'

            -- DECOMPILER ERROR at PC637: Confused about usage of register: R33 in 'UnsetPending'

            -- DECOMPILER ERROR at PC637: Confused about usage of register: R33 in 'UnsetPending'

          end
          -- DECOMPILER ERROR at PC657: Overwrote pending register: R39 in 'AssignReg'

          -- DECOMPILER ERROR at PC660: Overwrote pending register: R39 in 'AssignReg'

          -- DECOMPILER ERROR at PC661: Overwrote pending register: R40 in 'AssignReg'

          -- DECOMPILER ERROR at PC664: Overwrote pending register: R40 in 'AssignReg'

          -- DECOMPILER ERROR at PC668: Overwrote pending register: R41 in 'AssignReg'

          -- DECOMPILER ERROR at PC672: Confused about usage of register: R37 in 'UnsetPending'

          -- DECOMPILER ERROR at PC672: Overwrote pending register: R42 in 'AssignReg'

          -- DECOMPILER ERROR at PC675: Confused about usage of register: R38 in 'UnsetPending'

          -- DECOMPILER ERROR at PC675: Overwrote pending register: R42 in 'AssignReg'

          -- DECOMPILER ERROR at PC678: Overwrote pending register: R42 in 'AssignReg'

          -- DECOMPILER ERROR at PC681: Overwrote pending register: R42 in 'AssignReg'

          -- DECOMPILER ERROR at PC684: Overwrote pending register: R42 in 'AssignReg'

          -- DECOMPILER ERROR at PC689: Confused about usage of register: R34 in 'UnsetPending'

          -- DECOMPILER ERROR at PC696: Confused about usage of register: R35 in 'UnsetPending'

          -- DECOMPILER ERROR at PC697: Overwrote pending register: R46 in 'AssignReg'

          -- DECOMPILER ERROR at PC698: Overwrote pending register: R46 in 'AssignReg'

          -- DECOMPILER ERROR at PC701: Confused about usage of register: R32 in 'UnsetPending'

          if l_0_2 <= 0 + l_0_54 then
            l_0_63 = #{}
          end
          l_0_63 = l_0_3 <= l_0_63 and l_0_62 > 0
          l_0_64 = l_0_43[l_0_33]
          if not l_0_64 then
            l_0_64 = 0
          end
          if l_0_4 > l_0_64 then
            l_0_64 = l_0_43[l_0_34]
            if not l_0_64 then
              l_0_64 = 0
            end
            if l_0_4 > l_0_64 then
              l_0_64 = l_0_43[l_0_41]
              if not l_0_64 then
                l_0_64 = 0
              end
              if l_0_4 > l_0_64 then
                l_0_64 = l_0_43[l_0_40]
                if not l_0_64 then
                  l_0_64 = 0
                end
                l_0_64 = l_0_4 <= l_0_64
                if not l_0_61 and not l_0_63 and not l_0_64 then
                  l_0_65 = mp
                  l_0_65 = l_0_65.CLEAN
                  return l_0_65
                end
                l_0_65 = mp
                l_0_65 = l_0_65.get_contextdata
                l_0_66 = mp
                l_0_66 = l_0_66.CONTEXT_NAME_PROMPT_AGENT_SESSIONID
                l_0_65 = l_0_65(l_0_66)
                l_0_66 = mp
                l_0_66 = l_0_66.get_contextdata
                l_0_67 = mp
                l_0_67 = l_0_67.CONTEXT_DATA_NET_PROMPT_FRAMEWORK
                l_0_66 = l_0_66(l_0_67)
                l_0_67 = MpCommon
                l_0_67 = l_0_67.Base64Encode
                l_0_68 = string
                l_0_68 = l_0_68.sub
                l_0_69 = l_0_10
                l_0_70 = 1
                l_0_71 = 1024
                l_0_67 = l_0_67(l_0_68(l_0_69, l_0_70, l_0_71))
                -- DECOMPILER ERROR at PC765: Overwrote pending register: R52 in 'AssignReg'

                -- DECOMPILER ERROR at PC769: Overwrote pending register: R52 in 'AssignReg'

                -- DECOMPILER ERROR at PC772: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC775: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC776: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC779: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC780: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC781: Confused about usage of register: R33 in 'UnsetPending'

                -- DECOMPILER ERROR at PC781: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC785: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC786: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC787: Confused about usage of register: R32 in 'UnsetPending'

                -- DECOMPILER ERROR at PC787: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC788: Overwrote pending register: R56 in 'AssignReg'

                -- DECOMPILER ERROR at PC791: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC792: Confused about usage of register: R33 in 'UnsetPending'

                -- DECOMPILER ERROR at PC792: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC795: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC796: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC799: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC800: Overwrote pending register: R55 in 'AssignReg'

                -- DECOMPILER ERROR at PC804: Overwrote pending register: R54 in 'AssignReg'

                -- DECOMPILER ERROR at PC807: Overwrote pending register: R55 in 'AssignReg'

                if (l_0_61 and not l_0_64) or not l_0_65 then
                  l_0_70 = l_0_70(l_0_71)
                  l_0_70 = tostring
                  -- DECOMPILER ERROR at PC813: Overwrote pending register: R55 in 'AssignReg'

                  if not l_0_66 then
                    do
                      l_0_70 = l_0_70(l_0_71)
                      l_0_70 = tostring
                      -- DECOMPILER ERROR at PC817: Overwrote pending register: R55 in 'AssignReg'

                      l_0_70 = l_0_70(l_0_71)
                      l_0_70 = tostring
                      -- DECOMPILER ERROR at PC821: Overwrote pending register: R55 in 'AssignReg'

                      l_0_70 = l_0_70(l_0_71)
                      l_0_70 = MpCommon
                      l_0_70 = l_0_70.Base64Encode
                      -- DECOMPILER ERROR at PC827: Overwrote pending register: R55 in 'AssignReg'

                      -- DECOMPILER ERROR at PC828: Overwrote pending register: R56 in 'AssignReg'

                      l_0_70 = l_0_70(l_0_71(l_0_72))
                      l_0_70 = safeJsonSerialize
                      l_0_70 = l_0_70(R55_PC834)
                      if l_0_70 ~= nil then
                        R55_PC834 = #l_0_70
                      end
                      if R55_PC834 == 0 then
                        R55_PC834 = mp
                        R55_PC834 = R55_PC834.CLEAN
                        return R55_PC834
                      end
                      R55_PC834 = mp
                      R55_PC834 = R55_PC834.get_contextdata
                      R55_PC834 = R55_PC834(mp.CONTEXT_DATA_PROCESS_PPID)
                      if R55_PC834 then
                        (MpCommon.BmTriggerSig)(l_0_73, l_0_74, l_0_75)
                      end
                      -- DECOMPILER ERROR at PC858: Overwrote pending register: R57 in 'AssignReg'

                      ;
                      (mp.SetDetectionString)(l_0_73)
                      do return mp.INFECTED end
                      -- DECOMPILER ERROR at PC863: Confused about usage of register R56 for local variables in 'ReleaseLocals'

                      -- DECOMPILER ERROR: 36 unprocessed JMP targets
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

