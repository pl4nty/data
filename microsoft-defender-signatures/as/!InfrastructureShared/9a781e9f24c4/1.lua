-- Threat: !InfrastructureShared
-- Name: 9a781e9f24c4
-- Type: 21

local l_0_0 = pe.get_exports()
if peattributes.isexe and peattributes.no_security and #l_0_0 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
