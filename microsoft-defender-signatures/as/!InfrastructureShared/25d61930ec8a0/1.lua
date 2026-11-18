-- Threat: !InfrastructureShared
-- Name: 25d61930ec8a0
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 3997696 and 3538944 <= l_0_0 and mp.get_mpattribute("NID:GolangSnake") then
  return mp.INFECTED
end
return mp.CLEAN
