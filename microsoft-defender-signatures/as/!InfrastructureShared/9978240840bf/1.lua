-- Threat: !InfrastructureShared
-- Name: 9978240840bf
-- Type: 21

if peattributes.ismsil then
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched and pehdr.NumberOfSections == 3 then
    return mp.INFECTED
  end
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[6].matched and hstrlog[7].matched and hstrlog[8].matched and pehdr.NumberOfSections == 3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
