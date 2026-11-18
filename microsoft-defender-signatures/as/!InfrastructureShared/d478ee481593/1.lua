-- Threat: !InfrastructureShared
-- Name: d478ee481593
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.LOWFI
