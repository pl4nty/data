-- Threat: !InfrastructureShared
-- Name: 4cb382521bf6
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  if l_0_0:find("\\\\.\\pipe\\local\\chrome.nativemessaging", 1, true) then
    return mp.CLEAN
  elseif l_0_0:find("\\\\.\\pipe\\mpvsocket", 1, true) then
    return mp.CLEAN
  end
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5 = string.lower(l_0_4.image_path)
  if string.find(l_0_5, "\\svchost.exe", 1, true) or string.find(l_0_5, "\\services.exe", 1, true) or string.find(l_0_5, "\\clickonceforgooglechrome.exe", 1, true) or string.find(l_0_5, "\\evolvecontactagent.exe", 1, true) or string.find(l_0_5, "\\chrome.exe", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
