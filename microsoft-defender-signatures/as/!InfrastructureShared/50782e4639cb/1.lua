-- Threat: !InfrastructureShared
-- Name: 50782e4639cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 172032 <= l_0_0 and l_0_0 <= 184320 and pehdr.NumberOfSections >= 5 and pehdr.NumberOfSections <= 7 and pesecs[3].Name == "EJf-ov" then
  return mp.INFECTED
end
return mp.CLEAN
