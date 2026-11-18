-- Threat: !InfrastructureShared
-- Name: a578140a535b
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.readfile(15437, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 == 4018468997 then
  local l_0_2 = "\198\208\212\199\214\221\155\219\212\216\208\196\192\208\199\204\155\214\218\216"
  l_0_0 = mp.readfile(15473, 20)
  if l_0_0 ~= l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
