-- Threat: !InfrastructureShared
-- Name: 7b780d6a99a9
-- Type: 21

if peattributes.isdll ~= true and peattributes.hasexports ~= true then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
