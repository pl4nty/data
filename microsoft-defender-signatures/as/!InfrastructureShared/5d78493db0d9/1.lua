-- Threat: !InfrastructureShared
-- Name: 5d78493db0d9
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 520192 <= l_0_0 and l_0_0 <= 589824 and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 and pesecs[2].Name == ".jnbcf" then
  return mp.INFECTED
end
return mp.CLEAN
