-- Threat: !InfrastructureShared
-- Name: 337892859bba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
