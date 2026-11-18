-- Threat: !InfrastructureShared
-- Name: 15b3ce581526
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -10) ~= "chrome.exe" and string.sub(l_0_0, -12) ~= "iexplore.exe" and string.sub(l_0_0, -11) ~= "firefox.exe" and string.sub(l_0_0, -10) ~= "safari.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
