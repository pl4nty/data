-- Threat: !InfrastructureShared
-- Name: 5378ab2399c2
-- Type: 21

if pehdr.NumberOfSections >= 7 then
  return mp.CLEAN
end
for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == ".ndata" then
    return mp.INFECTED
  end
end
return mp.CLEAN
