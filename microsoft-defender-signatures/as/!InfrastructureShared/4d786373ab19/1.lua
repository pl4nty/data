-- Threat: !InfrastructureShared
-- Name: 4d786373ab19
-- Type: 21

if peattributes.no_security == false and peattributes.isdll ~= true and pehdr.Subsystem ~= 3 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 1000000 then
  return mp.CLEAN
end
local l_0_1 = pe.IMAGE_DIRECTORY_ENTRY_IMPORT
local l_0_2 = pe.get_versioninfo()
if l_0_2 ~= nil and l_0_1 <= 3 and 1 <= l_0_1 then
  local l_0_3 = l_0_2.OriginalFilename
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_3, "_%w%w+_%w%w+%.dll") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
