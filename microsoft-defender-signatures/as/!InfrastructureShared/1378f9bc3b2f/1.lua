-- Threat: !InfrastructureShared
-- Name: 1378f9bc3b2f
-- Type: 21

if pehdr.NumberOfSections > 4 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 then
  return mp.CLEAN
end
for l_0_1 = 1, pehdr.NumberOfSections do
  if string.lower(tostring(pesecs[l_0_1].Name)) == ".shell" then
    return mp.INFECTED
  end
end
return mp.CLEAN
