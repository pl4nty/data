-- Threat: !InfrastructureShared
-- Name: b478834b9b4e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 122880 <= l_0_0 and l_0_0 <= 131072 and (pehdr.NumberOfSections >= 4 or pehdr.NumberOfSections <= 7) then
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
    return mp.INFECTED
  end
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[4].matched then
    return mp.INFECTED
  end
  if hstrlog[1].matched and hstrlog[4].matched and hstrlog[5].matched then
    return mp.INFECTED
  end
end
return mp.CLEAN
