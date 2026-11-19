-- Threat: !InfrastructureShared
-- Name: !#SuspiciousCOMfilename
-- Type: 13

local l_0_0 = string.lower(string.sub(mp.getfilename(), -4))
if mp.get_mpattribute("pea_isexe") and l_0_0 == ".com" then
  local l_0_1 = string.lower(mp.getfilename())
  if string.find(l_0_1, ".2017.com", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
