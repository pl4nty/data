-- Threat: !InfrastructureShared
-- Name: 19d78b4a87fc9
-- Type: 21

if peattributes.isexe and mp.getfilesize() >= 65536 and mp.getfilesize() <= 1048576 and peattributes.no_security and (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched) then
  return mp.INFECTED
end
return mp.CLEAN
