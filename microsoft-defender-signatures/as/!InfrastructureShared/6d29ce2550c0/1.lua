-- Threat: !InfrastructureShared
-- Name: 6d29ce2550c0
-- Type: 21

local l_0_0 = string.lower(tostring(footerpage))
l_0_0 = string.gsub(l_0_0, "[ \n\r\t]", "")
l_0_0 = string.gsub(l_0_0, "&?chrw%((%d+)%)", string.char)
l_0_0 = string.gsub(l_0_0, "&?chrw%((%d+)%+?%-(%d+)%)", function(l_1_0, l_1_1)
  return string.char(l_1_0 - l_1_1)
end)
l_0_0 = string.gsub(l_0_0, "&?chrw%((%d+)%+(%d+)%)", function(l_2_0, l_2_1)
  return string.char(l_2_0 + l_2_1)
end)
l_0_0 = string.gsub(l_0_0, "&?string%(\"(.?)\"%)", "%1")
l_0_0 = string.gsub(l_0_0, "&?\"(.)\"", "%1")
l_0_0 = string.gsub(l_0_0, "&string%(%.%)", ".")
l_0_0 = string.lower(l_0_0)
if string.match(l_0_0, "\\googleupdate.lnk%).*thenfilecreateshortcut%(.*\\googlechrome.*exe,@startupcommondir\\googleupdate.lnk,") then
  return mp.INFECTED
end
return mp.LOWFI
