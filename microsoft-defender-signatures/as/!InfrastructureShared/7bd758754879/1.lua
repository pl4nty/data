-- Threat: !InfrastructureShared
-- Name: 7bd758754879
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and string.lower(string.sub(l_0_0.image_path, -9)) == "httpd.exe" then
  return mp.INFECTED
end
return mp.CLEAN
