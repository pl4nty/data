-- Threat: !InfrastructureShared
-- Name: 2c78da481f5c
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = hstrlog[1].hitcount
end
if 3 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
