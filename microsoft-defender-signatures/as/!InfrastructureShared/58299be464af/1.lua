-- Threat: !InfrastructureShared
-- Name: 58299be464af
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 then
  l_0_0 = string.lower(l_0_0)
  if l_0_0:find("viewer.aspx", 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("\\appdata\\.+\\outlook\\.+autodiscover.xml") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
