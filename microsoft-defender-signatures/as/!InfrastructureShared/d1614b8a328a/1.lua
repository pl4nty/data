-- Threat: !InfrastructureShared
-- Name: d1614b8a328a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched and hstrlog[6].matched and (hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched) then
  return mp.INFECTED
end
return mp.CLEAN
