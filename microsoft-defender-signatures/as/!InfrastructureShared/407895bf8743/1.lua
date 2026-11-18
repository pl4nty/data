-- Threat: !InfrastructureShared
-- Name: 407895bf8743
-- Type: 21

if mp.HSTR_WEIGHT == 2 and hstrlog[2].hitcount > 30 then
  return mp.INFECTED
end
return mp.CLEAN
