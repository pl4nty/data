-- Threat: !InfrastructureShared
-- Name: 2878d58cede6
-- Type: 21

if peattributes.no_security == false or peattributes.isdll ~= true or pehdr.Subsystem ~= 3 then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.OriginalFilename
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "_%w%w+_%w%w+%.dll") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
