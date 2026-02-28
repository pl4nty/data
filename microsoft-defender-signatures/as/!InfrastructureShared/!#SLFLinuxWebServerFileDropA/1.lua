local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
L1_1 = false
L2_1 = MpCommon
L2_1 = L2_1.GetPersistContextNoPath
L3_1 = "webserver_conf_root"
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if 0 < L3_1 then
    L3_1 = ipairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L0_1
      L10_1 = L7_1
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L1_1 = true
        break
      end
    end
end
else
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "/var/www/"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L1_1 = true
  end
end
if L1_1 then
  L3_1 = {}
  L4_1 = "/run/nginx.pid"
  L5_1 = "/run/lighttpd.pid"
  L6_1 = "/run/apache2/apache2.pid"
  L7_1 = "/run/httpd/httpd.pid"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
