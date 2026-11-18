-- Threat: !InfrastructureShared
-- Name: 25408fb513f6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
