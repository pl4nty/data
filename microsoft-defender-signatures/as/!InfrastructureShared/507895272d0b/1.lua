-- Threat: !InfrastructureShared
-- Name: 507895272d0b
-- Type: 21

if pehdr.NumberOfSections > 10 then
  return mp.CLEAN
end
if peattributes.isexe == true and mp.getfilesize() == 122880 and peattributes.no_security == true and pehdr.AddressOfEntryPoint == 24576 then
  for l_0_0 = 1, pehdr.NumberOfSections do
    local l_0_1 = string.lower(pesecs[l_0_0].Name)
    if l_0_1 == ".rcd7cb" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
