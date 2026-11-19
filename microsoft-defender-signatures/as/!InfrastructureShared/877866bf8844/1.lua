-- Threat: !InfrastructureShared
-- Name: 877866bf8844
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 32768 then
  return mp.INFECTED
end
return mp.CLEAN
