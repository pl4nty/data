-- Threat: !InfrastructureShared
-- Name: 11b789f3e8b1b
-- Type: 21

if peattributes.hasstandardentry == true or peattributes.isdll == false or peattributes.hasexports == false or pehdr.SizeOfImage >= 393216 then
  return mp.CLEAN
end
local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched
local l_0_1 = hstrlog[8].matched or hstrlog[9].matched
local l_0_2 = hstrlog[10].matched or hstrlog[11].matched
local l_0_3 = hstrlog[12].matched
local l_0_4 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0)
if 2 <= l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
