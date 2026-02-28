local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "((%d+)%.(%d+)%.(%d+)%.(%d+).+)"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L3_1 = {}
    L4_1 = "ftp"
    L5_1 = "ftps"
    L6_1 = "http-get"
    L7_1 = "http-post"
    L8_1 = "http-get-form"
    L9_1 = "http-post-form"
    L10_1 = "https-get-form"
    L11_1 = "https-post-form"
    L12_1 = "https-get"
    L13_1 = "https-head"
    L14_1 = "imap"
    L15_1 = "ldap2"
    L16_1 = "ldap3"
    L17_1 = "mssql"
    L18_1 = "mysql"
    L19_1 = "postgres"
    L20_1 = "pcanywhere"
    L21_1 = "pop3"
    L22_1 = "redis"
    L23_1 = "rexec"
    L24_1 = "rlogin"
    L25_1 = "rsh"
    L26_1 = "smb"
    L27_1 = "smb2"
    L28_1 = "socks5"
    L29_1 = "ssh"
    L30_1 = "sshkey"
    L31_1 = "telnet"
    L32_1 = "vnc"
    L33_1 = "snmp"
    L34_1 = "smtp"
    L35_1 = "smtp-enum"
    L36_1 = "irc"
    L37_1 = "rdp"
    L38_1 = "radmin"
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L3_1[4] = L7_1
    L3_1[5] = L8_1
    L3_1[6] = L9_1
    L3_1[7] = L10_1
    L3_1[8] = L11_1
    L3_1[9] = L12_1
    L3_1[10] = L13_1
    L3_1[11] = L14_1
    L3_1[12] = L15_1
    L3_1[13] = L16_1
    L3_1[14] = L17_1
    L3_1[15] = L18_1
    L3_1[16] = L19_1
    L3_1[17] = L20_1
    L3_1[18] = L21_1
    L3_1[19] = L22_1
    L3_1[20] = L23_1
    L3_1[21] = L24_1
    L3_1[22] = L25_1
    L3_1[23] = L26_1
    L3_1[24] = L27_1
    L3_1[25] = L28_1
    L3_1[26] = L29_1
    L3_1[27] = L30_1
    L3_1[28] = L31_1
    L3_1[29] = L32_1
    L3_1[30] = L33_1
    L3_1[31] = L34_1
    L3_1[32] = L35_1
    L3_1[33] = L36_1
    L3_1[34] = L37_1
    L3_1[35] = L38_1
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L2_1
      L11_1 = L8_1
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
