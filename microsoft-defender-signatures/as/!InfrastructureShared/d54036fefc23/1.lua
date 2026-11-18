-- Threat: !InfrastructureShared
-- Name: d54036fefc23
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
