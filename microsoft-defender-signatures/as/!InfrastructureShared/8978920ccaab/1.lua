-- Threat: !InfrastructureShared
-- Name: 8978920ccaab
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
