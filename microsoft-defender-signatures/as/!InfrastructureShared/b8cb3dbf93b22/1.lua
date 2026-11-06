-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b8cb3dbf93b22\1.luac 

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
  if not l_0_0(this_sigattrlog[1]) and not l_0_0(this_sigattrlog[2]) and not l_0_0(this_sigattrlog[3]) and not l_0_0(this_sigattrlog[4]) and not l_0_0(this_sigattrlog[5]) and not l_0_0(this_sigattrlog[6]) and not l_0_0(this_sigattrlog[7]) and not l_0_0(this_sigattrlog[8]) and not l_0_0(this_sigattrlog[9]) and not l_0_0(this_sigattrlog[10]) and not l_0_0(this_sigattrlog[11]) and not l_0_0(this_sigattrlog[12]) and not l_0_0(this_sigattrlog[13]) and not l_0_0(this_sigattrlog[14]) and not l_0_0(this_sigattrlog[15]) and not l_0_0(this_sigattrlog[16]) and not l_0_0(this_sigattrlog[17]) and not l_0_0(this_sigattrlog[18]) and not l_0_0(this_sigattrlog[19]) and not l_0_0(this_sigattrlog[20]) and not l_0_0(this_sigattrlog[21]) and not l_0_0(this_sigattrlog[22]) and not l_0_0(this_sigattrlog[23]) and not l_0_0(this_sigattrlog[24]) and not l_0_0(this_sigattrlog[25]) and not l_0_0(this_sigattrlog[26]) and not l_0_0(this_sigattrlog[27]) and not l_0_0(this_sigattrlog[28]) and not l_0_0(this_sigattrlog[29]) and not l_0_0(this_sigattrlog[30]) and not l_0_0(this_sigattrlog[31]) and not l_0_0(this_sigattrlog[32]) and not l_0_0(this_sigattrlog[33]) and not l_0_0(this_sigattrlog[34]) and not l_0_0(this_sigattrlog[35]) and not l_0_0(this_sigattrlog[36]) and not l_0_0(this_sigattrlog[37]) and not l_0_0(this_sigattrlog[38]) and not l_0_0(this_sigattrlog[39]) and not l_0_0(this_sigattrlog[40]) and not l_0_0(this_sigattrlog[41]) and not l_0_0(this_sigattrlog[42]) and not l_0_0(this_sigattrlog[43]) and not l_0_0(this_sigattrlog[44]) and not l_0_0(this_sigattrlog[45]) then
    local l_0_1, l_0_3 = l_0_0(this_sigattrlog[46])
  end
  -- DECOMPILER ERROR at PC275: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC292: freeLocal<0 in 'ReleaseLocals'

  if not l_0_1 == nil or l_0_0(this_sigattrlog[47]) or l_0_0(this_sigattrlog[48]) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC298: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_11 = nil
  -- DECOMPILER ERROR at PC301: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_12 = nil
  local l_0_13 = nil
  if (string.len)(tostring((l_0_0(this_sigattrlog[48])).utf8p2)) > 3000 then
    return mp.CLEAN
  end
  if l_0_13 and (string.match)((string.lower)(tostring((l_0_0(this_sigattrlog[48])).utf8p2)), "^%s*https?://") then
    return mp.CLEAN
  end
  local l_0_14 = nil
  if l_0_13 then
    do
      if not (string.match)(NormalizeClickFixCommand(tostring((l_0_0(this_sigattrlog[48])).utf8p2)), "^%s*\"([^\"]+)\"") then
        local l_0_15, l_0_16, l_0_18 = tostring((l_0_0(this_sigattrlog[48])).utf8p1)
      end
      do
        local l_0_17 = nil
        local l_0_19 = nil
        do
          local l_0_20 = nil
          if not ({powershell = true, pwsh = true, cmd = true, conhost = true, curl = true, wget = true, mshta = true, msiexec = true, regsvr32 = true, rundll32 = true, bitsadmin = true, certutil = true, wscript = true, cscript = true, ["%comspec%"] = true})[(string.gsub)((string.match)(NormalizeClickFixCommand(tostring((l_0_0(this_sigattrlog[48])).utf8p2)), "^%s*([^%s]+)") and (string.match)((string.match)(NormalizeClickFixCommand(tostring((l_0_0(this_sigattrlog[48])).utf8p2)), "^%s*([^%s]+)"), "[^\\/]+$") or "", "%.exe$", "")] then
            return mp.CLEAN
          end
          local l_0_21 = nil
          -- DECOMPILER ERROR at PC393: Confused about usage of register: R5 in 'UnsetPending'

          if ({["irm pwsh.sh | iex"] = true, ["powershell -ep bypass -c \"irm https://voicestudio.sh/install.ps1|iex\""] = true, ["wget http://fishros.com/install -o fishros && . fishros"] = true, ["wget http://fishros.com/install -o fishros && bash fishros"] = true, ["source <(wget -qo- https://fishros.com/install)"] = true, ["powershell -noprofile -executionpolicy bypass -command \"[net.servicepointmanager]::securityprotocol = [net.securityprotocoltype]::tls12; & ([scriptblock]::create((invoke-restmethod \'https://gigacode.ru/desktop/install.ps1\')))\""] = true})[(string.match)(l_0_20, "^%s*(.-)%s*$")] then
            return mp.CLEAN
          end
          local l_0_22 = nil
          if (function(l_2_0)
  -- function num : 0_1
  if (string.match)(l_2_0, "^%s*\"?certutil") then
    local l_2_1 = contains
    local l_2_2 = l_2_0
    local l_2_3 = {}
    -- DECOMPILER ERROR at PC24: No list found for R3 , SetList fails

  end
  -- DECOMPILER ERROR at PC28: Overwrote pending register: R1 in 'AssignReg'

  if l_2_1 then
    return l_2_1
  end
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  do
    local l_2_4, l_2_5 = "&", "|"
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

    if not l_2_1 or l_2_3 ~= "table" or l_2_3 ~= 4 then
      return l_2_3
    end
    -- DECOMPILER ERROR at PC47: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC50: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC60: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC69: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC70: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC75: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC78: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC81: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC84: Overwrote pending register: R3 in 'AssignReg'

    do return l_2_3 end
    -- WARNING: undefined locals caused missing assignments!
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end
)(l_0_22) then
            return mp.CLEAN
          end
          local l_0_23 = nil
          local l_0_24 = nil
          if contains(l_0_22, {"github.com", "githubusercontent.com", "gitlab.com", "get.activated.win", "christitus.com/win", "windows defender advanced threat protection", "claude.ai"}) then
            return mp.CLEAN
          end
          local l_0_25 = nil
          local l_0_26 = function(l_3_0, l_3_1)
  -- function num : 0_2
  if l_3_0 == nil or l_3_1 == nil then
    return false
  end
  l_3_1 = (string.lower)(tostring(l_3_1))
  l_3_1 = (string.gsub)(l_3_1, "^%.", "")
  l_3_1 = (string.gsub)(l_3_1, "%.$", "")
  if l_3_1 == "" then
    return false
  end
  if l_3_0 == l_3_1 then
    return true
  end
  if l_3_1 == "localhost" or (string.match)(l_3_1, "^%d+%.%d+%.%d+%.%d+$") then
    return false
  end
  do
    local l_3_2 = "." .. l_3_1
    do return (string.len)(l_3_2) < (string.len)(l_3_0) and (string.sub)(l_3_0, -(string.len)(l_3_2)) == l_3_2 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

          if (function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_27, l_0_25
  local l_5_1 = false
  for l_5_5 in (string.gmatch)(l_5_0, "https?://[^%s\"\'<>%)%]%}]+") do
    local l_5_6 = ExtractPartsFromUri(l_5_5)
    if next(l_5_6) ~= nil and l_5_6.host ~= nil then
      l_5_1 = true
      local l_5_7 = (string.lower)(tostring(l_5_6.host))
      l_5_7 = (string.gsub)(l_5_7, "%.$", "")
      local l_5_8 = false
      for l_5_12,l_5_13 in ipairs(l_0_27) do
        if l_0_25(l_5_7, l_5_13) then
          l_5_8 = true
          break
        end
      end
      do
        do
          if not l_5_8 then
            return false
          end
          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return l_5_1
end
)(l_0_22) then
            return mp.CLEAN
          end
          local l_0_29, l_0_30 = , {"localhost", "127.0.0.1", "astral.sh", "packages.wazuh.com", "community.chocolatey.org", "download.bt.cn", "get.scoop.sh", "get.pnpm.io", "cdn.cs50.net", "repo.zabbix.com", "aka.ms", "deno.land", "omp.sh", "ark.cn-beijing.volces.com", "dl.google.com", "www.aapanel.com", "php.new", "docs.higgsfield.ai", "api.higgsfield.ai", "portalapi.balboadigital.com", "repo.anaconda.com", "lmstudio.ai", "dml.bpglobal.com", "download.splunk.com", "docs.microsoft.com", "edu-res.hc-cdn.cn", "qoder.com", "artifacts.elastic.co", "mirrors.aliyun.com", "packages.microsoft.com", "dl.min.io", "meta.fabricmc.net", "ai.snowflake.com", "www.openinterpreter.com", "get.hacs.xyz", "cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud", "ark-project.tos-cn-beijing.volces.com", "atlassian.com", "github.qualcomm.com", "nextjs.org", "eslint.org", "nya.globalslb.net", "tools.mariusheier.com", "physionet.org", "www.w3.org", "static.devin.ai", "serverless.roboflow.com", "login.microsoftonline.com", "graph.microsoft.com", "nginx.org", "artifacts.mastercard.int", "apt.releases.hashicorp.com", "www.python.org", "devcloud.ubs.net", "get.winhance.net", "rmm.datto.com", "nodejs.org", "releases.jfrog.io", "deb.debian.org", "pkg.jenkins.io", "rclone.org", "api.x.ai", "floci.io", "dl.openfoam.org", "cdn.deepseek.com", "int.repositories.cloud.sap", "mise.run", "bootstrap.pypa.io", "developer.download.nvidia.com", "chocolatey.org", "api.stripe.com", "cs50.harvard.edu", "rbcm-gerrit.de.bosch.com", "minio.epic.com", "archive.ubuntu.com", "bun.sh", "api.groq.com", "go.microsoft.com", "review-android.quicinc.com", "code.kimi.ai", "gerrit-gamma.gic.ericsson.se", "claude.ai", "catalog.sf.dl.delivery.mp.microsoft.com", "packages.openvpn.net", "cdn.openlua.cloud", "agent.rabbit.tech", "releases.rive.app", "create.tauri.app", "get.netdata.cloud", "cli.devin.ai", "download.checkmk.com", "jimeng.jianying.com", "dreamina.capcut.com", "seb.cchef.co", "ai-desktop.aig.de101.cgm.ag", "kurzy.kpi.fei.tuke.sk", "download.microsoft.com", "artefacts.lloydsbanking.cloud", "vicarius-installer.s3.amazonaws.com", "storage.yandexcloud.net", "chatgpt.com", "vite.plus", "cli.stripe.com", "openclaw.ai", "debloat.raphi.re", "wwwn.cdc.gov", "install.python-poetry.org", "cli.tigerdata.com", "aider.chat", "hermes-agent.nousresearch.com", "kotl.in", "antigravity.google", "pixi.sh", "api.openai.com", "install.duckdb.org", "api.fish.audio", "goauthentik.io", "maven.neoforged.net", "download.swift.org", "install.pi-hole.net", "download.docker.com", "getcomposer.org"}
          if (mp.CheckUrl)(l_0_21) == 1 and l_0_21 == 1 then
            return mp.CLEAN
          end
          local l_0_31, l_0_32 = {cfd = true, icu = true, lol = true, monster = true, xyz = true}, function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_r12
  for l_4_4 in (string.gmatch)(l_4_0, "https?://[^%s\"\'<>%)%]%}]+") do
    local l_4_5 = ExtractPartsFromUri(l_4_4)
    if next(l_4_5) ~= nil and l_4_5.host ~= nil then
      local l_4_6 = (string.lower)(tostring(l_4_5.host))
      l_4_6 = (string.gsub)(l_4_6, "%.$", "")
      local l_4_7 = (string.match)(l_4_6, "%.([%a][%a%d%-]*)$")
      if l_4_7 ~= nil and l_0_r12[l_4_7] == true then
        return true
      end
    end
  end
  return false
end

          local l_0_33, l_0_34 = nil
          local l_0_35 = nil
          local l_0_36 = (string.gsub)(l_0_14, "%^", "")
          local l_0_37 = nil
          local l_0_38 = (string.gsub)(l_0_14, "%`", "")
          local l_0_39 = nil
          if (contains(l_0_23, {"invoke-expression", "iex(", "iex ", "|iex", "| iex", ";iex", "invoke-webrequest", "iwr ", "invoke-restmethod", "irm ", "downloadstring", "downloadfile", "downloaddata", "net.webclient", "webclient).download", "system.net", "httpclient", "getstringasync", "frombase64string", "-encodedcommand", "-enc ", "-nop", "-noprofile", "-noninteractive", "-w hidden", "-windowstyle hidden", "-windowstyle h", "-executionpolicy bypass", "-ep bypass", "start-bitstransfer", "bitsadmin /transfer", "-urlcache", "certutil -", "certutil.exe", "regsvr32 /i:http", "regsvr32 /s /n /u /i:", "scrobj", "mshta http", "mshta javascript", "mshta vbscript", "rundll32", "curl http", "curl -o", "wget http", "powershell -win mi -e", "gcm ", "finger ", "tar -x", "curl -sk", "wget -", "%comspec%", "msiexec /i http", "msiexec /q ", "&echo copy", "-usebasicparsing", "-wi ", "-w h", "-noexit", " %temp%\\", "cmd /", "%~zf==2", "for /r", "do start", "cmd /c", "pcalua"}) or (function(l_7_0)
  -- function num : 0_6
  if contains(l_7_0, "msiexec") then
    local l_7_1 = contains
    local l_7_2 = l_7_0
    local l_7_3 = {}
    -- DECOMPILER ERROR at PC13: No list found for R3 , SetList fails

  end
  -- DECOMPILER ERROR at PC17: Overwrote pending register: R1 in 'AssignReg'

  if not l_7_1 then
    return l_7_1
  end
  -- DECOMPILER ERROR at PC19: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

  local l_7_4, l_7_5 = "http://", "https://"
  -- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  if not l_7_1 or l_7_3 ~= "table" or l_7_3 < 3 then
    return l_7_3
  end
  -- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  local l_7_6 = "http:\\"
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

  if l_7_3 ~= "msiexec" and l_7_3 ~= "msiexec.exe" then
    return l_7_4
  end
  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

  local l_7_7 = "https:\\"
  -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

  l_7_6 = #l_7_2
  l_7_6 = l_7_6 - 1
  l_7_7 = 1
  for l_7_11 = l_7_5, l_7_6, l_7_7 do
    local l_7_9, l_7_10, l_7_11 = nil
    l_7_9 = string
    l_7_9 = l_7_9.gsub
    l_7_10 = l_7_2[l_7_8]
    l_7_11 = "^%-"
    l_7_9 = l_7_9(l_7_10, l_7_11, "/")
    local l_7_12 = nil
    if l_7_9 == "/i" or l_7_9 == "/package" or l_7_9 == l_7_4 then
      l_7_10 = l_7_8 + 1
      l_7_10 = l_7_2[l_7_10]
      local l_7_13 = nil
      l_7_11 = string
      l_7_11 = l_7_11.match
      l_7_12 = l_7_10
      l_7_13 = "^https?://[^/\\%s?#]"
      l_7_11 = l_7_11(l_7_12, l_7_13)
      if l_7_11 == nil then
        do
          l_7_11 = string
          l_7_11 = l_7_11.match
          l_7_12 = l_7_10
          l_7_13 = "^https?:\\+[^/\\%s?#]"
          l_7_11 = l_7_11(l_7_12, l_7_13)
          l_7_11 = l_7_11 ~= nil
          do return l_7_11 end
          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC86: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC89: Confused about usage of register R7 for local variables in 'ReleaseLocals'

  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end
)(l_0_23) or l_0_13) and not (function(l_6_0)
  -- function num : 0_5
  for l_6_4,l_6_5 in ipairs({"curl", "wget", "mshta"}) do
    for l_6_9,l_6_10 in ipairs({l_6_5, l_6_5 .. "%.exe"}) do
      local l_6_11 = "%f[%w_]" .. l_6_10 .. "[\"\']?%s+([^;&|\r\n]+)"
      for l_6_15 in (string.gmatch)(l_6_0, l_6_11) do
        if l_6_5 == "mshta" then
          if not (string.match)(l_6_15, "https?://[^/\\%s?#]") ~= nil then
            local l_6_19 = nil
            local l_6_20 = contains
            local l_6_21 = l_6_15
            l_6_20 = l_6_20(l_6_21, {"javascript:", "vbscript:"})
          end
          if l_6_20 then
            l_6_20 = true
            return l_6_20
          end
        elseif l_6_19 then
          l_6_20 = " "
          l_6_21 = l_6_15
          l_6_20 = l_6_20 .. l_6_21
          local l_6_24 = nil
          if l_6_5 ~= "wget" then
            l_6_21 = string
            l_6_21 = l_6_21.find
            l_6_24 = l_6_20
            l_6_21 = l_6_21(l_6_24, "%s%-%-output[=%s]")
            if not l_6_21 then
              l_6_21 = string
              l_6_21 = l_6_21.find
              l_6_24 = l_6_20
              l_6_21 = l_6_21(l_6_24, "%s%-[fiklsv]*o[%s=]")
            end
          end
          if l_6_21 then
            l_6_21 = true
            return l_6_21
          end
        end
      end
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC83: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  -- DECOMPILER ERROR: 7 unprocessed JMP targets
end
)(l_0_23) then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC700: Confused about usage of register: R18 in 'UnsetPending'

          -- DECOMPILER ERROR at PC703: Confused about usage of register: R20 in 'UnsetPending'

          if not (function(l_6_0)
  -- function num : 0_5
  for l_6_4,l_6_5 in ipairs({"curl", "wget", "mshta"}) do
    for l_6_9,l_6_10 in ipairs({l_6_5, l_6_5 .. "%.exe"}) do
      local l_6_11 = "%f[%w_]" .. l_6_10 .. "[\"\']?%s+([^;&|\r\n]+)"
      for l_6_15 in (string.gmatch)(l_6_0, l_6_11) do
        if l_6_5 == "mshta" then
          if not (string.match)(l_6_15, "https?://[^/\\%s?#]") ~= nil then
            local l_6_19 = nil
            local l_6_20 = contains
            local l_6_21 = l_6_15
            l_6_20 = l_6_20(l_6_21, {"javascript:", "vbscript:"})
          end
          if l_6_20 then
            l_6_20 = true
            return l_6_20
          end
        elseif l_6_19 then
          l_6_20 = " "
          l_6_21 = l_6_15
          l_6_20 = l_6_20 .. l_6_21
          local l_6_24 = nil
          if l_6_5 ~= "wget" then
            l_6_21 = string
            l_6_21 = l_6_21.find
            l_6_24 = l_6_20
            l_6_21 = l_6_21(l_6_24, "%s%-%-output[=%s]")
            if not l_6_21 then
              l_6_21 = string
              l_6_21 = l_6_21.find
              l_6_24 = l_6_20
              l_6_21 = l_6_21(l_6_24, "%s%-[fiklsv]*o[%s=]")
            end
          end
          if l_6_21 then
            l_6_21 = true
            return l_6_21
          end
        end
      end
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC83: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  -- DECOMPILER ERROR: 7 unprocessed JMP targets
end
)(l_0_23) and 3 > l_0_37 and 3 > l_0_39 and not contains(l_0_23, {"--headless", "/v:on", "%comspec%", "@ssl\\", "vbscript:", "wscript.shell"}) then
            return mp.CLEAN
          end
          local l_0_44 = nil
          local l_0_45 = nil
          if (next(ExtractPartsFromUri(l_0_21))) == nil then
            return mp.CLEAN
          end
          if (ExtractPartsFromUri(l_0_21)).host == nil then
            return mp.CLEAN
          end
          local l_0_46 = nil
          for l_0_50,l_0_51 in ipairs({"chatgpt.com", "openai.com", "claude.ai", "claude.com", "anthropic.com", "grok.com", "deepseek.com", "google.com", "antigravity.google", "qwen.ai", "chat.z.ai", "kimi.com", "doubao.com", "perplexity.ai", "huggingface.co", "openrouter.ai", "mistral.ai", "arena.ai", "meta.ai", "nousresearch.com", "opencode.ai", "openclaw.ai", "kiro.dev", "lovable.dev", "cursor.com", "manus.im", "unsloth.ai", "venice.ai", "notion.com", "notion.so", "microsoft.com", "visualstudio.com", "azure.com", "azure.net", "azurewebsites.net", "windows.net", "office.com", "office.net", "office365.com", "sharepoint.com", "sharepoint-df.com", "cloud.microsoft", "dynamics.com", "powerbi.com", "powerautomate.com", "microsofticm.com", "microsoftgeneva.com", "microsoftonline.com", "bing.com", "live.com", "msn.com", "skype.com", "eng.ms", "jwt.ms", "owiki.ms", "osgwiki.com", "microsoft.ghe.com", "githubusercontent.com", "youtube.com", "googleusercontent.com", "withgoogle.com", "aws.amazon.com", "amazon.com", "amazonworkspaces.com", "workshops.aws", "github.com", "gitlab.com", "stackoverflow.com", "npmjs.com", "pypi.org", "python.org", "nodejs.org", "docker.com", "kubernetes.io", "jetbrains.com", "astral.sh", "brew.sh", "bun.sh", "bun.com", "ollama.com", "pi.dev", "figma.com", "overleaf.com", "supabase.com", "devolutions.net", "rust-lang.org", "virustotal.com", "digitalocean.com", "medium.com", "csdn.net", "zhihu.com", "cnblogs.com", "qiita.com", "anaconda.com", "hashicorp.com", "linuxmint.com", "askubuntu.com", "tryhackme.com", "vocareum.com", "ohmyposh.dev", "skills.google", "tailscale.com", "cloudflare.com", "salesforce.com", "lightning.force.com", "service-now.com", "atlassian.net", "adobe.com", "sap.com", "oracle.com", "ibm.com", "dropbox.com", "nvidia.com", "databricks.com", "azuredatabricks.net", "clerk.com", "pureauth.io", "canva.com", "kaggle.com", ".db.de", "deutschebahn.com", "tatacapital.com", "bajajfinserv.in", "xiaomi.com", "tencent.com", "whatsapp.com", "facebook.com", "instagram.com", "linkedin.com", "reddit.com", "discord.com", "telegram.org", "slack.com", "bilibili.com", "baidu.com", "walmart.com", "yahoo.com", "apple.com", "icloud.com", "duckduckgo.com", "perchance.org", "localhost", "127.0.0.1", "www.runoob.com", "www.jenkins.io", "www.filestash.app", "get.activated.win", "ublockdns.com", "localhost:", "api.justwoker.icu", "docs.immich.app", "herdr.dev", "massgrave.dev", "paste.jmend.cc", "seekai.cc", "gapgpt.app", "gorouter.app", "v0.app", "apinex.bond", "timeweb.cloud", "di.internal.bosch.cloud", "tinyinstaller.top", "paimon.moe", "lovable.app", "pnpm.io", "xstarry.dev", "lua.tools", "christitus.com", "x.ai", "omp.sh", "chocolatey.org", "scoop.sh", "llama.app", "wuwatracker.com", "massgrave-dev.translate.goog", "starrailstation.com", "teamworkgraph.com", "docs.digital.bpglobal.com", "tools.mariusheier.com", "portal.balboadigital.com", "www.kimi.ai", "docs.deno.com", "docs.manim.community", "www.qianwen.com", "www.haskell.org", "app.snowflake.com", "stardb.gg", "packages.trilogycare.com.au", "app.factory.ai", "noggin.epic.com", "fly.io", "modelcontextprotocol.io", "floci.io", "spicetify.app", "cs50.harvard.edu", "www.zabbix.com", "zzz.rng.moe", "lumo.proton.me", "app.clockify.me", "se-bot.mx.siemens-energy.cloud", "app.testcontainers.cloud", "vercel.com", "app.dataannotation.tech", "orchard.iamneo.in", "www.aapanel.com", "www.bt.cn", "academy.hackthebox.com", "labs.cognitiveclass.ai", "edu.huaweicloud.com", "console.volcengine.com", "laravel.com", "labclient.labondemand.com", "copilot.com", "www.coursera.org", "lmstudio.ai", "portal.offsec.com", "www.splunk.com", "qoder.com", "devcloud.ubs.net", "learn.kodekloud.com", "secure.weda.fr", "exam.nowcoder.com", "ai-docs.portal.hyperspace.tools.sap", "collab.nse.co.in", "superuser.com", "hpanel.hostinger.com", "winhance.net", "rmm.datto.com", "crowdstrike.com", "vnc.htb-cloud.com", "deno.com", "physionet.org", "app.glean.com", "docs.devin.ai", "open.higgsfield.ai", "qgenie-docs.qualcomm.com", "atlassian.com", "fabricmc.net", "universe.roboflow.com", "grafana.com", "schneegans.de", "www.natfrp.com", "ckey.run", "www.postman.com", "character.ai", "janitorai.com", "duck.ai", "jimeng.jianying.com", "dreamina.capcut.com", "www.mcp-for-blender.com", "moonrepo.dev", "checkmk.com", "www.codechef.com", "guide.openlua.cloud", "os3.rabbit.tech", "app.devin.ai", "rive.app", "v2.tauri.app", "app.netdata.cloud", "openvpn.net", "qgenie-chat.qualcomm.com", "aihub.qualcomm.com", "wiki.one.int.sap", "iitg.ac.in", "kurzy.kpi.fei.tuke.sk", "ai-desktop.aig.de101.cgm.ag", "cortex.lloydsbanking.cloud", "cloudbrothers.info", "delinea.app", "elastic.cloud", "yandex.cloud", "veeam.com", "bernard.swisscom.com", "setup.claude.de101.cgm.ag", "openwebui.int.lucanet.cloud", "ai-platform-frontend.dev.cdp-int.defra.cloud", "docs.stripe.com", "python-poetry.org", "aider.chat", "kotlinlang.org", "pixi.prefix.dev", "viteplus.dev", "duckdb.org", "fish.audio", "docs.goauthentik.io", "docs.neoforged.net", "starship.rs", "www.swift.org", "docs.pi-hole.net"}) do
            local l_0_47, l_0_48, l_0_49, l_0_50, l_0_51 = nil
            -- DECOMPILER ERROR at PC1050: Confused about usage of register: R34 in 'UnsetPending'

            if l_0_26((string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_21)).host)), "%.$", ""), "rive.app") then
              return mp.CLEAN
            end
          end
          local l_0_52 = nil
          local l_0_53 = nil
          -- DECOMPILER ERROR at PC1066: Confused about usage of register: R29 in 'UnsetPending'

          do
            local l_0_54 = nil
            if (((string.match)((string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_21)).host)), "%.$", ""), "%.([%a][%a%d%-]*)$")) ~= nil and isSuspTLD(((string.match)((string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_21)).host)), "%.$", ""), "%.([%a][%a%d%-]*)$")))) or l_0_32(l_0_22) then
              local l_0_55 = nil
              local l_0_56 = nil
              local l_0_57 = nil
              AppendToRollingQueue("IsClickFixCMD_Malicious", (string.lower)(l_0_14), l_0_21 or "1", 600, 200, 1)
            end
            if l_0_21 ~= nil then
              local l_0_59 = nil
              local l_0_60 = nil
              local l_0_61 = nil
              if ((SafeGetUrlReputation({l_0_21}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(true)}, false, 3000)).urls)[l_0_21] and (((SafeGetUrlReputation({l_0_21}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(true)}, false, 3000)).urls)[l_0_21]).determination == 2 and 60 <= (((SafeGetUrlReputation({l_0_21}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(true)}, false, 3000)).urls)[l_0_21]).confidence then
                AppendToRollingQueue("IsClickFixCMD_ConfirmedMalicious", (string.lower)(l_0_14), l_0_21, 600, 200, 1)
                ;
                (bm.trigger_sig)("ETW_ClipWrite", (string.format)("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_21), tostring(l_0_14), tostring((((SafeGetUrlReputation({l_0_21}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(true)}, false, 3000)).urls)[l_0_21]).determination)))
              end
            end
            -- DECOMPILER ERROR at PC1172: Confused about usage of register: R30 in 'UnsetPending'

            if not true then
              local l_0_62 = nil
              local l_0_63 = nil
              local l_0_64 = nil
              AppendToRollingQueue("IsClickFixCMD", (string.lower)(l_0_14), l_0_21 or "1", 600, 200, 1)
            end
            ;
            (bm.add_related_string)("ETW_ClipWrite_CMD", tostring(l_0_14), bm.RelatedStringBMReport)
            -- DECOMPILER ERROR at PC1200: Confused about usage of register: R30 in 'UnsetPending'

            ;
            (bm.add_related_string)("ETW_ClipWrite_isSuspTld", tostring(true), bm.RelatedStringBMReport)
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC1210: freeLocal<0 in 'ReleaseLocals'

            -- DECOMPILER ERROR: 27 unprocessed JMP targets
          end
        end
      end
    end
  end
end

