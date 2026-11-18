-- Threat: !InfrastructureShared
-- Name: 2278d2ad67e1
-- Type: 21

if peattributes.no_security == false and peattributes.isdll ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 and l_0_0 < 67108864 then
  local l_0_1 = pe.get_versioninfo()
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1.OriginalFilename
    l_0_2 = string.lower(l_0_2)
    if string.find(l_0_2, "_%w%w+_%w%w+%.exe") ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
