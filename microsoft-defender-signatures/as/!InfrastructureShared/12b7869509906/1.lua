-- Threat: !InfrastructureShared
-- Name: 12b7869509906
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
