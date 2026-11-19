-- Threat: !InfrastructureShared
-- Name: 217865390fae
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
