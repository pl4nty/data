-- Threat: !InfrastructureShared
-- Name: 287858165265
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("HSTR:MSIL/Confuser") then
  return mp.INFECTED
end
return mp.CLEAN
