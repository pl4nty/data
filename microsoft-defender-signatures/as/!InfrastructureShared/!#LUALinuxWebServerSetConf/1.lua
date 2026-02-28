local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1 = L1_1(L2_1)
L2_1 = ""
if L1_1 == "/etc/apache2/sites-available" and L0_1 == "apache2" then
  L2_1 = "^%s*DocumentRoot%s+(/.-)/?$"
elseif L1_1 == "/etc/httpd/conf" and L0_1 == "httpd" then
  L2_1 = "^%s*<Directory%s+\"(/.-)/?\">$"
elseif L1_1 == "/etc/lighttpd" and L0_1 == "lighttpd" then
  L2_1 = "^%s*server%.document%-root%s+=%s+\"(/.-)/?\"$"
elseif L1_1 == "/etc/nginx/sites-available" and L0_1 == "nginx" then
  L2_1 = "^%s*root%s+(/.-)/?;$"
else
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
L4_1 = ""
L5_1 = mp
L5_1 = L5_1.HEADERPAGE_SZ
if L3_1 <= L5_1 then
  L5_1 = tostring
  L6_1 = headerpage
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
else
  L5_1 = mp
  L5_1 = L5_1.HEADERPAGE_SZ
  L6_1 = mp
  L6_1 = L6_1.FOOTERPAGE_SZ
  L5_1 = L5_1 + L6_1
  if L3_1 <= L5_1 then
    L5_1 = tostring
    L6_1 = headerpage
    L5_1 = L5_1(L6_1)
    L6_1 = tostring
    L7_1 = footerpage
    L6_1 = L6_1(L7_1)
    L4_1 = L5_1 .. L6_1
  else
    L5_1 = mp
    L5_1 = L5_1.readprotection
    L6_1 = false
    L5_1(L6_1)
    L5_1 = tostring
    L6_1 = mp
    L6_1 = L6_1.readfile
    L7_1 = 0
    L8_1 = L3_1
    L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L6_1(L7_1, L8_1)
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    L4_1 = L5_1
    L5_1 = mp
    L5_1 = L5_1.readprotection
    L6_1 = true
    L5_1(L6_1)
  end
end
L5_1 = "webserver_conf_root"
L6_1 = StringSplit
L7_1 = L4_1
L8_1 = "\n"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = false
L8_1 = MpCommon
L8_1 = L8_1.SetPersistContextNoPath
L9_1 = L5_1
L10_1 = {}
L11_1 = 0
L8_1(L9_1, L10_1, L11_1)
L8_1 = ipairs
L9_1 = L6_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L12_1
  L15_1 = L2_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 then
    L7_1 = true
    L14_1 = MpCommon
    L14_1 = L14_1.AppendPersistContextNoPath
    L15_1 = L5_1
    L16_1 = L13_1
    L17_1 = 4294967295
    L14_1(L15_1, L16_1, L17_1)
  end
end
if L7_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
