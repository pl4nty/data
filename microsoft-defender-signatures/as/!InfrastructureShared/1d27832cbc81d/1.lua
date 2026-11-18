-- Threat: !InfrastructureShared
-- Name: 1d27832cbc81d
-- Type: 21

if (hstrlog[12].matched and hstrlog[13].matched or hstrlog[14].matched and hstrlog[15].matched) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
