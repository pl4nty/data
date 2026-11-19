-- Threat: !InfrastructureShared
-- Name: 5d612286e346
-- Type: 21

local l_0_0 = mp.getfilesize()
if hstrlog[5].matched and peattributes.no_security == true and 303104 <= l_0_0 and l_0_0 <= 1601536 then
  return mp.INFECTED
end
return mp.CLEAN
