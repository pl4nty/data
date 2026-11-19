-- Threat: !InfrastructureShared
-- Name: 82784e73f147
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
