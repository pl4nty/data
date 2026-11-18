-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ShinyBeehive.F!dha
-- Type: 13
-- MpAttributes: SCPT:ShinyBeehive.A & SCPT:ShinyBeehive.J & SCPT:ShinyBeehive.K & SCPT:ShinyBeehive.D & SCPT:ShinyBeehive.E & SCPT:ShinyBeehive.F

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
l_0_0 = l_0_0:match("^(.*\\)")
local l_0_1 = tostring(headerpage) .. tostring(footerpage)
for l_0_2 in l_0_1:gmatch("[^\r\n]+") do
  local l_0_3 = l_0_2:match("^App%d+%s*=%s*([%w%._%-]+%.exe)$")
  if l_0_3 then
    l_0_3 = l_0_0 .. l_0_3
    if sysio.IsFileExists(l_0_3) then
      mp.ReportLowfi(l_0_3, 2341576232)
    end
  end
end
return mp.INFECTED
