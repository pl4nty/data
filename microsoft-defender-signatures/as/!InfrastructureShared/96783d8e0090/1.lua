-- Threat: !InfrastructureShared
-- Name: 96783d8e0090
-- Type: 21

if mp.HSTR_WEIGHT > 3 and peattributes.ismsil then
  return mp.INFECTED
end
return mp.LOWFI
