-- Threat: !InfrastructureShared
-- Name: 2a783c149e58
-- Type: 21

if pehdr.NumberOfSections ~= 9 or hstrlog[1].VA ~= 4214784 then
  return mp.CLEAN
end
return mp.INFECTED
