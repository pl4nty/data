-- Threat: !InfrastructureShared
-- Name: ce786cf8ba6a
-- Type: 21

if peattributes.ismsil and mp.HSTR_WEIGHT >= 3 and mp.get_mpattribute("SIGA:FileOperationDelete.S001") then
  return mp.INFECTED
end
return mp.LOWFI
