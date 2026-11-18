-- Threat: !InfrastructureShared
-- Name: !#Lua:WebShellImage
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 16 or 1048576 < l_0_0 then
  return mp.CLEAN
end
if 0 == mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1:find("\\Temporary Internet Files\\Content.IE5\\") then
  return mp.CLEAN
end
local l_0_2, l_0_3
l_0_2, l_0_3 = l_0_1:find("%.%w+$")
if nil == l_0_2 then
  return mp.CLEAN
end
local l_0_4 = l_0_1:sub(l_0_2, l_0_3)
local l_0_5 = false
if ".asp" == l_0_4 or ".aspx" == l_0_4 or ".php" == l_0_4 or ".php5" == l_0_4 or ".phtml" == l_0_4 or ".cgi" == l_0_4 or ".pl" == l_0_4 or ".cfm" == l_0_4 or ".cfc" == l_0_4 or ".jsp" == l_0_4 or ".js" == l_0_4 or ".py" == l_0_4 or ".rb" == l_0_4 then
  l_0_5 = true
end
if false == l_0_5 then
  return mp.CLEAN
end
if 3665532023 == mp.crc32(0, headerpage, 1, 3) then
  if 0 ~= mp.FOOTERPAGE_SZ and 1814796034 == mp.crc32(0, footerpage, mp.FOOTERPAGE_SZ - 1, 2) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
