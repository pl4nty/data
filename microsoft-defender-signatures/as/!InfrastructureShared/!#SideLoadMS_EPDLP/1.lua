-- Threat: !InfrastructureShared
-- Name: !#SideLoad:MS_EPDLP
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & SIGATTR:SideLoad:MS_EPDLP

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_CNAME))
if not l_0_0 or not #l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("LUA:PeFileVersion")
if not l_0_1 or not #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1[1]:match("!([%d.]+)")
if l_0_2 == "4.18.25110.5" then
  local l_0_3 = mp.getfilesize()
  if not l_0_3 or l_0_3 < 1500000 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_4 = mp.readfile(358304, 2)
  mp.readprotection(true)
  if l_0_4 == "H\131" then
    mp.ReportLowfi(l_0_0, 3957269496)
  else
    mp.ReportLowfi(l_0_0, 1926656578)
  end
end
return mp.CLEAN
