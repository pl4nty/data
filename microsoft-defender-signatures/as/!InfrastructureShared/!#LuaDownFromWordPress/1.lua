-- Threat: !InfrastructureShared
-- Name: !#//Lua:DownFromWordPress
-- Type: 13

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.len(l_0_0) < 12 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = false
if string.find(l_0_0, "/j.mp/", 1, true) or string.find(l_0_0, "/www.j.mp/", 1, true) then
  mp.set_mpattribute("//Lua:SuspUrlDownload")
elseif string.find(l_0_0, "/wp-content/", 1, true) then
  mp.set_mpattribute("Lua:WordPressContent")
  l_0_1 = true
elseif string.find(l_0_0, "/wp-includes/", 1, true) then
  mp.set_mpattribute("Lua:WordPressInclude")
  l_0_1 = true
elseif string.find(l_0_0, "/wp-admin/", 1, true) then
  mp.set_mpattribute("Lua:WordPressAdmin")
  l_0_1 = true
end
if l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN
