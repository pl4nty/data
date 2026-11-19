-- Threat: !InfrastructureShared
-- Name: c141f6cbfbec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
