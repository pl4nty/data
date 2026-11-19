-- Threat: !InfrastructureShared
-- Name: 4f4b351ee0dbe
-- Type: 21

local l_0_0
if this_sigattrlog[15].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[15].utf8p2)
elseif this_sigattrlog[16].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[16].utf8p2)
elseif this_sigattrlog[17].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[17].utf8p2)
end
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if string.find(string.lower(l_0_2), "/library/preferences/com.apple.loginwindow.plist", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.INFECTED
