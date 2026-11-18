-- Threat: !InfrastructureShared
-- Name: c5781efb7386
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5040000 then
  return mp.INFECTED
end
return mp.CLEAN
