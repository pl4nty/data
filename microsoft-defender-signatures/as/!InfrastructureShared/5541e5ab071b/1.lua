local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = isnull
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = isPublicIP
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    if L0_1 then
      goto lbl_24
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_24::
L0_1 = {}
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Accept"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.accept = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Accept-Encoding"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.acceptencoding = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Connection"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.connection = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Date"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.date = L1_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p1
if not L1_1 then
  L1_1 = ""
end
L0_1.dest = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Host"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.host = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpCommand
L1_1 = L1_1()
if not L1_1 then
  L1_1 = ""
end
L0_1.httpmethod = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "Server"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.server = L1_1
L1_1 = nri
L1_1 = L1_1.GetHttpRequestHeader
L2_1 = "User-Agent"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1.useragent = L1_1
L1_1 = nri
L1_1 = L1_1.AddTelemetry
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = nri
L4_1 = L4_1.Telemetry_HOSTNAME
L5_1 = nri
L5_1 = L5_1.Telemetry_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = nri
L4_1 = L4_1.Telemetry_QUERY
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
