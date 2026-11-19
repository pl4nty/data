-- Threat: !InfrastructureShared
-- Name: d0b3e27c764d
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = string.lower(string.sub(bm.get_imagepath(), -12))
if l_0_4 == "\\msiexec.exe" then
  l_0_1, l_0_2 = string.find(l_0_0, "\".*%.ps1\"", 1, false)
  if l_0_1 ~= nil then
    l_0_3 = string.sub(l_0_0, l_0_1 + 1, l_0_2 - 1)
    if sysio.IsFileExists(l_0_3) then
      bm.add_threat_file(l_0_3)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
