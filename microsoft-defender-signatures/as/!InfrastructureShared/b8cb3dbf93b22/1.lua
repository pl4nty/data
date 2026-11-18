-- Threat: !InfrastructureShared
-- Name: b8cb3dbf93b22
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0(l_1_0)
  if l_1_0 ~= nil and l_1_0.matched == true and l_1_0.utf8p2 ~= nil and l_1_0.utf8p2 ~= "" then
    return l_1_0
  end
  return nil
end

local l_0_1 = l_0_0(this_sigattrlog[1]) or l_0_0(this_sigattrlog[2]) or l_0_0(this_sigattrlog[3]) or l_0_0(this_sigattrlog[4]) or l_0_0(this_sigattrlog[5]) or l_0_0(this_sigattrlog[6]) or l_0_0(this_sigattrlog[7]) or l_0_0(this_sigattrlog[8]) or l_0_0(this_sigattrlog[9]) or l_0_0(this_sigattrlog[10]) or l_0_0(this_sigattrlog[11]) or l_0_0(this_sigattrlog[12]) or l_0_0(this_sigattrlog[13]) or l_0_0(this_sigattrlog[14]) or l_0_0(this_sigattrlog[15]) or l_0_0(this_sigattrlog[16]) or l_0_0(this_sigattrlog[17]) or l_0_0(this_sigattrlog[18]) or l_0_0(this_sigattrlog[19]) or l_0_0(this_sigattrlog[20]) or l_0_0(this_sigattrlog[21]) or l_0_0(this_sigattrlog[22]) or l_0_0(this_sigattrlog[23]) or l_0_0(this_sigattrlog[24]) or l_0_0(this_sigattrlog[25]) or l_0_0(this_sigattrlog[26]) or l_0_0(this_sigattrlog[27]) or l_0_0(this_sigattrlog[28]) or l_0_0(this_sigattrlog[29]) or l_0_0(this_sigattrlog[30]) or l_0_0(this_sigattrlog[31]) or l_0_0(this_sigattrlog[32]) or l_0_0(this_sigattrlog[33]) or l_0_0(this_sigattrlog[34]) or l_0_0(this_sigattrlog[35]) or l_0_0(this_sigattrlog[36]) or l_0_0(this_sigattrlog[37]) or l_0_0(this_sigattrlog[38]) or l_0_0(this_sigattrlog[39]) or l_0_0(this_sigattrlog[40]) or l_0_0(this_sigattrlog[41]) or l_0_0(this_sigattrlog[42]) or l_0_0(this_sigattrlog[43]) or l_0_0(this_sigattrlog[44]) or l_0_0(this_sigattrlog[45]) or l_0_0(this_sigattrlog[46])
local l_0_3 = l_0_1 == nil
if l_0_3 then
  l_0_1 = l_0_0(this_sigattrlog[47]) or l_0_0(this_sigattrlog[48])
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_4 = tostring(l_0_1.utf8p2)
local l_0_5 = tostring(l_0_1.utf8p1)
local l_0_6 = string.lower(l_0_4)
if string.len(l_0_4) > 3000 then
  return mp.CLEAN
end
if l_0_3 and string.match(l_0_6, "^%s*https?://") then
  return mp.CLEAN
end
local l_0_7 = NormalizeClickFixCommand(l_0_4)
if l_0_3 then
  local l_0_8 = string.match(l_0_7, "^%s*\"([^\"]+)\"") or string.match(l_0_7, "^%s*([^%s]+)")
  local l_0_9 = l_0_8 and string.match(l_0_8, "[^\\/]+$") or ""
  l_0_9 = string.gsub(l_0_9, "%.exe$", "")
  local l_0_10 = {
    powershell = true,
    pwsh = true,
    cmd = true,
    conhost = true,
    curl = true,
    wget = true,
    mshta = true,
    msiexec = true,
    regsvr32 = true,
    rundll32 = true,
    bitsadmin = true,
    certutil = true,
    wscript = true,
    cscript = true,
    ["%comspec%"] = true
  }
  if not l_0_10[l_0_9] then
    return mp.CLEAN
  end
end
local l_0_11 = {
  ["irm pwsh.sh | iex"] = true,
  ["powershell -ep bypass -c \"irm https://voicestudio.sh/install.ps1|iex\""] = true,
  ["wget http://fishros.com/install -o fishros && . fishros"] = true,
  ["wget http://fishros.com/install -o fishros && bash fishros"] = true,
  ["source <(wget -qo- https://fishros.com/install)"] = true,
  ["powershell -noprofile -executionpolicy bypass -command \"[net.servicepointmanager]::securityprotocol = [net.securityprotocoltype]::tls12; & ([scriptblock]::create((invoke-restmethod 'https://gigacode.ru/desktop/install.ps1')))\""] = true
}
if l_0_11[string.match(l_0_6, "^%s*(.-)%s*$")] then
  return mp.CLEAN
end

local function l_0_12(l_2_0)
  if not string.match(l_2_0, "^%s*\"?certutil") or contains(l_2_0, {
    "&",
    "|",
    "<",
    ">",
    ";",
    "^",
    "`",
    "%",
    "$",
    "!",
    "(",
    ")",
    "\r",
    "\n"
  }) then
    return false
  end
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" or #l_2_2 ~= 4 then
    return false
  end
  return (l_2_2[1] == "certutil" or l_2_2[1] == "certutil.exe") and l_2_2[2] == "-hashfile" and l_2_2[3] ~= "" and not string.match(l_2_2[3], "^[-/\\]") and not string.find(l_2_2[3], "://", 1, true) and (l_2_2[4] == "sha256" or l_2_2[4] == "sha384" or l_2_2[4] == "sha512")
end

if l_0_12(l_0_6) then
  return mp.CLEAN
end

local function l_0_13(l_3_0, l_3_1)
  if l_3_0 == nil or l_3_1 == nil then
    return false
  end
  l_3_1 = string.lower(tostring(l_3_1))
  l_3_1 = string.gsub(l_3_1, "^%.", "")
  l_3_1 = string.gsub(l_3_1, "%.$", "")
  if l_3_1 == "" then
    return false
  end
  if l_3_0 == l_3_1 then
    return true
  end
  if l_3_1 == "localhost" or string.match(l_3_1, "^%d+%.%d+%.%d+%.%d+$") then
    return false
  end
  local l_3_2 = "." .. l_3_1
  return string.len(l_3_0) > string.len(l_3_2) and string.sub(l_3_0, -string.len(l_3_2)) == l_3_2
end

local l_0_14 = {
  "github.com",
  "githubusercontent.com",
  "gitlab.com",
  "get.activated.win",
  "christitus.com/win",
  "windows defender advanced threat protection",
  "claude.ai"
}
if contains(l_0_6, l_0_14) then
  return mp.CLEAN
end
local l_0_15 = {
  "localhost",
  "127.0.0.1",
  "astral.sh",
  "packages.wazuh.com",
  "community.chocolatey.org",
  "download.bt.cn",
  "get.scoop.sh",
  "get.pnpm.io",
  "cdn.cs50.net",
  "repo.zabbix.com",
  "aka.ms",
  "deno.land",
  "omp.sh",
  "ark.cn-beijing.volces.com",
  "dl.google.com",
  "www.aapanel.com",
  "php.new",
  "docs.higgsfield.ai",
  "api.higgsfield.ai",
  "portalapi.balboadigital.com",
  "repo.anaconda.com",
  "lmstudio.ai",
  "dml.bpglobal.com",
  "download.splunk.com",
  "docs.microsoft.com",
  "edu-res.hc-cdn.cn",
  "qoder.com",
  "artifacts.elastic.co",
  "mirrors.aliyun.com",
  "packages.microsoft.com",
  "dl.min.io",
  "meta.fabricmc.net",
  "ai.snowflake.com",
  "www.openinterpreter.com",
  "get.hacs.xyz",
  "cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud",
  "ark-project.tos-cn-beijing.volces.com",
  "atlassian.com",
  "github.qualcomm.com",
  "nextjs.org",
  "eslint.org",
  "nya.globalslb.net",
  "tools.mariusheier.com",
  "physionet.org",
  "www.w3.org",
  "static.devin.ai",
  "serverless.roboflow.com",
  "login.microsoftonline.com",
  "graph.microsoft.com",
  "nginx.org",
  "artifacts.mastercard.int",
  "apt.releases.hashicorp.com",
  "www.python.org",
  "devcloud.ubs.net",
  "get.winhance.net",
  "rmm.datto.com",
  "nodejs.org",
  "releases.jfrog.io",
  "deb.debian.org",
  "pkg.jenkins.io",
  "rclone.org",
  "api.x.ai",
  "floci.io",
  "dl.openfoam.org",
  "cdn.deepseek.com",
  "int.repositories.cloud.sap",
  "mise.run",
  "bootstrap.pypa.io",
  "developer.download.nvidia.com",
  "chocolatey.org",
  "api.stripe.com",
  "cs50.harvard.edu",
  "rbcm-gerrit.de.bosch.com",
  "minio.epic.com",
  "archive.ubuntu.com",
  "bun.sh",
  "api.groq.com",
  "go.microsoft.com",
  "review-android.quicinc.com",
  "code.kimi.ai",
  "gerrit-gamma.gic.ericsson.se",
  "claude.ai",
  "catalog.sf.dl.delivery.mp.microsoft.com",
  "packages.openvpn.net",
  "cdn.openlua.cloud",
  "agent.rabbit.tech",
  "releases.rive.app",
  "create.tauri.app",
  "get.netdata.cloud",
  "cli.devin.ai",
  "download.checkmk.com",
  "jimeng.jianying.com",
  "dreamina.capcut.com",
  "seb.cchef.co",
  "ai-desktop.aig.de101.cgm.ag",
  "kurzy.kpi.fei.tuke.sk",
  "download.microsoft.com",
  "artefacts.lloydsbanking.cloud",
  "vicarius-installer.s3.amazonaws.com",
  "storage.yandexcloud.net",
  "chatgpt.com",
  "vite.plus",
  "cli.stripe.com",
  "openclaw.ai",
  "debloat.raphi.re",
  "wwwn.cdc.gov",
  "install.python-poetry.org",
  "cli.tigerdata.com",
  "aider.chat",
  "hermes-agent.nousresearch.com",
  "kotl.in",
  "antigravity.google",
  "pixi.sh",
  "api.openai.com",
  "install.duckdb.org",
  "api.fish.audio",
  "goauthentik.io",
  "maven.neoforged.net",
  "download.swift.org",
  "install.pi-hole.net",
  "download.docker.com",
  "getcomposer.org"
}
local l_0_16 = {
  cfd = true,
  icu = true,
  lol = true,
  monster = true,
  xyz = true
}

local function l_0_17(l_4_0)
  for l_4_1 in string.gmatch(l_4_0, "https?://[^%s\"'<>%)%]%}]+") do
    local l_4_2 = ExtractPartsFromUri(l_4_1)
    if next(l_4_2) ~= nil and l_4_2.host ~= nil then
      local l_4_3 = string.lower(tostring(l_4_2.host))
      l_4_3 = string.gsub(l_4_3, "%.$", "")
      local l_4_4 = string.match(l_4_3, "%.([%a][%a%d%-]*)$")
      if l_4_4 ~= nil and l_0_16[l_4_4] == true then
        return true
      end
    end
  end
  return false
end

local function l_0_18(l_5_0)
  local l_5_1 = false
  for l_5_2 in string.gmatch(l_5_0, "https?://[^%s\"'<>%)%]%}]+") do
    local l_5_3 = ExtractPartsFromUri(l_5_2)
    if next(l_5_3) ~= nil and l_5_3.host ~= nil then
      l_5_1 = true
      local l_5_4 = string.lower(tostring(l_5_3.host))
      l_5_4 = string.gsub(l_5_4, "%.$", "")
      local l_5_5 = false
      for l_5_6, l_5_7 in ipairs(l_0_15) do
        if l_0_13(l_5_4, l_5_7) then
          l_5_5 = true
          break
        end
      end
      if not l_5_5 then
        return false
      end
    end
  end
  return l_5_1
end

if l_0_18(l_0_6) then
  return mp.CLEAN
end
local l_0_19, l_0_20 = mp.CheckUrl(l_0_5)
if l_0_19 == 1 and l_0_20 == 1 then
  return mp.CLEAN
end
local l_0_21, l_0_22 = string.gsub(l_0_4, "%^", "")
local l_0_23, l_0_24 = string.gsub(l_0_4, "%`", "")
local l_0_25 = {
  "invoke-expression",
  "iex(",
  "iex ",
  "|iex",
  "| iex",
  ";iex",
  "invoke-webrequest",
  "iwr ",
  "invoke-restmethod",
  "irm ",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "net.webclient",
  "webclient).download",
  "system.net",
  "httpclient",
  "getstringasync",
  "frombase64string",
  "-encodedcommand",
  "-enc ",
  "-nop",
  "-noprofile",
  "-noninteractive",
  "-w hidden",
  "-windowstyle hidden",
  "-windowstyle h",
  "-executionpolicy bypass",
  "-ep bypass",
  "start-bitstransfer",
  "bitsadmin /transfer",
  "-urlcache",
  "certutil -",
  "certutil.exe",
  "regsvr32 /i:http",
  "regsvr32 /s /n /u /i:",
  "scrobj",
  "mshta http",
  "mshta javascript",
  "mshta vbscript",
  "rundll32",
  "curl http",
  "curl -o",
  "wget http",
  "powershell -win mi -e",
  "gcm ",
  "finger ",
  "tar -x",
  "curl -sk",
  "wget -",
  "%comspec%",
  "msiexec /i http",
  "msiexec /q ",
  "&echo copy",
  "-usebasicparsing",
  "-wi ",
  "-w h",
  "-noexit",
  " %temp%\\",
  "cmd /",
  "%~zf==2",
  "for /r",
  "do start",
  "cmd /c",
  "pcalua"
}

local function l_0_26(l_6_0)
  for l_6_1, l_6_2 in ipairs({
    "curl",
    "wget",
    "mshta"
  }) do
    for l_6_3, l_6_4 in ipairs({
      l_6_2,
      l_6_2 .. "%.exe"
    }) do
      local l_6_5 = "%f[%w_]" .. l_6_4 .. "[\"']?%s+([^;&|\r\n]+)"
      for l_6_6 in string.gmatch(l_6_0, l_6_5) do
        local l_6_8 = string.match(l_6_6, "https?://[^/\\%s?#]") ~= nil
        if l_6_2 == "mshta" then
          if l_6_8 or contains(l_6_6, {
            "javascript:",
            "vbscript:"
          }) then
            return true
          end
        elseif l_6_8 then
          local l_6_9 = " " .. l_6_6
          if l_6_2 == "wget" or string.find(l_6_9, "%s%-%-output[=%s]") or string.find(l_6_9, "%s%-[fiklsv]*o[%s=]") then
            return true
          end
        end
      end
    end
  end
  return false
end

local function l_0_27(l_7_0)
  if not contains(l_7_0, "msiexec") or not contains(l_7_0, {
    "http://",
    "https://",
    "http:\\",
    "https:\\"
  }) then
    return false
  end
  local l_7_1, l_7_2 = pcall(MpCommon.CommandLineToArgv, l_7_0)
  if not l_7_1 or type(l_7_2) ~= "table" or #l_7_2 < 3 then
    return false
  end
  local l_7_3 = string.match(l_7_2[1], "[^\\/]+$")
  if l_7_3 ~= "msiexec" and l_7_3 ~= "msiexec.exe" then
    return false
  end
  local l_7_4 = "/\225\181\150\225\181\131\225\182\156" .. "\225\181\143\225\181\131\225\181\141\225\181\137"
  for l_7_5 = 2, #l_7_2 - 1 do
    local l_7_6 = string.gsub(l_7_2[l_7_5], "^%-", "/")
    if l_7_6 == "/i" or l_7_6 == "/package" or l_7_6 == l_7_4 then
      local l_7_7 = l_7_2[l_7_5 + 1]
      return string.match(l_7_7, "^https?://[^/\\%s?#]") ~= nil or string.match(l_7_7, "^https?:\\+[^/\\%s?#]") ~= nil
    end
  end
  return false
end

local l_0_28 = l_0_27(l_0_7)
local l_0_29 = {
  "--headless",
  "/v:on",
  "%comspec%",
  "@ssl\\",
  "vbscript:",
  "wscript.shell"
}
local l_0_30 = contains(l_0_7, l_0_25) or l_0_28 or l_0_26(l_0_7)
if l_0_3 and not l_0_30 then
  return mp.CLEAN
end
if not l_0_30 and not (l_0_22 >= 3) and not (l_0_24 >= 3) and not contains(l_0_7, l_0_29) then
  return mp.CLEAN
end
local l_0_31 = {
  "chatgpt.com",
  "openai.com",
  "claude.ai",
  "claude.com",
  "anthropic.com",
  "grok.com",
  "deepseek.com",
  "google.com",
  "antigravity.google",
  "qwen.ai",
  "chat.z.ai",
  "kimi.com",
  "doubao.com",
  "perplexity.ai",
  "huggingface.co",
  "openrouter.ai",
  "mistral.ai",
  "arena.ai",
  "meta.ai",
  "nousresearch.com",
  "opencode.ai",
  "openclaw.ai",
  "kiro.dev",
  "lovable.dev",
  "cursor.com",
  "manus.im",
  "unsloth.ai",
  "venice.ai",
  "notion.com",
  "notion.so",
  "microsoft.com",
  "visualstudio.com",
  "azure.com",
  "azure.net",
  "azurewebsites.net",
  "windows.net",
  "office.com",
  "office.net",
  "office365.com",
  "sharepoint.com",
  "sharepoint-df.com",
  "cloud.microsoft",
  "dynamics.com",
  "powerbi.com",
  "powerautomate.com",
  "microsofticm.com",
  "microsoftgeneva.com",
  "microsoftonline.com",
  "bing.com",
  "live.com",
  "msn.com",
  "skype.com",
  "eng.ms",
  "jwt.ms",
  "owiki.ms",
  "osgwiki.com",
  "microsoft.ghe.com",
  "githubusercontent.com",
  "youtube.com",
  "googleusercontent.com",
  "withgoogle.com",
  "aws.amazon.com",
  "amazon.com",
  "amazonworkspaces.com",
  "workshops.aws",
  "github.com",
  "gitlab.com",
  "stackoverflow.com",
  "npmjs.com",
  "pypi.org",
  "python.org",
  "nodejs.org",
  "docker.com",
  "kubernetes.io",
  "jetbrains.com",
  "astral.sh",
  "brew.sh",
  "bun.sh",
  "bun.com",
  "ollama.com",
  "pi.dev",
  "figma.com",
  "overleaf.com",
  "supabase.com",
  "devolutions.net",
  "rust-lang.org",
  "virustotal.com",
  "digitalocean.com",
  "medium.com",
  "csdn.net",
  "zhihu.com",
  "cnblogs.com",
  "qiita.com",
  "anaconda.com",
  "hashicorp.com",
  "linuxmint.com",
  "askubuntu.com",
  "tryhackme.com",
  "vocareum.com",
  "ohmyposh.dev",
  "skills.google",
  "tailscale.com",
  "cloudflare.com",
  "salesforce.com",
  "lightning.force.com",
  "service-now.com",
  "atlassian.net",
  "adobe.com",
  "sap.com",
  "oracle.com",
  "ibm.com",
  "dropbox.com",
  "nvidia.com",
  "databricks.com",
  "azuredatabricks.net",
  "clerk.com",
  "pureauth.io",
  "canva.com",
  "kaggle.com",
  ".db.de",
  "deutschebahn.com",
  "tatacapital.com",
  "bajajfinserv.in",
  "xiaomi.com",
  "tencent.com",
  "whatsapp.com",
  "facebook.com",
  "instagram.com",
  "linkedin.com",
  "reddit.com",
  "discord.com",
  "telegram.org",
  "slack.com",
  "bilibili.com",
  "baidu.com",
  "walmart.com",
  "yahoo.com",
  "apple.com",
  "icloud.com",
  "duckduckgo.com",
  "perchance.org",
  "localhost",
  "127.0.0.1",
  "www.runoob.com",
  "www.jenkins.io",
  "www.filestash.app",
  "get.activated.win",
  "ublockdns.com",
  "localhost:",
  "api.justwoker.icu",
  "docs.immich.app",
  "herdr.dev",
  "massgrave.dev",
  "paste.jmend.cc",
  "seekai.cc",
  "gapgpt.app",
  "gorouter.app",
  "v0.app",
  "apinex.bond",
  "timeweb.cloud",
  "di.internal.bosch.cloud",
  "tinyinstaller.top",
  "paimon.moe",
  "lovable.app",
  "pnpm.io",
  "xstarry.dev",
  "lua.tools",
  "christitus.com",
  "x.ai",
  "omp.sh",
  "chocolatey.org",
  "scoop.sh",
  "llama.app",
  "wuwatracker.com",
  "massgrave-dev.translate.goog",
  "starrailstation.com",
  "teamworkgraph.com",
  "docs.digital.bpglobal.com",
  "tools.mariusheier.com",
  "portal.balboadigital.com",
  "www.kimi.ai",
  "docs.deno.com",
  "docs.manim.community",
  "www.qianwen.com",
  "www.haskell.org",
  "app.snowflake.com",
  "stardb.gg",
  "packages.trilogycare.com.au",
  "app.factory.ai",
  "noggin.epic.com",
  "fly.io",
  "modelcontextprotocol.io",
  "floci.io",
  "spicetify.app",
  "cs50.harvard.edu",
  "www.zabbix.com",
  "zzz.rng.moe",
  "lumo.proton.me",
  "app.clockify.me",
  "se-bot.mx.siemens-energy.cloud",
  "app.testcontainers.cloud",
  "vercel.com",
  "app.dataannotation.tech",
  "orchard.iamneo.in",
  "www.aapanel.com",
  "www.bt.cn",
  "academy.hackthebox.com",
  "labs.cognitiveclass.ai",
  "edu.huaweicloud.com",
  "console.volcengine.com",
  "laravel.com",
  "labclient.labondemand.com",
  "copilot.com",
  "www.coursera.org",
  "lmstudio.ai",
  "portal.offsec.com",
  "www.splunk.com",
  "qoder.com",
  "devcloud.ubs.net",
  "learn.kodekloud.com",
  "secure.weda.fr",
  "exam.nowcoder.com",
  "ai-docs.portal.hyperspace.tools.sap",
  "collab.nse.co.in",
  "superuser.com",
  "hpanel.hostinger.com",
  "winhance.net",
  "rmm.datto.com",
  "crowdstrike.com",
  "vnc.htb-cloud.com",
  "deno.com",
  "physionet.org",
  "app.glean.com",
  "docs.devin.ai",
  "open.higgsfield.ai",
  "qgenie-docs.qualcomm.com",
  "atlassian.com",
  "fabricmc.net",
  "universe.roboflow.com",
  "grafana.com",
  "schneegans.de",
  "www.natfrp.com",
  "ckey.run",
  "www.postman.com",
  "character.ai",
  "janitorai.com",
  "duck.ai",
  "jimeng.jianying.com",
  "dreamina.capcut.com",
  "www.mcp-for-blender.com",
  "moonrepo.dev",
  "checkmk.com",
  "www.codechef.com",
  "guide.openlua.cloud",
  "os3.rabbit.tech",
  "app.devin.ai",
  "rive.app",
  "v2.tauri.app",
  "app.netdata.cloud",
  "openvpn.net",
  "qgenie-chat.qualcomm.com",
  "aihub.qualcomm.com",
  "wiki.one.int.sap",
  "iitg.ac.in",
  "kurzy.kpi.fei.tuke.sk",
  "ai-desktop.aig.de101.cgm.ag",
  "cortex.lloydsbanking.cloud",
  "cloudbrothers.info",
  "delinea.app",
  "elastic.cloud",
  "yandex.cloud",
  "veeam.com",
  "bernard.swisscom.com",
  "setup.claude.de101.cgm.ag",
  "openwebui.int.lucanet.cloud",
  "ai-platform-frontend.dev.cdp-int.defra.cloud",
  "docs.stripe.com",
  "python-poetry.org",
  "aider.chat",
  "kotlinlang.org",
  "pixi.prefix.dev",
  "viteplus.dev",
  "duckdb.org",
  "fish.audio",
  "docs.goauthentik.io",
  "docs.neoforged.net",
  "starship.rs",
  "www.swift.org",
  "docs.pi-hole.net"
}
local l_0_32 = ExtractPartsFromUri(l_0_5)
if next(l_0_32) == nil then
  return mp.CLEAN
end
if l_0_32.host == nil then
  return mp.CLEAN
end
local l_0_33 = string.lower(tostring(l_0_32.host))
l_0_33 = string.gsub(l_0_33, "%.$", "")
for l_0_34, l_0_35 in ipairs(l_0_31) do
  if l_0_13(l_0_33, l_0_35) then
    return mp.CLEAN
  end
end
local l_0_36 = false
local l_0_37 = string.lower(l_0_4)
local l_0_38 = string.match(l_0_33, "%.([%a][%a%d%-]*)$")
if l_0_38 ~= nil and isSuspTLD(l_0_38) or l_0_17(l_0_6) then
  l_0_36 = true
  AppendToRollingQueue("IsClickFixCMD_Malicious", l_0_37, l_0_5 or "1", 600, 200, 1)
end
if l_0_5 ~= nil then
  local l_0_39 = {}
  l_0_39.SIG_CONTEXT = "ClickFix"
  l_0_39.CONTENT_SOURCE = "ETW_ClipWrite"
  l_0_39.TAG = "INTERFLOW"
  l_0_39.isSuspTld = tostring(l_0_36)
  local l_0_40 = SafeGetUrlReputation({l_0_5}, l_0_39, false, 3000)
  if l_0_40.urls[l_0_5] and l_0_40.urls[l_0_5].determination == 2 and l_0_40.urls[l_0_5].confidence >= 60 then
    local l_0_41 = l_0_40.urls[l_0_5].determination
    AppendToRollingQueue("IsClickFixCMD_ConfirmedMalicious", l_0_37, l_0_5, 600, 200, 1)
    bm.trigger_sig("ETW_ClipWrite", string.format("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_5), tostring(l_0_4), tostring(l_0_41)))
  end
end
if not l_0_36 then
  AppendToRollingQueue("IsClickFixCMD", l_0_37, l_0_5 or "1", 600, 200, 1)
end
bm.add_related_string("ETW_ClipWrite_CMD", tostring(l_0_4), bm.RelatedStringBMReport)
bm.add_related_string("ETW_ClipWrite_isSuspTld", tostring(l_0_36), bm.RelatedStringBMReport)
return mp.INFECTED
