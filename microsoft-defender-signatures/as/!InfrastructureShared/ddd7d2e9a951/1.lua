-- Threat: !InfrastructureShared
-- Name: ddd7d2e9a951
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.GetScannedPPID()
if type(r0_0) == "string" and r0_0 ~= "" then
  local r0_1 = mp.GetProcessCommandLine(r0_0)
  if type(r0_1) == "string" and r0_1 ~= "" then
    local function r0_2(p1_0)
      if type(p1_0) == "string" then
        local r1_0 = string.gsub(string.lower(p1_0), "\\", "/")
        local r1_1 = string.match(r1_0, "([^/]+)$")
        if r1_1 == nil then
          return nil
        end
        local r1_2 = string.gsub(r1_1, "%.exe$", "")
        return r1_2
      end
      return nil
    end

    local r0_3 = string.match(r0_1, '^%s*"([^"]+)"')
      or string.match(r0_1, "^%s*'([^']+)'")
      or string.match(r0_1, "^%s*([^%s]+)")
    local r0_4 = r0_2(r0_3)
    if r0_4 == nil then
      return mp.CLEAN
    end
    local r0_5 = {
      sh = true, bash = true, dash = true, ash = true, ksh = true, ksh93 = true, csh = true,
      tcsh = true, fish = true, zsh = true, cmd = true, powershell = true, pwsh = true
    }
    local r0_6 = {
      curl = true, wget = true, nc = true, ncat = true, netcat = true, ["nc.openbsd"] = true,
      ["nc.traditional"] = true, certutil = true, echo = true, whoami = true, id = true,
      uname = true, ipconfig = true, mkfifo = true
    }
    local r0_7 = string.match(r0_4, "^pythonw?[%d%.]*$")
    local r0_8 = r0_7 or string.match(r0_4, "^perl[%d%.]*$")
    local r0_9 = string.match(r0_4, "^php[%d%.]*$")
      and string.match(string.lower(r0_1), "fsockopen%s*%(")
    if not r0_5[r0_4] and not r0_6[r0_4] and not r0_8 and not r0_9 then
      return mp.CLEAN
    end
    if not r0_6[r0_4] then
      local r0_10 = string.lower(r0_1)

      local function r0_11(p2_0)
        return MpCommon.StringRegExpSearch(p2_0, r0_10)
      end

      if r0_8 or r0_9 then
        local r0_12 = r0_7 and "(?:^|\\s)-[a-z]*c(?:\\s|[\"'])"
          or r0_9 and "(?:^|\\s)-r(?:\\s|[\"'])"
          or "(?:^|\\s)-[a-z]*e(?:\\s|[\"'])"
        if not r0_11(r0_12) then
          return mp.CLEAN
        end
      end
      local r0_13 = "\\b(?:proc_open|popen|shell_exec|passthru|system|exec|execve|spawn|run|call)\\s*\\("
      local r0_14 = string.find(r0_10, "rawurldecode", 1, true)
        and string.find(r0_10, "file_put_contents", 1, true)
        and string.find(r0_10, "include", 1, true)
        and string.find(r0_10, "finally", 1, true)
        and string.find(r0_10, "unlink", 1, true)
        or string.find(r0_10, "/dev/tcp/", 1, true) and r0_11("[<>]\\s*&?\\s*[\"']?/dev/tcp/")
        or string.find(r0_10, "mkfifo", 1, true)
          and r0_11("\\b(?:nc|ncat|netcat)\\b")
          and string.find(r0_10, "|", 1, true)
          and r0_11("/bin/(?:sh|bash|dash|ash|zsh|ksh)\\b")
        or r0_11("\\b(?:nc|ncat|netcat)\\b")
          and r0_11("(?:^|\\s)(?:-[ec]|--(?:sh-)?exec)(?:\\s+|=)[\"']?(?:[^\\s\"']*[/\\\\])?(?:sh|bash|dash|ash|zsh|ksh|cmd|powershell|pwsh)(?:\\.exe)?(?:\\s|[\"']|$)")
        or string.find(r0_10, "fsockopen", 1, true)
          and r0_11("\\bfsockopen\\s*\\(")
          and r0_11(r0_13)
        or string.find(r0_10, "tcpclient", 1, true)
          and string.find(r0_10, "getstream", 1, true)
          and r0_11("\\b(?:iex|invoke-expression)\\b")
        or string.find(r0_10, "socket", 1, true)
          and r0_11("\\bconnect\\s*\\(")
          and r0_11(r0_13)
          and (r0_11("\\bdup2\\s*\\(") or r0_11("\\bstdin\\b") and r0_11("\\bstdout\\b"))
        or r0_11("\\b(?:curl|wget)(?:\\.exe)?\\b")
          and r0_11("\\|\\s*[\"']?(?:[^\\s\"']*/)?(?:sh|bash|dash|ash|zsh|ksh)(?:\\s|[\"']|$)")
        or r0_11("\\b(?:downloadstring|invoke-webrequest|iwr|irm)\\b")
          and r0_11("\\b(?:iex|invoke-expression)\\b")
      if not r0_14 then
        return mp.CLEAN
      end
    end
    local r0_15 = mp.GetParentProcInfo()
    local r0_16 = {}
    for r0_17 = 1, 4 do
      if type(r0_15) ~= "table" then
        return mp.CLEAN
      end
      local r0_18 = r0_2(r0_15.image_path)
      if r0_18 == nil then
        return mp.CLEAN
      end
      if r0_18 == "httpd"
        or r0_18 == "apache"
        or r0_18 == "apache2"
        or r0_18 == "litespeed"
        or string.match(r0_18, "^php%-fpm[%d%.%-]*$")
        or string.match(r0_18, "^php%-cgi[%d%.%-]*$")
        or string.match(r0_18, "^lsphp[%d%.]*$") then
        return mp.INFECTED
      end
      if r0_17 == 4
        or not r0_5[r0_18]
        or type(r0_15.ppid) ~= "string"
        or r0_15.ppid == ""
        or r0_16[r0_15.ppid] then
        return mp.CLEAN
      end
      r0_16[r0_15.ppid] = true
      r0_15 = mp.GetParentProcInfo(r0_15.ppid)
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
