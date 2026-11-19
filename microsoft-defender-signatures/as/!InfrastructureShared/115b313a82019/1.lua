-- Threat: !InfrastructureShared
-- Name: 115b313a82019
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = {
  "lsass.exe",
  "svchost.exe",
  "services.exe",
  "connectionclient.exe"
}
for l_0_2 = 1, #l_0_1 do
  if l_0_0:find(l_0_1[l_0_2], 1, true) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
