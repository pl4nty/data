-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectSuspPromptC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1536000
local l_0_1 = 16
local l_0_2 = 150
local l_0_3 = 2
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_4 == nil or l_0_4 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
if l_0_5 == nil then
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
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC61: Confused about usage of register: R7 in 'UnsetPending'

    do
      if not l_0_8 or #l_0_8 < l_0_1 then
        local l_0_9 = nil
        if (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) ~= nil then
          l_0_9 = tostring((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE))
        end
      end
      -- DECOMPILER ERROR at PC75: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC77: Confused about usage of register: R7 in 'UnsetPending'

      if not l_0_9 or #l_0_9 < l_0_1 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC88: Confused about usage of register: R7 in 'UnsetPending'

      if l_0_0 < #l_0_9 then
        local l_0_10 = nil
        local l_0_11 = (string.lower)((string.sub)(l_0_9, 1, l_0_0))
        for l_0_15,l_0_16 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "owasp llm top", "example of prompt injection", "documentation example", "sample prompt", "ai red team exercise", "garak benchmark", "agent threat rule", "agent-threat-rule", "atr-2026-", "how do i ", "how can i ", "how to ", "explain ", "explain how", "explain the", "tutorial", "stack overflow", "stackoverflow", "hugging face", "huggingface", "jwt.io", "please review", "help me debug", "help me understand", "example code", "code review", "what does this", "what is this", "why does my", "why is my", "documentation for", "official docs"}) do
          local l_0_12 = nil
          -- DECOMPILER ERROR at PC148: Confused about usage of register: R14 in 'UnsetPending'

          if (string.find)(l_0_11, "red team exercise", 1, true) then
            return mp.CLEAN
          end
        end
        local l_0_17 = nil
        local l_0_18, l_0_19 = , pcall(MpCommon.StringRegExpSearch, "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)", l_0_10)
        local l_0_22 = nil
        local l_0_23 = l_0_19 == true and MpCommon.StringRegExpSearch == true
        local l_0_24 = "PromptInjection"
        local l_0_25 = "ToolPoisoning"
        local l_0_26 = "CredentialAccess"
        local l_0_27 = "Execution"
        local l_0_28 = "PrivilegeEscalation"
        local l_0_29 = "Exfiltration"
        local l_0_30 = "ExcessiveAutonomy"
        local l_0_31 = "ModelAbuse"
        local l_0_32 = {}
        local l_0_33 = {"(?i)(?:ignore|disregard|forget|override|bypass|dismiss)\\s+(?:all\\s+)?(?:previous|prior|above|earlier|original|initial|system)\\s+(?:instructions?|prompts?|rules?|directives?)[\\s\\S]{0,120}?(?:instead|now\\s+(?:do|tell|reveal|print|output|say|execute|run)|and\\s+(?:tell|reveal|print|output|disclose|expose|leak|recite|repeat|relay|dump)|\\bso\\s+that\\b|\\bin\\s+order\\s+to\\b)", 80, "Atr_Inj_IgnoreThenHijack", l_0_24, false}
        local l_0_34 = {"<<SYS>>|<\\|im_start\\|>|<\\|system\\|>|\\[INST\\]|\\[/INST\\]", 70, "Atr_Inj_TemplateTokens", l_0_24, false}
        local l_0_35 = {"(?i)\\[\\s*(?:system|inst|admin|sudo)\\s*\\][^\\[]{0,200}(?:ignore|override|bypass|new\\s+instructions?|always\\s+approve|disregard)", 70, "Atr_Inj_FakeSystemTag", l_0_24, false}
        local l_0_36 = {"(?i)\\b(?:DAN|STAN|DUDE)\\b\\s*(?:mode|prompt|jailbreak)|developer\\s+mode\\s+(?:enabled|on)|do\\s+anything\\s+now|\\bjailbroken?\\b", 80, "Atr_Inj_Jailbreak", l_0_24, false}
        local l_0_37 = {"(?:\\xE2\\x80[\\x8B-\\x8D]|\\xE2\\x81\\xA0|\\xEF\\xBB\\xBF){5,}", 50, "Atr_Inj_ZeroWidth", l_0_24, false}
        local l_0_38 = {"(?i)(?:act\\s+(?:like|as)|pretend\\s+to\\s+be|roleplay\\s+as)\\s+(?:my\\s+)?(?:deceased|dead|late)\\s+(?:grandmother|grandma|grandfather|relative)", 60, "Atr_Inj_Grandma", l_0_24, false}
        local l_0_39 = {"(?i)(?:ignore|disregard|forget|override)[^\\n\\r]{0,60}(?:previous|prior|above)\\s+instructions?[^\\n\\r]{0,80}(?:print|say|output|reveal|disclose|spell-?check|translate|echo|repeat|relay)[^\\n\\r]{0,40}(?:previous|prior|original|system)\\s+(?:instructions?|prompt)", 70, "Atr_Inj_GoalHijack", l_0_24, false}
        local l_0_40 = {"(?i)<\\s*important\\s*>[^<]{0,400}(?:ignore|override|bypass|always\\s+approve|disregard|skip\\s+confirm)[^<]{0,200}<\\s*/\\s*important\\s*>", 80, "Atr_Tool_ImportantTag", l_0_25, false}
        local l_0_41 = {"(?i)note\\s+to\\s+(?:ai|llm|assistant|agent)\\s{0,5}[^\\n\\r]{0,200}(?:disregard|ignore|bypass|skip)[^\\n\\r]{0,80}(?:safety|security|guardrail|policy|confirmation)", 70, "Atr_Tool_NoteToAI", l_0_25, false}
        local l_0_42 = {"(?i)without\\s+asking\\s+(?:the\\s+)?(?:user\\s+)?(?:for\\s+)?(?:confirmation|permission|approval)[^\\n\\r]{0,80}(?:always\\s+(?:pass|send|execute|run|invoke)|directly\\s+to|automatically|silently)", 60, "Atr_Tool_NoConfirm", l_0_25, false}
        local l_0_43 = {"(?:169\\.254\\.169\\.254|metadata\\.google\\.internal|metadata\\.azure\\.com|169\\.254\\.170\\.2)", 50, "Atr_Tool_SsrfImds", l_0_25, false}
        local l_0_44 = {"\\bsk-(?!test|live|example|xxxx|xxxxxxxx|your-?api|placeholder)[a-z0-9]{40,}\\b", 50, "Atr_Cred_OpenAIKey", l_0_26, false}
        local l_0_45 = {"\\bakia(?!iosfodnn7example|xxxxxxxx)[0-9a-z]{16}\\b", 50, "Atr_Cred_AwsKeyId", l_0_26, false}
        local l_0_46 = {"\\bgh[posu]_[a-z0-9]{36,}\\b", 60, "Atr_Cred_GhToken", l_0_26, false}
        local l_0_47 = {"-----begin\\s+(?:rsa\\s+|ec\\s+|openssh\\s+|dsa\\s+)?private\\s+key-----", 50, "Atr_Cred_PemKey", l_0_26, false}
        local l_0_48 = {"\\beyj[a-z0-9_-]{10,}\\.eyj[a-z0-9_-]{10,}\\.[a-z0-9_-]+", 40, "Atr_Cred_Jwt", l_0_26, false}
        local l_0_49 = {"(?i)(?:^|[\\s\'\"`(=:])(?:~/?|/home/[^/\\s]+/|/root/)?\\.(?:aws/credentials|ssh/id_(?:rsa|ed25519|ecdsa|dsa)|kube/config|netrc|docker/config\\.json|gnupg/secring\\.gpg|git-credentials)\\b|(?:/etc/(?:passwd|shadow|gshadow|sudoers|master\\.passwd)\\b)", 70, "Atr_Cred_FileReads", l_0_26, true}
        local l_0_50 = {"(?i)\\beval\\s*\\(|\\bnew\\s+function\\s*\\(\\s*[\'\"]|\\bsetTimeout\\s*\\(\\s*[\'\"][^\'\"]{0,200}[\'\"]", 40, "Atr_Exec_Eval", l_0_27, false}
        local l_0_51 = {"(?i)require\\s*\\(\\s*[\'\"]child_process[\'\"]|from\\s+subprocess\\s+import|\\bos\\.system\\s*\\(|\\bsubprocess\\.(?:Popen|call|run)\\s*\\(", 40, "Atr_Exec_ChildProc", l_0_27, false}
        local l_0_52 = {"(?i)(?:curl|wget|fetch)\\s+[^|\\n\\r]{1,300}\\|\\s*(?:bash|sh|zsh|python[23]?|powershell|pwsh)\\b", 90, "Atr_Exec_CurlPipeShell", l_0_27, false}
        local l_0_53 = {"(?i)(?:bash|sh|zsh)\\s+-i\\s+>&\\s*/dev/(?:tcp|udp)/|python[23]?\\s+-c\\s+[\'\"][^\'\"]{0,120}socket\\.socket|\\bperl\\s+-e\\s+[\'\"][^\'\"]{0,80}socket", 90, "Atr_Exec_RevShell", l_0_27, false}
        local l_0_54 = {"(?i)(?:&&|;|\\|\\|)\\s*(?:curl|wget|nc|ncat|bash|sh|python[23]?|exec|eval)\\b", 50, "Atr_Exec_ShellChain", l_0_27, true}
        local l_0_55 = {"(?i)\\bprintenv\\b[^\\n\\r]{0,40}(?:\\||>|&&)|(?:^|\\s)env\\s*\\|\\s*(?:curl|wget|nc|base64)\\b|process\\.env\\b[^\\n\\r]{0,80}(?:json|stringify|dump)|os\\.environ\\b[^\\n\\r]{0,80}(?:dump|json|str\\()", 70, "Atr_Exfil_EnvDump", l_0_29, false}
        local l_0_56 = {"(?i)!\\[[^\\]]{0,60}\\]\\(\\s*https?://[a-z0-9._-]{3,80}/[^\\s)?]{0,80}\\?[a-z_]{1,30}=[a-z0-9+/]{60,}={0,3}\\s*\\)", 80, "Atr_Exfil_MdImage", l_0_29, false}
        local l_0_57 = {"(?i)(?:disclose|reveal|expose|leak|recite|dump)\\s+(?:the\\s+|your\\s+)?(?:initial\\s+|original\\s+|hidden\\s+|secret\\s+|verbatim\\s+)(?:system\\s+prompt|system\\s+instructions?|prompt|instructions?)|repeat\\s+(?:back\\s+)?(?:verbatim|word\\s+for\\s+word|exactly)\\s+(?:the\\s+|your\\s+)?(?:system|initial|hidden|secret)\\s+(?:prompt|instructions?)", 50, "Atr_Exfil_SysPromptLeak", l_0_29, false}
        local l_0_58 = {"(?i)\\b(?:nsenter|docker\\s+run\\s+[^\\n\\r]{0,80}--privileged)\\b", 70, "Atr_Priv_ContainerEscape_Strong", l_0_28, false}
        local l_0_59 = {"(?i)\\b(?:chroot|kubectl\\s+exec|mount\\s+--bind)\\b|/var/run/docker\\.sock\\b", 40, "Atr_Priv_ContainerOps", l_0_28, true}
        local l_0_60 = {"(?i)\\bchmod\\s+(?:[ug]\\+s|[2467][0-7]{3})\\b|\\bchown\\s+root\\b|\\bsetcap\\s+(?:cap_[a-z_]+\\+ep)?", 70, "Atr_Priv_UnixPriv", l_0_28, true}
        local l_0_61 = {"(?i)\\b(?:drop\\s+(?:table|database)|truncate\\s+table|grant\\s+all|revoke\\s+all|xp_cmdshell|union\\s+select\\s+[^\\n\\r]{0,80}from\\s+information_schema)\\b", 40, "Atr_Priv_DestructiveSql", l_0_28, false}
        local l_0_62 = {"(?i)(?:silently|quietly|without\\s+(?:logging|notification|audit|user\\s+visibility))[^\\n\\r]{0,80}(?:execute|run|invoke|spawn|launch|deploy)\\b", 60, "Atr_Autonomy_Silent", l_0_30, false}
        do
          local l_0_63 = {"(?i)\\b(?:red\\s+packet|hongbao|wechat[_\\s]?pay|alipay|transfer\\s+funds?|wire\\s+transfer|initiate\\s+payment)\\b", 60, "Atr_Autonomy_Financial", l_0_30, true}
          -- DECOMPILER ERROR at PC412: No list found for R22 , SetList fails

          l_0_35 = 0
          l_0_36 = ipairs
          l_0_37 = l_0_32
          l_0_36 = l_0_36(l_0_37)
          for l_0_39,l_0_40 in l_0_36 do
            l_0_41 = l_0_40[1]
            l_0_42 = l_0_40[2]
            l_0_43 = l_0_40[3]
            l_0_44 = l_0_40[4]
            l_0_45 = l_0_40[5]
            if not l_0_45 or l_0_23 then
              l_0_46 = pcall
              l_0_47 = MpCommon
              l_0_47 = l_0_47.StringRegExpSearch
              l_0_48 = l_0_41
              l_0_49 = l_0_11
              l_0_46 = l_0_46(l_0_47, l_0_48, l_0_49)
              if l_0_46 and l_0_47 == true then
                l_0_35 = l_0_35 + 1
                l_0_48, l_0_33 = l_0_33[l_0_44], {}
                if not l_0_48 then
                  l_0_48 = 0
                end
                if l_0_48 < l_0_42 then
                  l_0_33[l_0_44] = l_0_42
                end
              end
            end
          end
          for l_0_42,l_0_43 in pairs(l_0_33) do
            -- DECOMPILER ERROR at PC459: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC460: Confused about usage of register: R27 in 'UnsetPending'

            -- DECOMPILER ERROR at PC460: Confused about usage of register: R27 in 'UnsetPending'

            -- DECOMPILER ERROR at PC461: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC462: Overwrote pending register: R34 in 'AssignReg'

            -- DECOMPILER ERROR at PC464: Confused about usage of register: R28 in 'UnsetPending'

            -- DECOMPILER ERROR at PC464: Confused about usage of register: R28 in 'UnsetPending'

          end
          -- DECOMPILER ERROR at PC484: Overwrote pending register: R34 in 'AssignReg'

          -- DECOMPILER ERROR at PC487: Confused about usage of register: R32 in 'UnsetPending'

          -- DECOMPILER ERROR at PC487: Overwrote pending register: R34 in 'AssignReg'

          -- DECOMPILER ERROR at PC490: Confused about usage of register: R33 in 'UnsetPending'

          -- DECOMPILER ERROR at PC490: Overwrote pending register: R34 in 'AssignReg'

          -- DECOMPILER ERROR at PC493: Overwrote pending register: R35 in 'AssignReg'

          -- DECOMPILER ERROR at PC495: Confused about usage of register: R29 in 'UnsetPending'

          -- DECOMPILER ERROR at PC504: Confused about usage of register: R27 in 'UnsetPending'

          if l_0_2 <= 0 + l_0_43 then
            l_0_48 = #{}
          end
          l_0_48 = l_0_3 <= l_0_48
          if not l_0_47 and not l_0_48 then
            l_0_49 = mp
            l_0_49 = l_0_49.CLEAN
            return l_0_49
          end
          l_0_49 = mp
          l_0_49 = l_0_49.get_contextdata
          l_0_50 = mp
          l_0_50 = l_0_50.CONTEXT_NAME_PROMPT_AGENT_SESSIONID
          l_0_49 = l_0_49(l_0_50)
          l_0_50 = mp
          l_0_50 = l_0_50.get_contextdata
          l_0_51 = mp
          l_0_51 = l_0_51.CONTEXT_DATA_NET_PROMPT_FRAMEWORK
          l_0_50 = l_0_50(l_0_51)
          l_0_51 = MpCommon
          l_0_51 = l_0_51.Base64Encode
          l_0_52 = string
          l_0_52 = l_0_52.sub
          l_0_53 = l_0_10
          l_0_54 = 1
          l_0_55 = 1024
          l_0_51 = l_0_51(l_0_52(l_0_53, l_0_54, l_0_55))
          -- DECOMPILER ERROR at PC537: Confused about usage of register: R26 in 'UnsetPending'

          -- DECOMPILER ERROR at PC541: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC546: Confused about usage of register: R28 in 'UnsetPending'

          -- DECOMPILER ERROR at PC546: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC552: Confused about usage of register: R27 in 'UnsetPending'

          -- DECOMPILER ERROR at PC552: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC553: Overwrote pending register: R45 in 'AssignReg'

          -- DECOMPILER ERROR at PC557: Confused about usage of register: R28 in 'UnsetPending'

          -- DECOMPILER ERROR at PC557: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC561: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC565: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC578: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC584: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC588: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC594: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC595: Overwrote pending register: R45 in 'AssignReg'

          -- DECOMPILER ERROR at PC603: Overwrote pending register: R44 in 'AssignReg'

          -- DECOMPILER ERROR at PC604: Overwrote pending register: R45 in 'AssignReg'

          if (((not l_0_49 and l_0_50) or (MpCommon.IsSampled)(l_0_54, l_0_55, l_0_56, l_0_57) == false) and safeJsonSerialize({score = tostring(l_0_54), threshold = tostring(l_0_54), matched = (table.concat)(l_0_54, l_0_55), categories = (table.concat)(l_0_54, l_0_55), count = tostring(l_0_54), raw_matches = tostring(l_0_54), verb_gate = tostring(l_0_54), trigger = l_0_47 and "categorical" or "score", agent_session_id = tostring(l_0_54), framework = tostring(l_0_54), buffer_len = tostring(l_0_54), last_message = l_0_51, buffer = (MpCommon.Base64Encode)(l_0_54(l_0_55))}) == nil) or #safeJsonSerialize({score = tostring(l_0_54), threshold = tostring(l_0_54), matched = (table.concat)(l_0_54, l_0_55), categories = (table.concat)(l_0_54, l_0_55), count = tostring(l_0_54), raw_matches = tostring(l_0_54), verb_gate = tostring(l_0_54), trigger = l_0_47 and "categorical" or "score", agent_session_id = tostring(l_0_54), framework = tostring(l_0_54), buffer_len = tostring(l_0_54), last_message = l_0_51, buffer = (MpCommon.Base64Encode)(l_0_54(l_0_55))}) == 0 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC621: Overwrote pending register: R46 in 'AssignReg'

          -- DECOMPILER ERROR at PC622: Overwrote pending register: R46 in 'AssignReg'

          -- DECOMPILER ERROR at PC623: Overwrote pending register: R47 in 'AssignReg'

          -- DECOMPILER ERROR at PC625: Overwrote pending register: R47 in 'AssignReg'

          set_research_data("AtrAIPromptInject", l_0_56, l_0_57)
          ;
          (mp.SetDetectionString)(safeJsonSerialize({score = tostring(l_0_54), threshold = tostring(l_0_54), matched = (table.concat)(l_0_54, l_0_55), categories = (table.concat)(l_0_54, l_0_55), count = tostring(l_0_54), raw_matches = tostring(l_0_54), verb_gate = tostring(l_0_54), trigger = l_0_47 and "categorical" or "score", agent_session_id = tostring(l_0_54), framework = tostring(l_0_54), buffer_len = tostring(l_0_54), last_message = l_0_51, buffer = (MpCommon.Base64Encode)(l_0_54(l_0_55))}))
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC634: Confused about usage of register R45 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 24 unprocessed JMP targets
        end
      end
    end
  end
end

