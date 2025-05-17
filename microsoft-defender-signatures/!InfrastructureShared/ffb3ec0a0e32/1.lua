-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb3ec0a0e32\1.luac 

-- params : ...
-- function num : 0
local l_0_4 = nil
if (bm.get_imagepath)() == nil then
  return mp.CLEAN
end
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_4 = (this_sigattrlog[1]).utf8p2
  local l_0_0 = nil
else
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      l_0_4 = (this_sigattrlog[2]).utf8p2
    else
      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
        l_0_4 = (this_sigattrlog[3]).utf8p2
        local l_0_1 = nil
      else
        do
          if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
            l_0_4 = (this_sigattrlog[4]).utf8p2
          else
            if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
              l_0_4 = (this_sigattrlog[5]).utf8p2
              local l_0_2, l_0_3 = nil
            else
              do
                if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
                  l_0_4 = (this_sigattrlog[6]).utf8p2
                end
                ;
                (bm.DisableSignature)()
                if l_0_4 == nil then
                  return mp.CLEAN
                end
                l_0_4 = (string.lower)(l_0_4)
                local l_0_5 = nil
                if contains(l_0_4, {"08f1b3ac-3ee3-4346-8c37-bd72a6093855", "servicedesk.atera.com", "support.csolve.net", "lt.tech-keys.com", "myusername_$env:username", "ndc support portal", "function run-server()", "metadata/instance?api", "/latest/meta-data/instance-id", "everismartclient"}) then
                  return mp.CLEAN
                end
                local l_0_6 = nil
                local l_0_7 = {"System.DirectoryServices.ActiveDirectory.Domain", "hidden -encodedcommand", "export-registry", "compress-archive", "wget -uri", "curl -uri", "curl -sko", "ipconfig /all", "& start /b", "start msiexec /q /i", "whoami", "net user", "net group", "localgroup administrators", "dsquery", "samaccountname=", "query session", "adscredentials", "o365accountconfiguration", "-dumpmode", "-ssh", "usoprivate", "usoshared", "invoke-expression", "downloadstring", "downloadfile", "frombase64string", "system.io.compression", "system.io.memorystream", "iex ", "iex(", "invoke-webrequest", "iwr -uri", "set-mppreference", "add-mppreference", "certutil", "bitsadmin", "mshta", " -ssh ", "putty.exe", "ftp.exe", "e:jscript", "e:vbscript", "start msiexec /q /i", "nslookup"}
                local l_0_8 = {"-command.*curl", "localgroup Administrators.*/add", "reg add.*disableantispyware.*\\microsoft\\windows defender\\", "reg add.*DisableRestrictedAdmin.*CurrentControlSet\\Control\\Lsa"}
                local l_0_9 = contains
                local l_0_10 = l_0_5
                l_0_9 = l_0_9(l_0_10, {"powershell.exe", "pwsh.exe", "cmd.exe"})
                if l_0_9 then
                  l_0_9 = contains
                  l_0_10 = l_0_4
                  l_0_9 = l_0_9(l_0_10, l_0_7)
                  if l_0_9 then
                    l_0_9 = mp
                    l_0_9 = l_0_9.INFECTED
                    return l_0_9
                  end
                  l_0_9 = contains
                  l_0_10 = l_0_4
                  l_0_9 = l_0_9(l_0_10, l_0_8, false)
                  if l_0_9 then
                    l_0_9 = mp
                    l_0_9 = l_0_9.INFECTED
                    return l_0_9
                  end
                  l_0_9 = contains
                  l_0_10 = l_0_4
                  l_0_9 = l_0_9(l_0_10, "nltest")
                  if l_0_9 then
                    l_0_9 = contains
                    l_0_10 = l_0_4
                    l_0_9 = l_0_9(l_0_10, {"domain_trusts", "dclist", "all_trusts"})
                    if l_0_9 then
                      l_0_9 = mp
                      l_0_9 = l_0_9.INFECTED
                      return l_0_9
                    end
                  end
                  l_0_9 = contains
                  l_0_10 = l_0_4
                  l_0_9 = l_0_9(l_0_10, "lsass")
                  if l_0_9 then
                    l_0_9 = contains
                    l_0_10 = l_0_4
                    l_0_9 = l_0_9(l_0_10, {"procdump", "tasklist", "findstr"})
                    if l_0_9 then
                      l_0_9 = mp
                      l_0_9 = l_0_9.INFECTED
                      return l_0_9
                    end
                  end
                end
                l_0_9 = contains
                l_0_10 = l_0_5
                l_0_9 = l_0_9(l_0_10, {"mshta.exe", "wget.exe", "curl.exe"})
                if l_0_9 then
                  l_0_9 = contains
                  l_0_10 = l_0_4
                  l_0_9 = l_0_9(l_0_10, "http")
                  if l_0_9 then
                    l_0_9 = mp
                    l_0_9 = l_0_9.INFECTED
                    return l_0_9
                  end
                end
                l_0_9 = mp
                l_0_9 = l_0_9.CLEAN
                return l_0_9
              end
            end
          end
        end
      end
    end
  end
end

