-- Threat: !InfrastructureShared
-- Name: 45409d853268
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() == 7680 then
  return mp.INFECTED
end
return mp.CLEAN
