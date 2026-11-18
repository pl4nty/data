-- Threat: !InfrastructureShared
-- Name: 7ab35889fb56
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "explorer.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -10) == "chrome.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -11) == "control.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -17) == "runtimebroker.exe" then
  return mp.CLEAN
end
return mp.INFECTED
