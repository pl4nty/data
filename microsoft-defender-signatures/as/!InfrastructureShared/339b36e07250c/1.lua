-- Threat: !InfrastructureShared
-- Name: 339b36e07250c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  local l_0_2 = string.match(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+).+)")
  if l_0_2 then
    local l_0_3 = {
      "ftp",
      "ftps",
      "http-get",
      "http-post",
      "http-get-form",
      "http-post-form",
      "https-get-form",
      "https-post-form",
      "https-get",
      "https-head",
      "imap",
      "ldap2",
      "ldap3",
      "mssql",
      "mysql",
      "postgres",
      "pcanywhere",
      "pop3",
      "redis",
      "rexec",
      "rlogin",
      "rsh",
      "smb",
      "smb2",
      "socks5",
      "ssh",
      "sshkey",
      "telnet",
      "vnc",
      "snmp",
      "smtp",
      "smtp-enum",
      "irc",
      "rdp",
      "radmin"
    }
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if string.find(l_0_2, l_0_5, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
