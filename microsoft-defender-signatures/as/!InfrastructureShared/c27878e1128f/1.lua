-- Threat: !InfrastructureShared
-- Name: c27878e1128f
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 221184 and 204800 <= l_0_0 and mp.get_mpattribute("NID:PossibleRyuk") then
  return mp.INFECTED
end
return mp.CLEAN
