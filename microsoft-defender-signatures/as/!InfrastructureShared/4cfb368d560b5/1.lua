-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4cfb368d560b5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 ~= nil and l_1_0.matched == true and l_1_0.utf8p2 ~= nil and l_1_0.utf8p2 ~= "" then
    return l_1_0
  end
  return nil
end

do
  if not l_0_0(this_sigattrlog[1]) and not l_0_0(this_sigattrlog[2]) and not l_0_0(this_sigattrlog[3]) and not l_0_0(this_sigattrlog[4]) and not l_0_0(this_sigattrlog[5]) and not l_0_0(this_sigattrlog[6]) and not l_0_0(this_sigattrlog[7]) and not l_0_0(this_sigattrlog[8]) and not l_0_0(this_sigattrlog[9]) and not l_0_0(this_sigattrlog[10]) and not l_0_0(this_sigattrlog[11]) and not l_0_0(this_sigattrlog[12]) and not l_0_0(this_sigattrlog[13]) and not l_0_0(this_sigattrlog[14]) and not l_0_0(this_sigattrlog[15]) and not l_0_0(this_sigattrlog[16]) and not l_0_0(this_sigattrlog[17]) and not l_0_0(this_sigattrlog[18]) and not l_0_0(this_sigattrlog[19]) and not l_0_0(this_sigattrlog[20]) then
    local l_0_1, l_0_2, l_0_3 = l_0_0(this_sigattrlog[21])
  end
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  local l_0_5 = tostring(l_0_1.utf8p2)
  if (string.len)(l_0_5) > 256 then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = , (mp.CheckUrl)(tostring(l_0_4.utf8p1))
  if l_0_7 == 1 and tostring(l_0_4.utf8p1) == 1 then
    return mp.CLEAN
  end
  local l_0_8 = nil
  local l_0_9 = nil
  local l_0_10, l_0_11 = (function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil then
    return ""
  end
  return (string.gsub)((string.lower)(l_2_0), "%^", "")
end
)(l_0_5), (string.gsub)(l_0_5, "%^", "")
  local l_0_12 = nil
  local l_0_13 = {"invoke-expression", "iex(", "iex ", "|iex", "| iex", ";iex", "invoke-webrequest", "iwr ", "invoke-restmethod", "irm ", "downloadstring", "downloadfile", "downloaddata", "net.webclient", "webclient).download", "system.net", "frombase64string", "-encodedcommand", "-enc ", "-nop", "-noprofile", "-noninteractive", "-w hidden", "-windowstyle hidden", "-windowstyle h", "-executionpolicy bypass", "-ep bypass", "start-bitstransfer", "bitsadmin /transfer", "-urlcache", "certutil -", "certutil.exe", "regsvr32 /i:http", "regsvr32 /s /n /u /i:", "scrobj", "mshta http", "mshta javascript", "mshta vbscript", "rundll32", "curl http", "curl -o", "wget http", "finger ", "tar -x", "curl -sk", "wget -", "msiexec /i http", "msiexec /q ", "-usebasicparsing", "-wi ", "-w h", "-noexit"}
  if not contains(l_0_10, l_0_13) and l_0_12 < 3 and not contains(l_0_10, {"--headless", "/v:on", "%comspec%", "@ssl\\", "vbscript:", "wscript.shell"}) then
    return mp.CLEAN
  end
  local l_0_14 = nil
  if l_0_6 ~= nil and contains(l_0_6, {"chatgpt.com", "openai.com", "claude.ai", "claude.com", "anthropic.com", "grok.com", "deepseek.com", "google.com", "antigravity.google", "qwen.ai", "chat.z.ai", "kimi.com", "doubao.com", "perplexity.ai", "huggingface.co", "openrouter.ai", "mistral.ai", "arena.ai", "meta.ai", "nousresearch.com", "opencode.ai", "openclaw.ai", "kiro.dev", "lovable.dev", "cursor.com", "manus.im", "unsloth.ai", "venice.ai", "notion.com", "notion.so", "microsoft.com", "visualstudio.com", "azure.com", "azure.net", "azurewebsites.net", "windows.net", "office.com", "office.net", "office365.com", "sharepoint.com", "sharepoint-df.com", "cloud.microsoft", "dynamics.com", "powerbi.com", "powerautomate.com", "microsofticm.com", "microsoftgeneva.com", "microsoftonline.com", "bing.com", "live.com", "msn.com", "skype.com", "eng.ms", "jwt.ms", "owiki.ms", "osgwiki.com", "microsoft.ghe.com", "githubusercontent.com", "youtube.com", "googleusercontent.com", "withgoogle.com", "aws.amazon.com", "amazon.com", "amazonworkspaces.com", "workshops.aws", "github.com", "gitlab.com", "stackoverflow.com", "npmjs.com", "pypi.org", "python.org", "nodejs.org", "docker.com", "kubernetes.io", "jetbrains.com", "astral.sh", "brew.sh", "bun.sh", "bun.com", "ollama.com", "pi.dev", "figma.com", "overleaf.com", "supabase.com", "devolutions.net", "rust-lang.org", "virustotal.com", "digitalocean.com", "medium.com", "csdn.net", "zhihu.com", "cnblogs.com", "qiita.com", "tailscale.com", "cloudflare.com", "salesforce.com", "lightning.force.com", "service-now.com", "atlassian.net", "adobe.com", "sap.com", "oracle.com", "ibm.com", "dropbox.com", "nvidia.com", "databricks.com", "azuredatabricks.net", "clerk.com", "pureauth.io", "canva.com", "kaggle.com", ".db.de", "deutschebahn.com", "tatacapital.com", "bajajfinserv.in", "xiaomi.com", "tencent.com", "whatsapp.com", "facebook.com", "instagram.com", "linkedin.com", "reddit.com", "discord.com", "telegram.org", "slack.com", "bilibili.com", "baidu.com", "walmart.com", "yahoo.com", "apple.com", "icloud.com", "duckduckgo.com", "perchance.org", "localhost", "127.0.0.1"}) then
    return mp.CLEAN
  end
  local l_0_15 = nil
  if l_0_6 ~= nil then
    local l_0_16 = (string.lower)(l_0_5)
    local l_0_17 = {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW"}
    local l_0_18 = SafeGetUrlReputation
    l_0_18 = l_0_18({l_0_6}, l_0_17, false, 2000)
    if (l_0_18.urls)[l_0_6] and ((l_0_18.urls)[l_0_6]).determination == 2 and ((l_0_18.urls)[l_0_6]).confidence >= 60 then
      (bm.trigger_sig)("ETW_ClipWrite", (string.format)("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_6), tostring(l_0_5), tostring(((l_0_18.urls)[l_0_6]).determination)))
    end
  end
  do
    local l_0_19 = nil
    local l_0_20 = AppendToRollingQueue
    local l_0_21 = "IsClickFixCMD"
    do
      l_0_20(l_0_21, l_0_19, l_0_6 or "1", 600, 200, 1)
      l_0_20 = mp
      l_0_20 = l_0_20.INFECTED
      do return l_0_20 end
      -- DECOMPILER ERROR at PC461: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

