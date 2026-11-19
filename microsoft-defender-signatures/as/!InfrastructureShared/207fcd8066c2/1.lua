-- Threat: !InfrastructureShared
-- Name: 207fcd8066c2
-- Type: 21

if pehdr.NumberOfSections ~= 3 then
  return mp.LOWFI
end
if pesecs[2].Name ~= ".scot" then
  return mp.LOWFI
end
return mp.SUSPICIOUS
