-- Threat: \xd0!Wwwrootkit.AM
-- Type: 13
-- Includes: BMLuaLib, ResearchData

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = versioning.GetOrgID()
if isnull(r0_0) then
  return mp.CLEAN
end
local r0_1 = {
  ["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true, ["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true,
  ["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true, ["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
}
if r0_1[string.lower(r0_0)] then
  local r0_2 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
  if not isnull(r0_2)
    and r0_2 ~= "%ExchangeInstallPath%"
    and sysio.IsFileExists(r0_2 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
    return mp.CLEAN
  end
  local r0_3, r0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_FILENAME)
  if r0_3 and not isnull(r0_4) then
    local r0_5 = string.match(r0_4, "(%.[^%.]+)$")
    if isnull(r0_5) then
      return mp.CLEAN
    end
    r0_5 = string.lower(r0_5)
    local r0_6 = {
      [".asp"] = true, [".aspx"] = true, [".ashx"] = true, [".asmx"] = true, [".ascx"] = true,
      [".asax"] = true, [".cshtml"] = true, [".vbhtml"] = true
    }
    if r0_6[r0_5] then
      local r0_7 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL,
            mp.FILEPATH_QUERY_LOWERCASE)))
      if isnull(r0_7) then
        return mp.CLEAN
      end
      do
        local r0_8 = string.lower(r0_7)
        r0_7 = r0_8
        r0_8 = false
        local r0_9 = MpCommon.ExpandEnvironmentVariables("%SystemDrive%\\inetpub\\wwwroot")
        local r0_10 = not (isnull(r0_9) or not string.find(r0_7, string.lower(r0_9), 1, true))
          or r0_8
        local r0_11
        if r0_10 then
          r0_11 = r0_10
        else
          local r0_12 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
          if isnull(r0_12) then
            return mp.CLEAN
          end
          local r0_13 = MpCommon.GetIisInstallPaths(r0_12)
          if isnull(r0_13) then
            return mp.CLEAN
          end
          local r0_14, r0_15, r0_16 = ipairs(r0_13)
          r0_11 = r0_10
          for r0_17, r0_18 in r0_14, r0_15, r0_16 do
            if not isnull(r0_18.Path) and string.find(r0_7, string.lower(r0_18.Path), 1, true) then
              r0_11 = true
              break
            end
          end
        end
        if r0_11 then
          local r0_19 = mp.getfilesize()
          if not isnull(r0_19) and not (r0_19 < 20) then
            local r0_20 = r0_19 > 524288 and 524288 or r0_19
            mp.readprotection(false)
            local r0_21 = mp.readfile(0, r0_20)
            mp.readprotection(true)
            if isnull(r0_21) then
              return mp.CLEAN
            end
            local r0_22 = string.lower(tostring(r0_21))

            local function r0_23(p1_0, p1_1)
              for r1_0, r1_1 in ipairs(p1_1) do
                if string.find(p1_0, r1_1, 1, true) then
                  return true
                end
              end
              return false
            end

            local r0_24, r0_25, r0_26, r0_27 = 0, false, false, false
            local r0_28 = {
              "request.form", "request.querystring", "request.item", "request[", "request(",
              "request.cookies", "request.servervariables", "request.headers", "request.params",
              "request.inputstream", "request.binaryread", "request.files", "request.rawurl",
              "request.path", "context.request", "httpcontext.current.request", "server.urldecode"
            }
            if r0_23(r0_22, r0_28) then
              r0_25 = true
              r0_24 = r0_24 + 2
            end
            local r0_29 = {
              "process.start", "processstartinfo", "system.diagnostics.process",
              "diagnostics.process", "wscript.shell", "wshshell", "shell.application",
              "shellexecute", "win32_process", "redirectstandardoutput", "useshellexecute",
              "standardoutput.readtoend", "cmd.exe /c", "cmd.exe ", "command.com", "cmd /c",
              "%comspec%", "comspec", "powershell", "pwsh.exe", "/bin/sh", "/bin/bash", "bash -c"
            }
            if r0_23(r0_22, r0_29) then
              r0_26 = true
              r0_24 = r0_24 + 5
            end
            local r0_30 = {
              "executeglobal", "executestatement", "assembly.load", "reflection.assembly",
              "appdomain.currentdomain.load", "csharpcodeprovider", "vbcodeprovider",
              "codedomprovider", "compileassemblyfrom", "icodecompiler", "microsoft.jscript",
              "jscript.eval", "scriptcontrol"
            }
            if r0_23(r0_22, r0_30) then
              r0_27 = true
              r0_24 = r0_24 + 5
            end
            local r0_31 = {
              "eval(request", "eval (request", "execute(request", "execute request",
              "executeglobal request", "executeglobal(request", "executestatement request",
              "response.write(eval", "eval(page.request"
            }
            local r0_32 = r0_23(r0_22, r0_31)
            local r0_33 = {
              "activator.createinstance", "invokemember", "methodinfo", ".invoke(", "getmethod(",
              "bindingflags", "marshal.getdelegateforfunctionpointer", "loadlibrary", "virtualalloc",
              "createthread", "writeprocessmemory", "rtlmovememory"
            }
            local r0_34 = r0_23(r0_22, r0_33)
            if r0_34 then
              r0_24 = r0_24 + 2
            end
            r0_34 = string
            r0_34 = r0_34.find
            r0_34 = r0_34(r0_22, "eval(", 1, true)
            if r0_34 or string.find(r0_22, "new function(", 1, true) then
              r0_24 = r0_24 + 1
            end
            r0_34 = {
              "frombase64string", "convert.frombase64", "tobase64string", "encoding.utf8.getstring",
              "encoding.ascii.getstring", "encoding.unicode.getstring", "gzipstream",
              "deflatestream", "cryptostream", "rijndaelmanaged", "aesmanaged",
              "tripledescryptoserviceprovider", "vbscript.encode", "jscript.encode", "#@~^"
            }
            local r0_35 = r0_23
            r0_35 = r0_35(r0_22, r0_34)
            if r0_35 then
              r0_24 = r0_24 + 2
            end
            r0_35 = {
              "webclient", "downloadstring", "downloadfile", "downloaddata", "uploadfile",
              "httpwebrequest", "webrequest.create", "tcpclient", "net.sockets",
              "msxml2.serverxmlhttp", "serverxmlhttp", "winhttp.winhttprequest", "xmlhttp"
            }
            local r0_36 = r0_23(r0_22, r0_35)
            if r0_36 then
              r0_24 = r0_24 + 2
            end
            r0_36 = {
              "scripting.filesystemobject", "filesystemobject", "file.writeallbytes",
              "file.writealltext", "file.readallbytes", "streamwriter", "binarywrite", "postedfile",
              "saveas(", "httppostedfile"
            }
            local r0_37 = r0_23(r0_22, r0_36)
            if r0_37 then
              r0_24 = r0_24 + 2
            end
            r0_37 = {
              "response.write", "response.binarywrite", "response.clear", "response.addheader"
            }
            local r0_38 = r0_23(r0_22, r0_37)
            if r0_38 then
              r0_24 = r0_24 + 1
            end
            r0_38 = {
              "china chopper", "caidao", "antsword", "behinder", "godzilla", "aspxspy", "iisspy",
              "wso_version", "wso shell", "b374k", "c99shell", "r57shell", "regeorg", "georg says",
              "regeorgtunnel", "tunna", "weevely", "p0wny", "altman", "k8cscan", "jspspy",
              "awen asp.net webshell", "cmdasp", "labshell", "twebshell", "antichat", "kacak"
            }
            local r0_39 = r0_23(r0_22, r0_38)
            local r0_40 = {
              "redirectstandardoutput", "standardoutput.readtoend", "stdout.readall", ".stdout",
              "redirectstandarderror", "standarderror.readtoend"
            }
            local r0_41 = r0_23(r0_22, r0_40)
            if r0_39 then
              set_research_data("webshell_path", r0_7, false)
              set_research_data("webshell_reason", "family_fingerprint", false)
              set_research_data("webshell_score", tostring(r0_24), false)
              return mp.INFECTED
            end
            if r0_32 then
              set_research_data("webshell_path", r0_7, false)
              set_research_data("webshell_reason", "eval_of_request", false)
              set_research_data("webshell_score", tostring(r0_24), false)
              return mp.INFECTED
            end
            if r0_25 and r0_27 then
              set_research_data("webshell_path", r0_7, false)
              set_research_data("webshell_reason", "input_to_dyncode", false)
              set_research_data("webshell_score", tostring(r0_24), false)
              return mp.INFECTED
            end
            if r0_25 and r0_26 and r0_41 then
              set_research_data("webshell_path", r0_7, false)
              set_research_data("webshell_reason", "command_shell_with_output", false)
              set_research_data("webshell_score", tostring(r0_24), false)
              return mp.INFECTED
            end
            if r0_25 and r0_26 and r0_24 >= 9 then
              set_research_data("webshell_path", r0_7, false)
              set_research_data("webshell_reason", "input_to_cmdexec", false)
              set_research_data("webshell_score", tostring(r0_24), false)
              return mp.INFECTED
            end
            return mp.CLEAN
          end
          return mp.CLEAN
        end
        return mp.CLEAN
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
