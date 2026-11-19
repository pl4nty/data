-- Threat: !InfrastructureShared
-- Name: 597895fda697
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() == 77824 then
  return mp.INFECTED
end
return mp.CLEAN
