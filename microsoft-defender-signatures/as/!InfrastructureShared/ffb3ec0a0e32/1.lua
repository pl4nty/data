local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L0_1 = L2_1.utf8p2
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L0_1 = L2_1.utf8p2
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p2
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L0_1 = L2_1.utf8p2
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[6]
              L0_1 = L2_1.utf8p2
            end
          end
        end
      end
    end
  end
end
L2_1 = bm
L2_1 = L2_1.DisableSignature
L2_1()
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = {}
L3_1 = "08f1b3ac-3ee3-4346-8c37-bd72a6093855"
L4_1 = "servicedesk.atera.com"
L5_1 = "support.csolve.net"
L6_1 = "lt.tech-keys.com"
L7_1 = "myusername_$env:username"
L8_1 = "ndc support portal"
L9_1 = "function run-server()"
L10_1 = "metadata/instance?api"
L11_1 = "/latest/meta-data/instance-id"
L12_1 = "everismartclient"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "System.DirectoryServices.ActiveDirectory.Domain"
L5_1 = "hidden -encodedcommand"
L6_1 = "export-registry"
L7_1 = "compress-archive"
L8_1 = "wget -uri"
L9_1 = "curl -uri"
L10_1 = "curl -sko"
L11_1 = "ipconfig /all"
L12_1 = "& start /b"
L13_1 = "start msiexec /q /i"
L14_1 = "whoami"
L15_1 = "net user"
L16_1 = "net group"
L17_1 = "localgroup administrators"
L18_1 = "dsquery"
L19_1 = "samaccountname="
L20_1 = "query session"
L21_1 = "adscredentials"
L22_1 = "o365accountconfiguration"
L23_1 = "-dumpmode"
L24_1 = "-ssh"
L25_1 = "usoprivate"
L26_1 = "usoshared"
L27_1 = "invoke-expression"
L28_1 = "downloadstring"
L29_1 = "downloadfile"
L30_1 = "frombase64string"
L31_1 = "system.io.compression"
L32_1 = "system.io.memorystream"
L33_1 = "iex "
L34_1 = "iex("
L35_1 = "invoke-webrequest"
L36_1 = "iwr -uri"
L37_1 = "set-mppreference"
L38_1 = "add-mppreference"
L39_1 = "certutil"
L40_1 = "bitsadmin"
L41_1 = "mshta"
L42_1 = " -ssh "
L43_1 = "putty.exe"
L44_1 = "ftp.exe"
L45_1 = "e:jscript"
L46_1 = "e:vbscript"
L47_1 = "start msiexec /q /i"
L48_1 = "nslookup"
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
L3_1[36] = L39_1
L3_1[37] = L40_1
L3_1[38] = L41_1
L3_1[39] = L42_1
L3_1[40] = L43_1
L3_1[41] = L44_1
L3_1[42] = L45_1
L3_1[43] = L46_1
L3_1[44] = L47_1
L3_1[45] = L48_1
L4_1 = {}
L5_1 = "-command.*curl"
L6_1 = "localgroup Administrators.*/add"
L7_1 = "reg add.*disableantispyware.*\\microsoft\\windows defender\\"
L8_1 = "reg add.*DisableRestrictedAdmin.*CurrentControlSet\\Control\\Lsa"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = contains
L6_1 = L1_1
L7_1 = {}
L8_1 = "powershell.exe"
L9_1 = "pwsh.exe"
L10_1 = "cmd.exe"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = L3_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = L4_1
  L8_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = "nltest"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = contains
    L6_1 = L0_1
    L7_1 = {}
    L8_1 = "domain_trusts"
    L9_1 = "dclist"
    L10_1 = "all_trusts"
    L7_1[1] = L8_1
    L7_1[2] = L9_1
    L7_1[3] = L10_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = "lsass"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = contains
    L6_1 = L0_1
    L7_1 = {}
    L8_1 = "procdump"
    L9_1 = "tasklist"
    L10_1 = "findstr"
    L7_1[1] = L8_1
    L7_1[2] = L9_1
    L7_1[3] = L10_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L5_1 = contains
L6_1 = L1_1
L7_1 = {}
L8_1 = "mshta.exe"
L9_1 = "wget.exe"
L10_1 = "curl.exe"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = "http"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
