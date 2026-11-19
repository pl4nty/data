-- Threat: !InfrastructureShared
-- Name: bd78b45e37b9
-- Type: 21
-- Flags: 1

if peattributes.isdll and peattributes.hasexports then
  if mp.HSTR_WEIGHT == 16 then
    return mp.SUSPICIOUS
  end
  return mp.INFECTED
end
return mp.CLEAN
