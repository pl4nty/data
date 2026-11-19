-- Threat: !InfrastructureShared
-- Name: 4e78dbc2f4ba
-- Type: 21

if mp.get_mpattribute("pea_no_security") and (peattributes.ismsil or mp.get_mpattribute("pea_ismsil")) then
  return mp.INFECTED
end
return mp.CLEAN
