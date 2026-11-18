-- Threat: !InfrastructureShared
-- Name: 15f8f90883216
-- Type: 21

if mp.get_mpattribute("InEmail") then
  if mp.HSTR_WEIGHT >= 21 then
    return mp.INFECTED
  else
    return mp.LOWFI
  end
elseif mp.HSTR_WEIGHT >= 21 then
  return mp.LOWFI
end
return mp.CLEAN
