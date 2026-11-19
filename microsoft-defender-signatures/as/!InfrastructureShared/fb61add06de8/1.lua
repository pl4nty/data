-- Threat: !InfrastructureShared
-- Name: fb61add06de8
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 2 or mp.HSTR_WEIGHT == 3 then
  return mp.LOWFI
end
if peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
