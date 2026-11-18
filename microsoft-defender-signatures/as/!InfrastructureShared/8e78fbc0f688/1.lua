-- Threat: !InfrastructureShared
-- Name: 8e78fbc0f688
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 4 or mp.HSTR_WEIGHT == 5 then
  return mp.LOWFI
end
if peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
