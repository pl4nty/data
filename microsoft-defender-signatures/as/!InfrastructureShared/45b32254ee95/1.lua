-- Threat: !InfrastructureShared
-- Name: 45b32254ee95
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = string.lower(bm.get_imagepath())
if l_0_1 then
  local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
  if l_0_2 == "installutil.exe" then
    return mp.CLEAN
  end
end
if l_0_0 ~= nil then
  if not string.find(string.lower(l_0_0), " /u ", 1, true) or not string.find(string.lower(l_0_0), "/logfile= ", 1, true) then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "/installstatedir=", 1, true) or string.find(string.lower(l_0_0), "upmWmi", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) then
      mp.ReportLowfi(l_0_5, 2023886462)
      bm.add_related_file(l_0_5)
    end
  end
end
bm.add_action("EmsScan", 3000)
return mp.INFECTED
