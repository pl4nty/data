-- Threat: !InfrastructureShared
-- Name: 71b38a78c778
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\chrome.exe", 1, true) or string.find(l_0_0, "\\opera.exe", 1, true) or string.find(l_0_0, "\\360se.exe", 1, true) or string.find(l_0_0, "\\brave.exe", 1, true) or string.find(l_0_0, "\\msedge.exe", 1, true) or string.find(l_0_0, "\\vivaldi.exe", 1, true) or string.find(l_0_0, "\\sogouexplorer.exe", 1, true) or string.find(l_0_0, "\\browser.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\appdata\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
