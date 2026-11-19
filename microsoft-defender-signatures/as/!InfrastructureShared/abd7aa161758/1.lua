-- Threat: !InfrastructureShared
-- Name: abd7aa161758
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if l_0_2 == "w3wp.exe" or l_0_2 == "sqlservr.exe" or l_0_2 == "httpd.exe" or string.find(l_0_2, "tomcat", 1, true) then
    local l_0_3 = mp.GetScannedPPID()
    if l_0_3 == "" or l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = mp.GetProcessCommandLine(l_0_3)
    if not l_0_4 then
      return mp.CLEAN
    end
    local l_0_5 = "(?i)\\-outfile .*\\.(exe|dll)"
    local l_0_6, l_0_7 = MpCommon.StringRegExpSearch(l_0_5, l_0_4)
    if l_0_6 == true then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
