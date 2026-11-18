-- Threat: !InfrastructureShared
-- Name: !#Lua:DonoffWithPassword.FileSize
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 == 47104 or l_0_0 == 47574 or l_0_0 == 48128 then
  local l_0_1 = string.lower(mp.getfilename())
  if string.find(l_0_1, "%-%>%(ole stream") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
