-- Threat: !InfrastructureShared
-- Name: 37783e572ce2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 33554432 < l_0_0 or (peattributes.isdll or peattributes.no_security) == false then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil then
  local l_0_2 = l_0_1.OriginalFilename
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "_%w%w+_%w%w+%.exe") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
