-- Threat: !InfrastructureShared
-- Name: !#Lua:PE:UpxSection
-- Type: 8

if pehdr.NumberOfSections >= 10 then
  return mp.CLEAN
end
for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == "UPX0" or pesecs[l_0_0].Name == "UPX1" then
    return mp.INFECTED
  end
end
return mp.CLEAN
