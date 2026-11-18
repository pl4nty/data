-- Threat: !InfrastructureShared
-- Name: 5d61cc79a4a2
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 1024 <= l_0_0 and l_0_0 <= 10240 and peattributes.isdll and (hstrlog[1].matched and hstrlog[3].matched and hstrlog[4].matched and hstrlog[2].matched or hstrlog[1].matched and hstrlog[5].matched and hstrlog[6].matched and hstrlog[2].matched) then
  return mp.INFECTED
end
return mp.CLEAN
