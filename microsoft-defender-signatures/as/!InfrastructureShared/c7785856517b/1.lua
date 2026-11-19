-- Threat: !InfrastructureShared
-- Name: c7785856517b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.get_mpattribute("Lua:PeCompanyName!nil") and mp.getfilesize() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
